import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "I am Rich",
          ),
          backgroundColor: Color(0xFF000000),
        ),
        backgroundColor: Colors.amber,
        body: Center(
          child: Image(
            image: NetworkImage('https://www.usnews.com/dims4/USNEWS/691813d/2147483647/resize/1200x%3E/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F16%2F7e%2Fdb70a6cd4611b0f82e3bd4bf0cd8%2F1-intro-getty.jpg'),
          ),
        ),
      ),
    ),
  );
}
