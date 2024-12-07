// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:ecombloc/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:ecombloc/features/setting/presentation/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/bdd_hooks/hooks.dart';
import './../test/step/the_app_is_running.dart';
import './../test/step/i_should_see_a_textfield_for_search.dart';
import './../test/step/i_should_see_a_pageview_widget.dart';
import './../test/step/i_should_see_a_widget.dart';
import './../test/step/i_see_a_list_of_categories.dart';
import './../test/step/i_see_a_list_of_products.dart';
import './../test/step/i_enter_into_input_field.dart';
import './../test/step/i_should_see_search_results_related_to.dart';
import './../test/step/i_tap_on_the_widget_for_the_favorit_tab.dart';
import './../test/step/the_pageview_should_jump_to_the_page_and_show_the_text.dart';
import './../test/step/i_tap_on_the_widget_for_the_cart_tab.dart';
import './../test/step/i_tap_on_the_widget_for_the_profile_tab.dart';
import './../test/step/i_tap_icon.dart';
import './../test/step/i_should_be_navigated_to_the_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Hooks.beforeAll();
  });
  tearDownAll(() async {
    await Hooks.afterAll();
  });

  group('''Home Page Functionality''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppIsRunning(tester);
    }

    Future<void> beforeEach(String title, [List<String>? tags]) async {
      await Hooks.beforeEach(title, tags);
    }

    Future<void> afterEach(String title, bool success,
        [List<String>? tags]) async {
      await Hooks.afterEach(title, success, tags);
    }

    testWidgets(
        '''Displaying the Home Page with Search, Categories, and Products''',
        (tester) async {
      var success = true;
      try {
        await beforeEach(
            '''Displaying the Home Page with Search, Categories, and Products''');
        await bddSetUp(tester);
        await iShouldSeeATextfieldForSearch(tester);
        await iShouldSeeAPageviewWidget(tester);
        await iShouldSeeAWidget(tester, const BottomNav());
        await iSeeAListOfCategories(tester);
        await iSeeAListOfProducts(tester);
      } on TestFailure {
        success = false;
        rethrow;
      } finally {
        await afterEach(
          '''Displaying the Home Page with Search, Categories, and Products''',
          success,
        );
      }
    });
    testWidgets('''Searching for a Product''', (tester) async {
      var success = true;
      try {
        await beforeEach('''Searching for a Product''');
        await bddSetUp(tester);
        await iEnterIntoInputField(tester, "fg", const TextField());
        await iShouldSeeSearchResultsRelatedTo(tester, 'fg');
      } on TestFailure {
        success = false;
        rethrow;
      } finally {
        await afterEach(
          '''Searching for a Product''',
          success,
        );
      }
    });
    testWidgets('''Navigating to the Favorit Page''', (tester) async {
      var success = true;
      try {
        await beforeEach('''Navigating to the Favorit Page''');
        await bddSetUp(tester);
        await iTapOnTheWidgetForTheFavoritTab(
            tester, Icons.favorite, const BottomNav());
        await thePageviewShouldJumpToThePageAndShowTheText(tester, 1, "fav");
      } on TestFailure {
        success = false;
        rethrow;
      } finally {
        await afterEach(
          '''Navigating to the Favorit Page''',
          success,
        );
      }
    });
    testWidgets('''Navigating to the Cart Page''', (tester) async {
      var success = true;
      try {
        await beforeEach('''Navigating to the Cart Page''');
        await bddSetUp(tester);
        await iTapOnTheWidgetForTheCartTab(
            tester, Icons.shopping_bag, const BottomNav());
        await thePageviewShouldJumpToThePageAndShowTheText(tester, 2, "cart");
      } on TestFailure {
        success = false;
        rethrow;
      } finally {
        await afterEach(
          '''Navigating to the Cart Page''',
          success,
        );
      }
    });
    testWidgets('''Navigating to the Profile Page''', (tester) async {
      var success = true;
      try {
        await beforeEach('''Navigating to the Profile Page''');
        await bddSetUp(tester);
        await iTapOnTheWidgetForTheProfileTab(
            tester, Icons.person, const BottomNav());
        await thePageviewShouldJumpToThePageAndShowTheText(
            tester, 3, "profile");
      } on TestFailure {
        success = false;
        rethrow;
      } finally {
        await afterEach(
          '''Navigating to the Profile Page''',
          success,
        );
      }
    });
    testWidgets('''Accessing the Settings Page''', (tester) async {
      var success = true;
      try {
        await beforeEach('''Accessing the Settings Page''');
        await bddSetUp(tester);
        await iTapIcon(tester, Icons.settings);
        await iShouldBeNavigatedToThePage(tester, Setting);
      } on TestFailure {
        success = false;
        rethrow;
      } finally {
        await afterEach(
          '''Accessing the Settings Page''',
          success,
        );
      }
    });
  });
}
