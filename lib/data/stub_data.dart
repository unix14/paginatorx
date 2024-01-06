import 'package:paginatorx/models/SimpleListItem.dart';
// import 'package:flutter/material.dart';

class StubData {
  static List<SimpleListItem> generateData({int size = 40}) {
    //todo use math max function instead of this if?? or maybe not - we're trying to mkae this lib independant as possible
    if (size > 150) {
      size = 150; // Limit the size to 150
    }

    // var rng = new Random();
    return List<SimpleListItem>.generate(
        size,
        (i) => SimpleListItem(
              // Color.fromRGBO(
              //   rng.nextInt(256), // R
              //   rng.nextInt(256), // G
              //   rng.nextInt(256), // B
              //   1, // Opacity
              // ),
              i,
            ));
  }
}
