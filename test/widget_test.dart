import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnapk/app/app.dart';

void main() {
  testWidgets("Learning Test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(Container), findsOneWidget);
    expect(find.text("Hello jii"), findsOneWidget);
  });
}
