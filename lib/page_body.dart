import 'package:flutter/material.dart';

Widget pageBody(String imgUrl, String title, String description) {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(imgUrl),
          Text(
            title,
            style: TextStyle(
              fontSize: 40,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black26,
            ),
          )
        ],
      )
  );
}
