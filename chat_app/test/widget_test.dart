import 'package:chat_app/chatapphome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets(
    'Check if the text widget is 0 initially',
    (tester) async{
      await tester.pumpWidget(const MaterialApp(home: ChatAppHomepage()));
      final ctr = find.text('0');
      expect(ctr, findsOneWidget);
    
      final btn = find.byTooltip('increment');
      await tester.tap(btn);

      await tester.pump();
      final ctr1 = find.text('1');
      expect(ctr1, findsOneWidget);

      final appbar = find.byType(AppBar);
      expect(appbar, findsOneWidget);
    }
  );
}