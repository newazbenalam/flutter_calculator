import 'package:flutter/material.dart';

Color colorSeed = const Color.fromARGB(255, 135, 104, 206);
Color secondary = colorSeed.withOpacity(0.89);
const double h1 = 38;
const double h2 = 32;

const SliverGridDelegate gridDelegate =
    SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 1.2);

const SliverGridDelegate gridDelegateFoo =
    SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 1,
  crossAxisSpacing: 0.0,
  mainAxisSpacing: 0.0,
);

ButtonStyle myStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(0.0),
)));

ButtonStyle equalStyle = ButtonStyle(
    backgroundColor:
        const MaterialStatePropertyAll(Color.fromARGB(255, 37, 43, 70)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    )));

ButtonStyle fooStyle = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(colorSeed.withGreen(80)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    )));
