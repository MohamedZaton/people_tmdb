import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:people_tmdb/pages/home/home_view.dart';
import 'package:people_tmdb/tools/constants.dart';

void main() {
  testWidgets("home scrolling", (widgetTester) async {
    // find key widget
    final scrollLazyFind = find.byKey(ValueKey(kLazyScrollKey));
    // execute actual test
    await widgetTester.pumpWidget(MaterialApp(home: HomePage()));
    await widgetTester.pump();
    // check output
    expect(scrollLazyFind, findsOneWidget);
  });
}
