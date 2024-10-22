import 'package:flutter/material.dart';

/// Creates a list tile for the navigation drawer.
/// 
/// Parameters:
///   - title: The title to display on the list tile.
///   - onTap: The callback function triggered when the list tile is tapped.
/// 
/// Returns:
///   A ListTile widget with the specified title and onTap callback.
  ListTile drawerListTile(
      {required String title, required VoidCallback onTap}) {
    return ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.teal.shade100),
        ),
        onTap: onTap);
  }