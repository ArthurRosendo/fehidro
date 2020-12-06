// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/screens/Avaliacao/Avaliacao_detalhe.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await _createWidget(tester);

    // Verify that our counter starts at 0.
    expect(find.text('Nome projeto'), findsOneWidget);

    expect(find.text('Nome instituição'), findsOneWidget);

    expect(find.text('Nome Avaliador'), findsOneWidget);

    expect(find.text('Email'), findsOneWidget);

    expect(find.text('Pontuação'), findsOneWidget);


    expect(find.text('Desclassificavel'), findsOneWidget);

    expect(find.text('Titulo Pontuação'), findsOneWidget);
    expect(find.text('Subcritério Titulo'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.pump();


  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      title: 'teste avaliação detalhe',
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: AvaliacaoDetalhe(),
    ),
  );

  await tester.pump();
}
