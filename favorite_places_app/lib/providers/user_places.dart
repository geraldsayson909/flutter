import 'dart:io';

import 'package:favorite_places_app/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)');
    },
    version: 1,
  );
  return db;
}

class UserPlacesNotifer extends StateNotifier<List<Place>> {
  UserPlacesNotifer() : super(const []);

  Future<void> clearPlaces() async {
    final db = await _getDatabase();
    await db.delete('user_places');
    state = []; 
  }

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = <Place>[];

    for (var row in data) {
      final filePath = row['image'] as String;
      final file = File(filePath);

      if (await file.exists()) {
        final place = Place(
          id: row['id'] as String,
          title: row['title'] as String,
          image: file,
          location: PlaceLocation(
            latitude: row['lat'] as double,
            longitude: row['lng'] as double,
            address: row['address'] as String,
          ),
        );
        places.add(place);
      } else {
        print('File does not exist or is empty: $filePath');
      }
    }

    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    try {
      final appDir = await syspaths.getApplicationDocumentsDirectory();
      final filename = path.basename(image.path);
      final newPath = '${appDir.path}/$filename';

      final fileExists = await image.exists();
      if (!fileExists) {
        print('Image does not exist.');
        return;
      }

      final imageLength = await image.length();
      if (imageLength == 0) {
        print('Image is empty.');
        return;
      }

      final copiedImage = await image.copy(newPath);
      print('location $location');

      final newPlace = Place(
        title: title,
        image: copiedImage,
        location: location,
      );

      final db = await _getDatabase();

      await db.insert('user_places', {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'lat': newPlace.location.latitude,
        'lng': newPlace.location.longitude,
        'address': newPlace.location.address,
      });

      state = [newPlace, ...state];
      print('Updated state: $state');
    } catch (e) {
      print('Error: $e');
    }
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifer, List<Place>>(
        (ctx) => UserPlacesNotifer());
