import 'package:flutter/material.dart';
import 'package:flutter_example_widget_test/provider/favourite_list_provider.dart';
import 'package:flutter_example_widget_test/screen/favourites.dart';
import 'package:flutter_example_widget_test/screen/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

late FavouriteProvider favProvider;

Widget createWidget(Widget child) {
  return ChangeNotifierProvider<FavouriteProvider>(
    create: (context) {
      favProvider = FavouriteProvider();
      return favProvider;
    },
    child: MaterialApp(home: child),
  );
}

/// moak list of favs items
void _addItems() {
  for (int i = 0; i < 6; i++) {
    favProvider.addToList(i);
  }
}

void main() {
  group("Favourites Page all widgets tests: ", () {
    /// testing scrollable widget
    testWidgets("finds one scrollable widget", (tester) async {
      await tester.pumpWidget(createWidget(const FavouritesPage()));
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    /// testing if listview elements shows up
    testWidgets("listview elements tests", (tester) async {
      await tester.pumpWidget(createWidget(const FavouritesPage()));
      _addItems();
      await tester.pumpAndSettle();
      int totalItems = tester.allWidgets.length;
      await tester.tap(find.byIcon(Icons.clear).first);
      await tester.pumpAndSettle();
      expect(tester.allWidgets.length, lessThan(totalItems));
      expect(find.byIcon(Icons.clear), findsWidgets);
    });

    /// scrolling test - HomePage
    testWidgets(
      "scrolling through scrollable widget and test specific widget",
      (tester) async {
        await tester.pumpWidget(createWidget(const HomePage()));

        await tester.scrollUntilVisible(find.byKey(const ValueKey("text_17_text")), 20.0, scrollable: find.byType(Scrollable));

        expect(find.byKey(const ValueKey("text_17_text")), findsOneWidget);
      },
    );
  });
}
