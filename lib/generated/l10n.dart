// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{repoName} GitHub repository`
  String githubRepo(Object repoName) {
    return Intl.message(
      '$repoName GitHub repository',
      name: 'githubRepo',
      desc: 'Represents a link to a GitHub repository.',
      args: [repoName],
    );
  }

  /// `To see the source code for this app, please visit the {repoLink}.`
  String aboutDialogDescription(Object repoLink) {
    return Intl.message(
      'To see the source code for this app, please visit the $repoLink.',
      name: 'aboutDialogDescription',
      desc: 'A description about how to view the source code for this app.',
      args: [repoLink],
    );
  }

  /// `SIGN IN`
  String get signIn {
    return Intl.message(
      'SIGN IN',
      name: 'signIn',
      desc: 'Sign in label to sign into website.',
      args: [],
    );
  }

  /// `Your password was updated on your other device. Please sign in again.`
  String get bannerDemoText {
    return Intl.message(
      'Your password was updated on your other device. Please sign in again.',
      name: 'bannerDemoText',
      desc:
          'Password was updated on a different device and the user is required to sign in again',
      args: [],
    );
  }

  /// `Reset the banner`
  String get bannerDemoResetText {
    return Intl.message(
      'Reset the banner',
      name: 'bannerDemoResetText',
      desc: 'Show the Banner to the user again.',
      args: [],
    );
  }

  /// `Multiple actions`
  String get bannerDemoMultipleText {
    return Intl.message(
      'Multiple actions',
      name: 'bannerDemoMultipleText',
      desc:
          'When the user clicks this button the Banner will toggle multiple actions or a single action',
      args: [],
    );
  }

  /// `Leading Icon`
  String get bannerDemoLeadingText {
    return Intl.message(
      'Leading Icon',
      name: 'bannerDemoLeadingText',
      desc:
          'If user clicks this button the leading icon in the Banner will disappear',
      args: [],
    );
  }

  /// `DISMISS`
  String get dismiss {
    return Intl.message(
      'DISMISS',
      name: 'dismiss',
      desc:
          'When text is pressed the banner widget will be removed from the screen.',
      args: [],
    );
  }

  /// `Back to Gallery`
  String get backToGallery {
    return Intl.message(
      'Back to Gallery',
      name: 'backToGallery',
      desc:
          'Semantic label for back button to exit a study and return to the gallery home page.',
      args: [],
    );
  }

  /// `Tappable`
  String get cardsDemoTappable {
    return Intl.message(
      'Tappable',
      name: 'cardsDemoTappable',
      desc: 'The user can tap this button',
      args: [],
    );
  }

  /// `Selectable (long press)`
  String get cardsDemoSelectable {
    return Intl.message(
      'Selectable (long press)',
      name: 'cardsDemoSelectable',
      desc:
          'If the user taps and hold this card. The card will toggled between on and off.',
      args: [],
    );
  }

  /// `Explore`
  String get cardsDemoExplore {
    return Intl.message(
      'Explore',
      name: 'cardsDemoExplore',
      desc: 'Click to see more about the content in the cards demo.',
      args: [],
    );
  }

  /// `Explore {destinationName}`
  String cardsDemoExploreSemantics(Object destinationName) {
    return Intl.message(
      'Explore $destinationName',
      name: 'cardsDemoExploreSemantics',
      desc:
          'Semantics label for Explore. Label tells user to explore the destinationName to the user. Example Explore Tamil',
      args: [destinationName],
    );
  }

  /// `Share {destinationName}`
  String cardsDemoShareSemantics(Object destinationName) {
    return Intl.message(
      'Share $destinationName',
      name: 'cardsDemoShareSemantics',
      desc:
          'Semantics label for Share. Label tells user to share the destinationName to the user. Example Share Tamil',
      args: [destinationName],
    );
  }

  /// `Top 10 Cities to Visit in Tamil Nadu`
  String get cardsDemoTravelDestinationTitle1 {
    return Intl.message(
      'Top 10 Cities to Visit in Tamil Nadu',
      name: 'cardsDemoTravelDestinationTitle1',
      desc: 'The top 10 cities that you can visit in Tamil Nadu',
      args: [],
    );
  }

  /// `Number 10`
  String get cardsDemoTravelDestinationDescription1 {
    return Intl.message(
      'Number 10',
      name: 'cardsDemoTravelDestinationDescription1',
      desc: 'Number 10',
      args: [],
    );
  }

  /// `Thanjavur`
  String get cardsDemoTravelDestinationCity1 {
    return Intl.message(
      'Thanjavur',
      name: 'cardsDemoTravelDestinationCity1',
      desc: 'Thanjavur the city',
      args: [],
    );
  }

  /// `Thanjavur, Tamil Nadu`
  String get cardsDemoTravelDestinationLocation1 {
    return Intl.message(
      'Thanjavur, Tamil Nadu',
      name: 'cardsDemoTravelDestinationLocation1',
      desc: 'Thanjavur, Tamil Nadu is a location',
      args: [],
    );
  }

  /// `Artisans of Southern India`
  String get cardsDemoTravelDestinationTitle2 {
    return Intl.message(
      'Artisans of Southern India',
      name: 'cardsDemoTravelDestinationTitle2',
      desc: 'Artist that are from Southern India',
      args: [],
    );
  }

  /// `Silk Spinners`
  String get cardsDemoTravelDestinationDescription2 {
    return Intl.message(
      'Silk Spinners',
      name: 'cardsDemoTravelDestinationDescription2',
      desc: 'Silk Spinners',
      args: [],
    );
  }

  /// `Chettinad`
  String get cardsDemoTravelDestinationCity2 {
    return Intl.message(
      'Chettinad',
      name: 'cardsDemoTravelDestinationCity2',
      desc: 'Chettinad the city',
      args: [],
    );
  }

  /// `Sivaganga, Tamil Nadu`
  String get cardsDemoTravelDestinationLocation2 {
    return Intl.message(
      'Sivaganga, Tamil Nadu',
      name: 'cardsDemoTravelDestinationLocation2',
      desc: 'Sivaganga, Tamil Nadu is a location',
      args: [],
    );
  }

  /// `Brihadisvara Temple`
  String get cardsDemoTravelDestinationTitle3 {
    return Intl.message(
      'Brihadisvara Temple',
      name: 'cardsDemoTravelDestinationTitle3',
      desc: 'Brihadisvara Temple',
      args: [],
    );
  }

  /// `Temples`
  String get cardsDemoTravelDestinationDescription3 {
    return Intl.message(
      'Temples',
      name: 'cardsDemoTravelDestinationDescription3',
      desc: 'Temples',
      args: [],
    );
  }

  /// `Gallery`
  String get homeHeaderGallery {
    return Intl.message(
      'Gallery',
      name: 'homeHeaderGallery',
      desc: 'Header title on home screen for Gallery section.',
      args: [],
    );
  }

  /// `Categories`
  String get homeHeaderCategories {
    return Intl.message(
      'Categories',
      name: 'homeHeaderCategories',
      desc: 'Header title on home screen for Categories section.',
      args: [],
    );
  }

  /// `A fashionable retail app`
  String get shrineDescription {
    return Intl.message(
      'A fashionable retail app',
      name: 'shrineDescription',
      desc: 'Study description for Shrine.',
      args: [],
    );
  }

  /// `A content-focused news app`
  String get fortnightlyDescription {
    return Intl.message(
      'A content-focused news app',
      name: 'fortnightlyDescription',
      desc: 'Study description for Fortnightly.',
      args: [],
    );
  }

  /// `A personal finance app`
  String get rallyDescription {
    return Intl.message(
      'A personal finance app',
      name: 'rallyDescription',
      desc: 'Study description for Rally.',
      args: [],
    );
  }

  /// `An efficient, focused email app`
  String get replyDescription {
    return Intl.message(
      'An efficient, focused email app',
      name: 'replyDescription',
      desc: 'Study description for Reply.',
      args: [],
    );
  }

  /// `Checking`
  String get rallyAccountDataChecking {
    return Intl.message(
      'Checking',
      name: 'rallyAccountDataChecking',
      desc: 'Name for account made up by user.',
      args: [],
    );
  }

  /// `Home Savings`
  String get rallyAccountDataHomeSavings {
    return Intl.message(
      'Home Savings',
      name: 'rallyAccountDataHomeSavings',
      desc: 'Name for account made up by user.',
      args: [],
    );
  }

  /// `Car Savings`
  String get rallyAccountDataCarSavings {
    return Intl.message(
      'Car Savings',
      name: 'rallyAccountDataCarSavings',
      desc: 'Name for account made up by user.',
      args: [],
    );
  }

  /// `Vacation`
  String get rallyAccountDataVacation {
    return Intl.message(
      'Vacation',
      name: 'rallyAccountDataVacation',
      desc: 'Name for account made up by user.',
      args: [],
    );
  }

  /// `Annual Percentage Yield`
  String get rallyAccountDetailDataAnnualPercentageYield {
    return Intl.message(
      'Annual Percentage Yield',
      name: 'rallyAccountDetailDataAnnualPercentageYield',
      desc:
          'Title for account statistics. Below a percentage such as 0.10% will be displayed.',
      args: [],
    );
  }

  /// `Interest Rate`
  String get rallyAccountDetailDataInterestRate {
    return Intl.message(
      'Interest Rate',
      name: 'rallyAccountDetailDataInterestRate',
      desc:
          'Title for account statistics. Below a dollar amount such as \$100 will be displayed.',
      args: [],
    );
  }

  /// `Interest YTD`
  String get rallyAccountDetailDataInterestYtd {
    return Intl.message(
      'Interest YTD',
      name: 'rallyAccountDetailDataInterestYtd',
      desc:
          'Title for account statistics. Below a dollar amount such as \$100 will be displayed.',
      args: [],
    );
  }

  /// `Interest Paid Last Year`
  String get rallyAccountDetailDataInterestPaidLastYear {
    return Intl.message(
      'Interest Paid Last Year',
      name: 'rallyAccountDetailDataInterestPaidLastYear',
      desc:
          'Title for account statistics. Below a dollar amount such as \$100 will be displayed.',
      args: [],
    );
  }

  /// `Next Statement`
  String get rallyAccountDetailDataNextStatement {
    return Intl.message(
      'Next Statement',
      name: 'rallyAccountDetailDataNextStatement',
      desc:
          'Title for an account detail. Below a date for when the next account statement is released.',
      args: [],
    );
  }

  /// `Account Owner`
  String get rallyAccountDetailDataAccountOwner {
    return Intl.message(
      'Account Owner',
      name: 'rallyAccountDetailDataAccountOwner',
      desc:
          'Title for an account detail. Below the name of the account owner will be displayed.',
      args: [],
    );
  }

  /// `Total Amount`
  String get rallyBillDetailTotalAmount {
    return Intl.message(
      'Total Amount',
      name: 'rallyBillDetailTotalAmount',
      desc:
          'Title for column where it displays the total dollar amount that the user has in bills.',
      args: [],
    );
  }

  /// `Amount Paid`
  String get rallyBillDetailAmountPaid {
    return Intl.message(
      'Amount Paid',
      name: 'rallyBillDetailAmountPaid',
      desc:
          'Title for column where it displays the amount that the user has paid.',
      args: [],
    );
  }

  /// `Amount Due`
  String get rallyBillDetailAmountDue {
    return Intl.message(
      'Amount Due',
      name: 'rallyBillDetailAmountDue',
      desc:
          'Title for column where it displays the amount that the user has due.',
      args: [],
    );
  }

  /// `Coffee Shops`
  String get rallyBudgetCategoryCoffeeShops {
    return Intl.message(
      'Coffee Shops',
      name: 'rallyBudgetCategoryCoffeeShops',
      desc: 'Category for budget, to sort expenses / bills in.',
      args: [],
    );
  }

  /// `Groceries`
  String get rallyBudgetCategoryGroceries {
    return Intl.message(
      'Groceries',
      name: 'rallyBudgetCategoryGroceries',
      desc: 'Category for budget, to sort expenses / bills in.',
      args: [],
    );
  }

  /// `Restaurants`
  String get rallyBudgetCategoryRestaurants {
    return Intl.message(
      'Restaurants',
      name: 'rallyBudgetCategoryRestaurants',
      desc: 'Category for budget, to sort expenses / bills in.',
      args: [],
    );
  }

  /// `Clothing`
  String get rallyBudgetCategoryClothing {
    return Intl.message(
      'Clothing',
      name: 'rallyBudgetCategoryClothing',
      desc: 'Category for budget, to sort expenses / bills in.',
      args: [],
    );
  }

  /// `Total Cap`
  String get rallyBudgetDetailTotalCap {
    return Intl.message(
      'Total Cap',
      name: 'rallyBudgetDetailTotalCap',
      desc:
          'Title for column where it displays the total dollar cap that the user has for its budget.',
      args: [],
    );
  }

  /// `Amount Used`
  String get rallyBudgetDetailAmountUsed {
    return Intl.message(
      'Amount Used',
      name: 'rallyBudgetDetailAmountUsed',
      desc:
          'Title for column where it displays the dollar amount that the user has used in its budget.',
      args: [],
    );
  }

  /// `Amount Left`
  String get rallyBudgetDetailAmountLeft {
    return Intl.message(
      'Amount Left',
      name: 'rallyBudgetDetailAmountLeft',
      desc:
          'Title for column where it displays the dollar amount that the user has left in its budget.',
      args: [],
    );
  }

  /// `Manage Accounts`
  String get rallySettingsManageAccounts {
    return Intl.message(
      'Manage Accounts',
      name: 'rallySettingsManageAccounts',
      desc: 'Link to go to the page \'Manage Accounts.',
      args: [],
    );
  }

  /// `Tax Documents`
  String get rallySettingsTaxDocuments {
    return Intl.message(
      'Tax Documents',
      name: 'rallySettingsTaxDocuments',
      desc: 'Link to go to the page \'Tax Documents\'.',
      args: [],
    );
  }

  /// `Passcode and Touch ID`
  String get rallySettingsPasscodeAndTouchId {
    return Intl.message(
      'Passcode and Touch ID',
      name: 'rallySettingsPasscodeAndTouchId',
      desc: 'Link to go to the page \'Passcode and Touch ID\'.',
      args: [],
    );
  }

  /// `Notifications`
  String get rallySettingsNotifications {
    return Intl.message(
      'Notifications',
      name: 'rallySettingsNotifications',
      desc: 'Link to go to the page \'Notifications\'.',
      args: [],
    );
  }

  /// `Personal Information`
  String get rallySettingsPersonalInformation {
    return Intl.message(
      'Personal Information',
      name: 'rallySettingsPersonalInformation',
      desc: 'Link to go to the page \'Personal Information\'.',
      args: [],
    );
  }

  /// `Paperless Settings`
  String get rallySettingsPaperlessSettings {
    return Intl.message(
      'Paperless Settings',
      name: 'rallySettingsPaperlessSettings',
      desc: 'Link to go to the page \'Paperless Settings\'.',
      args: [],
    );
  }

  /// `Find ATMs`
  String get rallySettingsFindAtms {
    return Intl.message(
      'Find ATMs',
      name: 'rallySettingsFindAtms',
      desc: 'Link to go to the page \'Find ATMs\'.',
      args: [],
    );
  }

  /// `Help`
  String get rallySettingsHelp {
    return Intl.message(
      'Help',
      name: 'rallySettingsHelp',
      desc: 'Link to go to the page \'Help\'.',
      args: [],
    );
  }

  /// `Sign out`
  String get rallySettingsSignOut {
    return Intl.message(
      'Sign out',
      name: 'rallySettingsSignOut',
      desc: 'Link to go to the page \'Sign out\'.',
      args: [],
    );
  }

  /// `Total`
  String get rallyAccountTotal {
    return Intl.message(
      'Total',
      name: 'rallyAccountTotal',
      desc:
          'Title for \'total account value\' overview page, a dollar value is displayed next to it.',
      args: [],
    );
  }

  /// `Due`
  String get rallyBillsDue {
    return Intl.message(
      'Due',
      name: 'rallyBillsDue',
      desc:
          'Title for \'bills due\' page, a dollar value is displayed next to it.',
      args: [],
    );
  }

  /// `Left`
  String get rallyBudgetLeft {
    return Intl.message(
      'Left',
      name: 'rallyBudgetLeft',
      desc:
          'Title for \'budget left\' page, a dollar value is displayed next to it.',
      args: [],
    );
  }

  /// `Accounts`
  String get rallyAccounts {
    return Intl.message(
      'Accounts',
      name: 'rallyAccounts',
      desc: 'Link text for accounts page.',
      args: [],
    );
  }

  /// `Bills`
  String get rallyBills {
    return Intl.message(
      'Bills',
      name: 'rallyBills',
      desc: 'Link text for bills page.',
      args: [],
    );
  }

  /// `Budgets`
  String get rallyBudgets {
    return Intl.message(
      'Budgets',
      name: 'rallyBudgets',
      desc: 'Link text for budgets page.',
      args: [],
    );
  }

  /// `Alerts`
  String get rallyAlerts {
    return Intl.message(
      'Alerts',
      name: 'rallyAlerts',
      desc: 'Title for alerts part of overview page.',
      args: [],
    );
  }

  /// `SEE ALL`
  String get rallySeeAll {
    return Intl.message(
      'SEE ALL',
      name: 'rallySeeAll',
      desc: 'Link text for button to see all data for category.',
      args: [],
    );
  }

  /// ` LEFT`
  String get rallyFinanceLeft {
    return Intl.message(
      ' LEFT',
      name: 'rallyFinanceLeft',
      desc:
          'Displayed as \'dollar amount left\', for example \$46.70 LEFT, for a budget category.',
      args: [],
    );
  }

  /// `OVERVIEW`
  String get rallyTitleOverview {
    return Intl.message(
      'OVERVIEW',
      name: 'rallyTitleOverview',
      desc: 'The navigation link to the overview page.',
      args: [],
    );
  }

  /// `ACCOUNTS`
  String get rallyTitleAccounts {
    return Intl.message(
      'ACCOUNTS',
      name: 'rallyTitleAccounts',
      desc: 'The navigation link to the accounts page.',
      args: [],
    );
  }

  /// `BILLS`
  String get rallyTitleBills {
    return Intl.message(
      'BILLS',
      name: 'rallyTitleBills',
      desc: 'The navigation link to the bills page.',
      args: [],
    );
  }

  /// `BUDGETS`
  String get rallyTitleBudgets {
    return Intl.message(
      'BUDGETS',
      name: 'rallyTitleBudgets',
      desc: 'The navigation link to the budgets page.',
      args: [],
    );
  }

  /// `SETTINGS`
  String get rallyTitleSettings {
    return Intl.message(
      'SETTINGS',
      name: 'rallyTitleSettings',
      desc: 'The navigation link to the settings page.',
      args: [],
    );
  }

  /// `Login to Rally`
  String get rallyLoginLoginToRally {
    return Intl.message(
      'Login to Rally',
      name: 'rallyLoginLoginToRally',
      desc:
          'Title for login page for the Rally app (Rally does not need to be translated as it is a product name).',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get rallyLoginNoAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'rallyLoginNoAccount',
      desc: 'Prompt for signing up for an account.',
      args: [],
    );
  }

  /// `SIGN UP`
  String get rallyLoginSignUp {
    return Intl.message(
      'SIGN UP',
      name: 'rallyLoginSignUp',
      desc: 'Button text to sign up for an account.',
      args: [],
    );
  }

  /// `Username`
  String get rallyLoginUsername {
    return Intl.message(
      'Username',
      name: 'rallyLoginUsername',
      desc: 'The username field in an login form.',
      args: [],
    );
  }

  /// `Password`
  String get rallyLoginPassword {
    return Intl.message(
      'Password',
      name: 'rallyLoginPassword',
      desc: 'The password field in an login form.',
      args: [],
    );
  }

  /// `Login`
  String get rallyLoginLabelLogin {
    return Intl.message(
      'Login',
      name: 'rallyLoginLabelLogin',
      desc: 'The label text to login.',
      args: [],
    );
  }

  /// `Remember Me`
  String get rallyLoginRememberMe {
    return Intl.message(
      'Remember Me',
      name: 'rallyLoginRememberMe',
      desc: 'Text if the user wants to stay logged in.',
      args: [],
    );
  }

  /// `LOGIN`
  String get rallyLoginButtonLogin {
    return Intl.message(
      'LOGIN',
      name: 'rallyLoginButtonLogin',
      desc: 'Text for login button.',
      args: [],
    );
  }

  /// `Heads up, you’ve used up {percent} of your Shopping budget for this month.`
  String rallyAlertsMessageHeadsUpShopping(Object percent) {
    return Intl.message(
      'Heads up, you’ve used up $percent of your Shopping budget for this month.',
      name: 'rallyAlertsMessageHeadsUpShopping',
      desc:
          'Alert message shown when for example, user has used more than 90% of their shopping budget.',
      args: [percent],
    );
  }

  /// `You’ve spent {amount} on Restaurants this week.`
  String rallyAlertsMessageSpentOnRestaurants(Object amount) {
    return Intl.message(
      'You’ve spent $amount on Restaurants this week.',
      name: 'rallyAlertsMessageSpentOnRestaurants',
      desc:
          'Alert message shown when for example, user has spent \$120 on Restaurants this week.',
      args: [amount],
    );
  }

  /// `You’ve spent {amount} in ATM fees this month`
  String rallyAlertsMessageATMFees(Object amount) {
    return Intl.message(
      'You’ve spent $amount in ATM fees this month',
      name: 'rallyAlertsMessageATMFees',
      desc:
          'Alert message shown when for example, the user has spent \$24 in ATM fees this month.',
      args: [amount],
    );
  }

  /// `Good work! Your checking account is {percent} higher than last month.`
  String rallyAlertsMessageCheckingAccount(Object percent) {
    return Intl.message(
      'Good work! Your checking account is $percent higher than last month.',
      name: 'rallyAlertsMessageCheckingAccount',
      desc:
          'Alert message shown when for example, the checking account is 1% higher than last month.',
      args: [percent],
    );
  }

  /// `{count, plural, =1{Increase your potential tax deduction! Assign categories to 1 unassigned transaction.}other{Increase your potential tax deduction! Assign categories to {count} unassigned transactions.}}`
  String rallyAlertsMessageUnassignedTransactions(num count) {
    return Intl.plural(
      count,
      one:
          'Increase your potential tax deduction! Assign categories to 1 unassigned transaction.',
      other:
          'Increase your potential tax deduction! Assign categories to $count unassigned transactions.',
      name: 'rallyAlertsMessageUnassignedTransactions',
      desc: 'Alert message shown when you have unassigned transactions.',
      args: [count],
    );
  }

  /// `See all accounts`
  String get rallySeeAllAccounts {
    return Intl.message(
      'See all accounts',
      name: 'rallySeeAllAccounts',
      desc:
          'Semantics label for button to see all accounts. Accounts refer to bank account here.',
      args: [],
    );
  }

  /// `See all bills`
  String get rallySeeAllBills {
    return Intl.message(
      'See all bills',
      name: 'rallySeeAllBills',
      desc: 'Semantics label for button to see all bills.',
      args: [],
    );
  }

  /// `See all budgets`
  String get rallySeeAllBudgets {
    return Intl.message(
      'See all budgets',
      name: 'rallySeeAllBudgets',
      desc: 'Semantics label for button to see all budgets.',
      args: [],
    );
  }

  /// `{accountName} account {accountNumber} with {amount}.`
  String rallyAccountAmount(
      Object accountName, Object accountNumber, Object amount) {
    return Intl.message(
      '$accountName account $accountNumber with $amount.',
      name: 'rallyAccountAmount',
      desc:
          'Semantics label for row with bank account name (for example checking) and its bank account number (for example 123), with how much money is deposited in it (for example \$12).',
      args: [accountName, accountNumber, amount],
    );
  }

  /// `{billName} bill due {date} for {amount}.`
  String rallyBillAmount(Object billName, Object date, Object amount) {
    return Intl.message(
      '$billName bill due $date for $amount.',
      name: 'rallyBillAmount',
      desc:
          'Semantics label for row with a bill (example name is rent), when the bill is due (1/12/2019 for example) and for how much money (\$12).',
      args: [billName, date, amount],
    );
  }

  /// `{budgetName} budget with {amountUsed} used of {amountTotal}, {amountLeft} left`
  String rallyBudgetAmount(Object budgetName, Object amountUsed,
      Object amountTotal, Object amountLeft) {
    return Intl.message(
      '$budgetName budget with $amountUsed used of $amountTotal, $amountLeft left',
      name: 'rallyBudgetAmount',
      desc:
          'Semantics label for row with a budget (housing budget for example), with how much is used of the budget (for example \$5), the total budget (for example \$100) and the amount left in the budget (for example \$95).',
      args: [budgetName, amountUsed, amountTotal, amountLeft],
    );
  }

  /// `A personalized travel app`
  String get craneDescription {
    return Intl.message(
      'A personalized travel app',
      name: 'craneDescription',
      desc: 'Study description for Crane.',
      args: [],
    );
  }

  /// `STYLES & OTHER`
  String get homeCategoryReference {
    return Intl.message(
      'STYLES & OTHER',
      name: 'homeCategoryReference',
      desc:
          'Category title on home screen for styles & other demos (for context, the styles demos consist of a color demo and a typography demo).',
      args: [],
    );
  }

  /// `Couldn't display URL:`
  String get demoInvalidURL {
    return Intl.message(
      'Couldn\'t display URL:',
      name: 'demoInvalidURL',
      desc: 'Error message when opening the URL for a demo.',
      args: [],
    );
  }

  /// `Options`
  String get demoOptionsTooltip {
    return Intl.message(
      'Options',
      name: 'demoOptionsTooltip',
      desc: 'Tooltip for options button in a demo.',
      args: [],
    );
  }

  /// `Info`
  String get demoInfoTooltip {
    return Intl.message(
      'Info',
      name: 'demoInfoTooltip',
      desc: 'Tooltip for info button in a demo.',
      args: [],
    );
  }

  /// `Demo Code`
  String get demoCodeTooltip {
    return Intl.message(
      'Demo Code',
      name: 'demoCodeTooltip',
      desc: 'Tooltip for demo code button in a demo.',
      args: [],
    );
  }

  /// `API Documentation`
  String get demoDocumentationTooltip {
    return Intl.message(
      'API Documentation',
      name: 'demoDocumentationTooltip',
      desc: 'Tooltip for API documentation button in a demo.',
      args: [],
    );
  }

  /// `Full Screen`
  String get demoFullscreenTooltip {
    return Intl.message(
      'Full Screen',
      name: 'demoFullscreenTooltip',
      desc: 'Tooltip for Full Screen button in a demo.',
      args: [],
    );
  }

  /// `COPY ALL`
  String get demoCodeViewerCopyAll {
    return Intl.message(
      'COPY ALL',
      name: 'demoCodeViewerCopyAll',
      desc: 'Caption for a button to copy all text.',
      args: [],
    );
  }

  /// `Copied to clipboard.`
  String get demoCodeViewerCopiedToClipboardMessage {
    return Intl.message(
      'Copied to clipboard.',
      name: 'demoCodeViewerCopiedToClipboardMessage',
      desc:
          'A message displayed to the user after clicking the COPY ALL button, if the text is successfully copied to the clipboard.',
      args: [],
    );
  }

  /// `Failed to copy to clipboard: {error}`
  String demoCodeViewerFailedToCopyToClipboardMessage(Object error) {
    return Intl.message(
      'Failed to copy to clipboard: $error',
      name: 'demoCodeViewerFailedToCopyToClipboardMessage',
      desc:
          'A message displayed to the user after clicking the COPY ALL button, if the text CANNOT be copied to the clipboard.',
      args: [error],
    );
  }

  /// `View options`
  String get demoOptionsFeatureTitle {
    return Intl.message(
      'View options',
      name: 'demoOptionsFeatureTitle',
      desc: 'Title for an alert that explains what the options button does.',
      args: [],
    );
  }

  /// `Tap here to view available options for this demo.`
  String get demoOptionsFeatureDescription {
    return Intl.message(
      'Tap here to view available options for this demo.',
      name: 'demoOptionsFeatureDescription',
      desc:
          'Description for an alert that explains what the options button does.',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: 'Title for the settings screen.',
      args: [],
    );
  }

  /// `Settings`
  String get settingsButtonLabel {
    return Intl.message(
      'Settings',
      name: 'settingsButtonLabel',
      desc:
          'Accessibility label for the settings button when settings are not showing.',
      args: [],
    );
  }

  /// `Close settings`
  String get settingsButtonCloseLabel {
    return Intl.message(
      'Close settings',
      name: 'settingsButtonCloseLabel',
      desc:
          'Accessibility label for the settings button when settings are showing.',
      args: [],
    );
  }

  /// `System`
  String get settingsSystemDefault {
    return Intl.message(
      'System',
      name: 'settingsSystemDefault',
      desc: 'Option label to indicate the system default will be used.',
      args: [],
    );
  }

  /// `Text scaling`
  String get settingsTextScaling {
    return Intl.message(
      'Text scaling',
      name: 'settingsTextScaling',
      desc: 'Title for text scaling setting.',
      args: [],
    );
  }

  /// `Small`
  String get settingsTextScalingSmall {
    return Intl.message(
      'Small',
      name: 'settingsTextScalingSmall',
      desc: 'Option label for small text scale setting.',
      args: [],
    );
  }

  /// `Normal`
  String get settingsTextScalingNormal {
    return Intl.message(
      'Normal',
      name: 'settingsTextScalingNormal',
      desc: 'Option label for normal text scale setting.',
      args: [],
    );
  }

  /// `Large`
  String get settingsTextScalingLarge {
    return Intl.message(
      'Large',
      name: 'settingsTextScalingLarge',
      desc: 'Option label for large text scale setting.',
      args: [],
    );
  }

  /// `Huge`
  String get settingsTextScalingHuge {
    return Intl.message(
      'Huge',
      name: 'settingsTextScalingHuge',
      desc: 'Option label for huge text scale setting.',
      args: [],
    );
  }

  /// `Text direction`
  String get settingsTextDirection {
    return Intl.message(
      'Text direction',
      name: 'settingsTextDirection',
      desc: 'Title for text direction setting.',
      args: [],
    );
  }

  /// `Based on locale`
  String get settingsTextDirectionLocaleBased {
    return Intl.message(
      'Based on locale',
      name: 'settingsTextDirectionLocaleBased',
      desc: 'Option label for locale-based text direction setting.',
      args: [],
    );
  }

  /// `LTR`
  String get settingsTextDirectionLTR {
    return Intl.message(
      'LTR',
      name: 'settingsTextDirectionLTR',
      desc: 'Option label for left-to-right text direction setting.',
      args: [],
    );
  }

  /// `RTL`
  String get settingsTextDirectionRTL {
    return Intl.message(
      'RTL',
      name: 'settingsTextDirectionRTL',
      desc: 'Option label for right-to-left text direction setting.',
      args: [],
    );
  }

  /// `Locale`
  String get settingsLocale {
    return Intl.message(
      'Locale',
      name: 'settingsLocale',
      desc: 'Title for locale setting.',
      args: [],
    );
  }

  /// `Platform mechanics`
  String get settingsPlatformMechanics {
    return Intl.message(
      'Platform mechanics',
      name: 'settingsPlatformMechanics',
      desc: 'Title for platform mechanics (iOS, Android, macOS, etc.) setting.',
      args: [],
    );
  }

  /// `Theme`
  String get settingsTheme {
    return Intl.message(
      'Theme',
      name: 'settingsTheme',
      desc: 'Title for the theme setting.',
      args: [],
    );
  }

  /// `Dark`
  String get settingsDarkTheme {
    return Intl.message(
      'Dark',
      name: 'settingsDarkTheme',
      desc: 'Title for the dark theme setting.',
      args: [],
    );
  }

  /// `Light`
  String get settingsLightTheme {
    return Intl.message(
      'Light',
      name: 'settingsLightTheme',
      desc: 'Title for the light theme setting.',
      args: [],
    );
  }

  /// `Slow motion`
  String get settingsSlowMotion {
    return Intl.message(
      'Slow motion',
      name: 'settingsSlowMotion',
      desc: 'Title for slow motion setting.',
      args: [],
    );
  }

  /// `About Flutter Gallery`
  String get settingsAbout {
    return Intl.message(
      'About Flutter Gallery',
      name: 'settingsAbout',
      desc: 'Title for information button.',
      args: [],
    );
  }

  /// `Send feedback`
  String get settingsFeedback {
    return Intl.message(
      'Send feedback',
      name: 'settingsFeedback',
      desc: 'Title for feedback button.',
      args: [],
    );
  }

  /// `Designed by TOASTER in London`
  String get settingsAttribution {
    return Intl.message(
      'Designed by TOASTER in London',
      name: 'settingsAttribution',
      desc:
          'Title for attribution (TOASTER is a proper name and should remain in English).',
      args: [],
    );
  }

  /// `App bar`
  String get demoAppBarTitle {
    return Intl.message(
      'App bar',
      name: 'demoAppBarTitle',
      desc: 'Title for the material App bar component demo.',
      args: [],
    );
  }

  /// `Displays information and actions relating to the current screen`
  String get demoAppBarSubtitle {
    return Intl.message(
      'Displays information and actions relating to the current screen',
      name: 'demoAppBarSubtitle',
      desc: 'Subtitle for the material App bar component demo.',
      args: [],
    );
  }

  /// `The App bar provides content and actions related to the current screen. It’s used for branding, screen titles, navigation, and actions`
  String get demoAppBarDescription {
    return Intl.message(
      'The App bar provides content and actions related to the current screen. It’s used for branding, screen titles, navigation, and actions',
      name: 'demoAppBarDescription',
      desc: 'Description for the material App bar component demo.',
      args: [],
    );
  }

  /// `Bottom app bar`
  String get demoBottomAppBarTitle {
    return Intl.message(
      'Bottom app bar',
      name: 'demoBottomAppBarTitle',
      desc: 'Title for the material bottom app bar component demo.',
      args: [],
    );
  }

  /// `Displays navigation and actions at the bottom`
  String get demoBottomAppBarSubtitle {
    return Intl.message(
      'Displays navigation and actions at the bottom',
      name: 'demoBottomAppBarSubtitle',
      desc: 'Subtitle for the material bottom app bar component demo.',
      args: [],
    );
  }

  /// `Bottom app bars provide access to a bottom navigation drawer and up to four actions, including the floating action button.`
  String get demoBottomAppBarDescription {
    return Intl.message(
      'Bottom app bars provide access to a bottom navigation drawer and up to four actions, including the floating action button.',
      name: 'demoBottomAppBarDescription',
      desc: 'Description for the material bottom app bar component demo.',
      args: [],
    );
  }

  /// `Notch`
  String get bottomAppBarNotch {
    return Intl.message(
      'Notch',
      name: 'bottomAppBarNotch',
      desc:
          'A toggle for whether to have a notch (or cutout) in the bottom app bar demo.',
      args: [],
    );
  }

  /// `Floating Action Button Position`
  String get bottomAppBarPosition {
    return Intl.message(
      'Floating Action Button Position',
      name: 'bottomAppBarPosition',
      desc:
          'A setting for the position of the floating action button in the bottom app bar demo.',
      args: [],
    );
  }

  /// `Docked - End`
  String get bottomAppBarPositionDockedEnd {
    return Intl.message(
      'Docked - End',
      name: 'bottomAppBarPositionDockedEnd',
      desc:
          'A setting for the position of the floating action button in the bottom app bar that docks the button in the bar and aligns it at the end.',
      args: [],
    );
  }

  /// `Docked - Center`
  String get bottomAppBarPositionDockedCenter {
    return Intl.message(
      'Docked - Center',
      name: 'bottomAppBarPositionDockedCenter',
      desc:
          'A setting for the position of the floating action button in the bottom app bar that docks the button in the bar and aligns it in the center.',
      args: [],
    );
  }

  /// `Floating - End`
  String get bottomAppBarPositionFloatingEnd {
    return Intl.message(
      'Floating - End',
      name: 'bottomAppBarPositionFloatingEnd',
      desc:
          'A setting for the position of the floating action button in the bottom app bar that places the button above the bar and aligns it at the end.',
      args: [],
    );
  }

  /// `Floating - Center`
  String get bottomAppBarPositionFloatingCenter {
    return Intl.message(
      'Floating - Center',
      name: 'bottomAppBarPositionFloatingCenter',
      desc:
          'A setting for the position of the floating action button in the bottom app bar that places the button above the bar and aligns it in the center.',
      args: [],
    );
  }

  /// `Banner`
  String get demoBannerTitle {
    return Intl.message(
      'Banner',
      name: 'demoBannerTitle',
      desc: 'Title for the material banner component demo.',
      args: [],
    );
  }

  /// `Displaying a banner within a list`
  String get demoBannerSubtitle {
    return Intl.message(
      'Displaying a banner within a list',
      name: 'demoBannerSubtitle',
      desc: 'Subtitle for the material banner component demo.',
      args: [],
    );
  }

  /// `A banner displays an important, succinct message, and provides actions for users to address (or dismiss the banner). A user action is required for it to be dismissed.`
  String get demoBannerDescription {
    return Intl.message(
      'A banner displays an important, succinct message, and provides actions for users to address (or dismiss the banner). A user action is required for it to be dismissed.',
      name: 'demoBannerDescription',
      desc: 'Description for the material banner component demo.',
      args: [],
    );
  }

  /// `Bottom navigation`
  String get demoBottomNavigationTitle {
    return Intl.message(
      'Bottom navigation',
      name: 'demoBottomNavigationTitle',
      desc: 'Title for the material bottom navigation component demo.',
      args: [],
    );
  }

  /// `Bottom navigation with cross-fading views`
  String get demoBottomNavigationSubtitle {
    return Intl.message(
      'Bottom navigation with cross-fading views',
      name: 'demoBottomNavigationSubtitle',
      desc: 'Subtitle for the material bottom navigation component demo.',
      args: [],
    );
  }

  /// `Persistent labels`
  String get demoBottomNavigationPersistentLabels {
    return Intl.message(
      'Persistent labels',
      name: 'demoBottomNavigationPersistentLabels',
      desc: 'Option title for bottom navigation with persistent labels.',
      args: [],
    );
  }

  /// `Selected label`
  String get demoBottomNavigationSelectedLabel {
    return Intl.message(
      'Selected label',
      name: 'demoBottomNavigationSelectedLabel',
      desc: 'Option title for bottom navigation with only a selected label.',
      args: [],
    );
  }

  /// `Bottom navigation bars display three to five destinations at the bottom of a screen. Each destination is represented by an icon and an optional text label. When a bottom navigation icon is tapped, the user is taken to the top-level navigation destination associated with that icon.`
  String get demoBottomNavigationDescription {
    return Intl.message(
      'Bottom navigation bars display three to five destinations at the bottom of a screen. Each destination is represented by an icon and an optional text label. When a bottom navigation icon is tapped, the user is taken to the top-level navigation destination associated with that icon.',
      name: 'demoBottomNavigationDescription',
      desc: 'Description for the material bottom navigation component demo.',
      args: [],
    );
  }

  /// `Buttons`
  String get demoButtonTitle {
    return Intl.message(
      'Buttons',
      name: 'demoButtonTitle',
      desc: 'Title for the material buttons component demo.',
      args: [],
    );
  }

  /// `Text, elevated, outlined, and more`
  String get demoButtonSubtitle {
    return Intl.message(
      'Text, elevated, outlined, and more',
      name: 'demoButtonSubtitle',
      desc: 'Subtitle for the material buttons component demo.',
      args: [],
    );
  }

  /// `Text Button`
  String get demoTextButtonTitle {
    return Intl.message(
      'Text Button',
      name: 'demoTextButtonTitle',
      desc: 'Title for the text button component demo.',
      args: [],
    );
  }

  /// `A text button displays an ink splash on press but does not lift. Use text buttons on toolbars, in dialogs and inline with padding`
  String get demoTextButtonDescription {
    return Intl.message(
      'A text button displays an ink splash on press but does not lift. Use text buttons on toolbars, in dialogs and inline with padding',
      name: 'demoTextButtonDescription',
      desc: 'Description for the text button component demo.',
      args: [],
    );
  }

  /// `Elevated Button`
  String get demoElevatedButtonTitle {
    return Intl.message(
      'Elevated Button',
      name: 'demoElevatedButtonTitle',
      desc: 'Title for the elevated button component demo.',
      args: [],
    );
  }

  /// `Elevated buttons add dimension to mostly flat layouts. They emphasize functions on busy or wide spaces.`
  String get demoElevatedButtonDescription {
    return Intl.message(
      'Elevated buttons add dimension to mostly flat layouts. They emphasize functions on busy or wide spaces.',
      name: 'demoElevatedButtonDescription',
      desc: 'Description for the elevated button component demo.',
      args: [],
    );
  }

  /// `Outlined Button`
  String get demoOutlinedButtonTitle {
    return Intl.message(
      'Outlined Button',
      name: 'demoOutlinedButtonTitle',
      desc: 'Title for the outlined button component demo.',
      args: [],
    );
  }

  /// `Outlined buttons become opaque and elevate when pressed. They are often paired with raised buttons to indicate an alternative, secondary action.`
  String get demoOutlinedButtonDescription {
    return Intl.message(
      'Outlined buttons become opaque and elevate when pressed. They are often paired with raised buttons to indicate an alternative, secondary action.',
      name: 'demoOutlinedButtonDescription',
      desc: 'Description for the outlined button component demo.',
      args: [],
    );
  }

  /// `Toggle Buttons`
  String get demoToggleButtonTitle {
    return Intl.message(
      'Toggle Buttons',
      name: 'demoToggleButtonTitle',
      desc: 'Title for the toggle buttons component demo.',
      args: [],
    );
  }

  /// `Toggle buttons can be used to group related options. To emphasize groups of related toggle buttons, a group should share a common container`
  String get demoToggleButtonDescription {
    return Intl.message(
      'Toggle buttons can be used to group related options. To emphasize groups of related toggle buttons, a group should share a common container',
      name: 'demoToggleButtonDescription',
      desc: 'Description for the toggle buttons component demo.',
      args: [],
    );
  }

  /// `Floating Action Button`
  String get demoFloatingButtonTitle {
    return Intl.message(
      'Floating Action Button',
      name: 'demoFloatingButtonTitle',
      desc: 'Title for the floating action button component demo.',
      args: [],
    );
  }

  /// `A floating action button is a circular icon button that hovers over content to promote a primary action in the application.`
  String get demoFloatingButtonDescription {
    return Intl.message(
      'A floating action button is a circular icon button that hovers over content to promote a primary action in the application.',
      name: 'demoFloatingButtonDescription',
      desc: 'Description for the floating action button component demo.',
      args: [],
    );
  }

  /// `Cards`
  String get demoCardTitle {
    return Intl.message(
      'Cards',
      name: 'demoCardTitle',
      desc: 'Title for the material cards component demo.',
      args: [],
    );
  }

  /// `Baseline cards with rounded corners`
  String get demoCardSubtitle {
    return Intl.message(
      'Baseline cards with rounded corners',
      name: 'demoCardSubtitle',
      desc: 'Subtitle for the material cards component demo.',
      args: [],
    );
  }

  /// `Chips`
  String get demoChipTitle {
    return Intl.message(
      'Chips',
      name: 'demoChipTitle',
      desc: 'Title for the material chips component demo.',
      args: [],
    );
  }

  /// `A card is a sheet of Material used to represent some related information, for example an album, a geographical location, a meal, contact details, etc.`
  String get demoCardDescription {
    return Intl.message(
      'A card is a sheet of Material used to represent some related information, for example an album, a geographical location, a meal, contact details, etc.',
      name: 'demoCardDescription',
      desc: 'Description for the material cards component demo.',
      args: [],
    );
  }

  /// `Compact elements that represent an input, attribute, or action`
  String get demoChipSubtitle {
    return Intl.message(
      'Compact elements that represent an input, attribute, or action',
      name: 'demoChipSubtitle',
      desc: 'Subtitle for the material chips component demo.',
      args: [],
    );
  }

  /// `Action Chip`
  String get demoActionChipTitle {
    return Intl.message(
      'Action Chip',
      name: 'demoActionChipTitle',
      desc: 'Title for the action chip component demo.',
      args: [],
    );
  }

  /// `Action chips are a set of options which trigger an action related to primary content. Action chips should appear dynamically and contextually in a UI.`
  String get demoActionChipDescription {
    return Intl.message(
      'Action chips are a set of options which trigger an action related to primary content. Action chips should appear dynamically and contextually in a UI.',
      name: 'demoActionChipDescription',
      desc: 'Description for the action chip component demo.',
      args: [],
    );
  }

  /// `Choice Chip`
  String get demoChoiceChipTitle {
    return Intl.message(
      'Choice Chip',
      name: 'demoChoiceChipTitle',
      desc: 'Title for the choice chip component demo.',
      args: [],
    );
  }

  /// `Choice chips represent a single choice from a set. Choice chips contain related descriptive text or categories.`
  String get demoChoiceChipDescription {
    return Intl.message(
      'Choice chips represent a single choice from a set. Choice chips contain related descriptive text or categories.',
      name: 'demoChoiceChipDescription',
      desc: 'Description for the choice chip component demo.',
      args: [],
    );
  }

  /// `Filter Chip`
  String get demoFilterChipTitle {
    return Intl.message(
      'Filter Chip',
      name: 'demoFilterChipTitle',
      desc: 'Title for the filter chip component demo.',
      args: [],
    );
  }

  /// `Filter chips use tags or descriptive words as a way to filter content.`
  String get demoFilterChipDescription {
    return Intl.message(
      'Filter chips use tags or descriptive words as a way to filter content.',
      name: 'demoFilterChipDescription',
      desc: 'Description for the filter chip component demo.',
      args: [],
    );
  }

  /// `Input Chip`
  String get demoInputChipTitle {
    return Intl.message(
      'Input Chip',
      name: 'demoInputChipTitle',
      desc: 'Title for the input chip component demo.',
      args: [],
    );
  }

  /// `Input chips represent a complex piece of information, such as an entity (person, place, or thing) or conversational text, in a compact form.`
  String get demoInputChipDescription {
    return Intl.message(
      'Input chips represent a complex piece of information, such as an entity (person, place, or thing) or conversational text, in a compact form.',
      name: 'demoInputChipDescription',
      desc: 'Description for the input chip component demo.',
      args: [],
    );
  }

  /// `Data Tables`
  String get demoDataTableTitle {
    return Intl.message(
      'Data Tables',
      name: 'demoDataTableTitle',
      desc: 'Title for the material data table component demo.',
      args: [],
    );
  }

  /// `Rows and columns of information`
  String get demoDataTableSubtitle {
    return Intl.message(
      'Rows and columns of information',
      name: 'demoDataTableSubtitle',
      desc: 'Subtitle for the material data table component demo.',
      args: [],
    );
  }

  /// `Data tables display information in a grid-like format of rows and columns. They organize information in a way that’s easy to scan, so that users can look for patterns and insights.`
  String get demoDataTableDescription {
    return Intl.message(
      'Data tables display information in a grid-like format of rows and columns. They organize information in a way that’s easy to scan, so that users can look for patterns and insights.',
      name: 'demoDataTableDescription',
      desc: 'Description for the material data table component demo.',
      args: [],
    );
  }

  /// `Nutrition`
  String get dataTableHeader {
    return Intl.message(
      'Nutrition',
      name: 'dataTableHeader',
      desc: 'Header for the data table component demo about nutrition.',
      args: [],
    );
  }

  /// `Dessert (1 serving)`
  String get dataTableColumnDessert {
    return Intl.message(
      'Dessert (1 serving)',
      name: 'dataTableColumnDessert',
      desc: 'Column header for desserts.',
      args: [],
    );
  }

  /// `Calories`
  String get dataTableColumnCalories {
    return Intl.message(
      'Calories',
      name: 'dataTableColumnCalories',
      desc: 'Column header for number of calories.',
      args: [],
    );
  }

  /// `Fat (g)`
  String get dataTableColumnFat {
    return Intl.message(
      'Fat (g)',
      name: 'dataTableColumnFat',
      desc: 'Column header for number of grams of fat.',
      args: [],
    );
  }

  /// `Carbs (g)`
  String get dataTableColumnCarbs {
    return Intl.message(
      'Carbs (g)',
      name: 'dataTableColumnCarbs',
      desc: 'Column header for number of grams of carbs.',
      args: [],
    );
  }

  /// `Protein (g)`
  String get dataTableColumnProtein {
    return Intl.message(
      'Protein (g)',
      name: 'dataTableColumnProtein',
      desc: 'Column header for number of grams of protein.',
      args: [],
    );
  }

  /// `Sodium (mg)`
  String get dataTableColumnSodium {
    return Intl.message(
      'Sodium (mg)',
      name: 'dataTableColumnSodium',
      desc: 'Column header for number of milligrams of sodium.',
      args: [],
    );
  }

  /// `Calcium (%)`
  String get dataTableColumnCalcium {
    return Intl.message(
      'Calcium (%)',
      name: 'dataTableColumnCalcium',
      desc: 'Column header for daily percentage of calcium.',
      args: [],
    );
  }

  /// `Iron (%)`
  String get dataTableColumnIron {
    return Intl.message(
      'Iron (%)',
      name: 'dataTableColumnIron',
      desc: 'Column header for daily percentage of iron.',
      args: [],
    );
  }

  /// `Frozen yogurt`
  String get dataTableRowFrozenYogurt {
    return Intl.message(
      'Frozen yogurt',
      name: 'dataTableRowFrozenYogurt',
      desc: 'Column row for frozen yogurt.',
      args: [],
    );
  }

  /// `Ice cream sandwich`
  String get dataTableRowIceCreamSandwich {
    return Intl.message(
      'Ice cream sandwich',
      name: 'dataTableRowIceCreamSandwich',
      desc: 'Column row for Ice cream sandwich.',
      args: [],
    );
  }

  /// `Eclair`
  String get dataTableRowEclair {
    return Intl.message(
      'Eclair',
      name: 'dataTableRowEclair',
      desc: 'Column row for Eclair.',
      args: [],
    );
  }

  /// `Cupcake`
  String get dataTableRowCupcake {
    return Intl.message(
      'Cupcake',
      name: 'dataTableRowCupcake',
      desc: 'Column row for Cupcake.',
      args: [],
    );
  }

  /// `Gingerbread`
  String get dataTableRowGingerbread {
    return Intl.message(
      'Gingerbread',
      name: 'dataTableRowGingerbread',
      desc: 'Column row for Gingerbread.',
      args: [],
    );
  }

  /// `Jelly bean`
  String get dataTableRowJellyBean {
    return Intl.message(
      'Jelly bean',
      name: 'dataTableRowJellyBean',
      desc: 'Column row for Jelly bean.',
      args: [],
    );
  }

  /// `Lollipop`
  String get dataTableRowLollipop {
    return Intl.message(
      'Lollipop',
      name: 'dataTableRowLollipop',
      desc: 'Column row for Lollipop.',
      args: [],
    );
  }

  /// `Honeycomb`
  String get dataTableRowHoneycomb {
    return Intl.message(
      'Honeycomb',
      name: 'dataTableRowHoneycomb',
      desc: 'Column row for Honeycomb.',
      args: [],
    );
  }

  /// `Donut`
  String get dataTableRowDonut {
    return Intl.message(
      'Donut',
      name: 'dataTableRowDonut',
      desc: 'Column row for Donut.',
      args: [],
    );
  }

  /// `Apple pie`
  String get dataTableRowApplePie {
    return Intl.message(
      'Apple pie',
      name: 'dataTableRowApplePie',
      desc: 'Column row for Apple pie.',
      args: [],
    );
  }

  /// `{value} with sugar`
  String dataTableRowWithSugar(Object value) {
    return Intl.message(
      '$value with sugar',
      name: 'dataTableRowWithSugar',
      desc:
          'A dessert with sugar on it. The parameter is some type of dessert.',
      args: [value],
    );
  }

  /// `{value} with honey`
  String dataTableRowWithHoney(Object value) {
    return Intl.message(
      '$value with honey',
      name: 'dataTableRowWithHoney',
      desc:
          'A dessert with honey on it. The parameter is some type of dessert.',
      args: [value],
    );
  }

  /// `Dialogs`
  String get demoDialogTitle {
    return Intl.message(
      'Dialogs',
      name: 'demoDialogTitle',
      desc: 'Title for the material dialog component demo.',
      args: [],
    );
  }

  /// `Simple, alert, and fullscreen`
  String get demoDialogSubtitle {
    return Intl.message(
      'Simple, alert, and fullscreen',
      name: 'demoDialogSubtitle',
      desc: 'Subtitle for the material dialog component demo.',
      args: [],
    );
  }

  /// `Alert`
  String get demoAlertDialogTitle {
    return Intl.message(
      'Alert',
      name: 'demoAlertDialogTitle',
      desc: 'Title for the alert dialog component demo.',
      args: [],
    );
  }

  /// `An alert dialog informs the user about situations that require acknowledgement. An alert dialog has an optional title and an optional list of actions.`
  String get demoAlertDialogDescription {
    return Intl.message(
      'An alert dialog informs the user about situations that require acknowledgement. An alert dialog has an optional title and an optional list of actions.',
      name: 'demoAlertDialogDescription',
      desc: 'Description for the alert dialog component demo.',
      args: [],
    );
  }

  /// `Alert With Title`
  String get demoAlertTitleDialogTitle {
    return Intl.message(
      'Alert With Title',
      name: 'demoAlertTitleDialogTitle',
      desc: 'Title for the alert dialog with title component demo.',
      args: [],
    );
  }

  /// `Simple`
  String get demoSimpleDialogTitle {
    return Intl.message(
      'Simple',
      name: 'demoSimpleDialogTitle',
      desc: 'Title for the simple dialog component demo.',
      args: [],
    );
  }

  /// `A simple dialog offers the user a choice between several options. A simple dialog has an optional title that is displayed above the choices.`
  String get demoSimpleDialogDescription {
    return Intl.message(
      'A simple dialog offers the user a choice between several options. A simple dialog has an optional title that is displayed above the choices.',
      name: 'demoSimpleDialogDescription',
      desc: 'Description for the simple dialog component demo.',
      args: [],
    );
  }

  /// `Divider`
  String get demoDividerTitle {
    return Intl.message(
      'Divider',
      name: 'demoDividerTitle',
      desc: 'Title for the divider component demo.',
      args: [],
    );
  }

  /// `A divider is a thin line that groups content in lists and layouts.`
  String get demoDividerSubtitle {
    return Intl.message(
      'A divider is a thin line that groups content in lists and layouts.',
      name: 'demoDividerSubtitle',
      desc: 'Subtitle for the divider component demo.',
      args: [],
    );
  }

  /// `Dividers can be used in lists, drawers, and elsewhere to separate content.`
  String get demoDividerDescription {
    return Intl.message(
      'Dividers can be used in lists, drawers, and elsewhere to separate content.',
      name: 'demoDividerDescription',
      desc: 'Description for the divider component demo.',
      args: [],
    );
  }

  /// `Vertical Divider`
  String get demoVerticalDividerTitle {
    return Intl.message(
      'Vertical Divider',
      name: 'demoVerticalDividerTitle',
      desc: 'Title for the vertical divider component demo.',
      args: [],
    );
  }

  /// `Grid Lists`
  String get demoGridListsTitle {
    return Intl.message(
      'Grid Lists',
      name: 'demoGridListsTitle',
      desc: 'Title for the grid lists component demo.',
      args: [],
    );
  }

  /// `Row and column layout`
  String get demoGridListsSubtitle {
    return Intl.message(
      'Row and column layout',
      name: 'demoGridListsSubtitle',
      desc: 'Subtitle for the grid lists component demo.',
      args: [],
    );
  }

  /// `Grid Lists are best suited for presenting homogeneous data, typically images. Each item in a grid list is called a tile.`
  String get demoGridListsDescription {
    return Intl.message(
      'Grid Lists are best suited for presenting homogeneous data, typically images. Each item in a grid list is called a tile.',
      name: 'demoGridListsDescription',
      desc: 'Description for the grid lists component demo.',
      args: [],
    );
  }

  /// `Image only`
  String get demoGridListsImageOnlyTitle {
    return Intl.message(
      'Image only',
      name: 'demoGridListsImageOnlyTitle',
      desc: 'Title for the grid lists image-only component demo.',
      args: [],
    );
  }

  /// `With header`
  String get demoGridListsHeaderTitle {
    return Intl.message(
      'With header',
      name: 'demoGridListsHeaderTitle',
      desc:
          'Title for the grid lists component demo with headers on each tile.',
      args: [],
    );
  }

  /// `With footer`
  String get demoGridListsFooterTitle {
    return Intl.message(
      'With footer',
      name: 'demoGridListsFooterTitle',
      desc:
          'Title for the grid lists component demo with footers on each tile.',
      args: [],
    );
  }

  /// `Sliders`
  String get demoSlidersTitle {
    return Intl.message(
      'Sliders',
      name: 'demoSlidersTitle',
      desc: 'Title for the sliders component demo.',
      args: [],
    );
  }

  /// `Widgets for selecting a value by swiping`
  String get demoSlidersSubtitle {
    return Intl.message(
      'Widgets for selecting a value by swiping',
      name: 'demoSlidersSubtitle',
      desc: 'Short description for the sliders component demo.',
      args: [],
    );
  }

  /// `Sliders reflect a range of values along a bar, from which users may select a single value. They are ideal for adjusting settings such as volume, brightness, or applying image filters.`
  String get demoSlidersDescription {
    return Intl.message(
      'Sliders reflect a range of values along a bar, from which users may select a single value. They are ideal for adjusting settings such as volume, brightness, or applying image filters.',
      name: 'demoSlidersDescription',
      desc: 'Description for the sliders demo.',
      args: [],
    );
  }

  /// `Range Sliders`
  String get demoRangeSlidersTitle {
    return Intl.message(
      'Range Sliders',
      name: 'demoRangeSlidersTitle',
      desc: 'Title for the range sliders component demo.',
      args: [],
    );
  }

  /// `Sliders reflect a range of values along a bar. They can have icons on both ends of the bar that reflect a range of values. They are ideal for adjusting settings such as volume, brightness, or applying image filters.`
  String get demoRangeSlidersDescription {
    return Intl.message(
      'Sliders reflect a range of values along a bar. They can have icons on both ends of the bar that reflect a range of values. They are ideal for adjusting settings such as volume, brightness, or applying image filters.',
      name: 'demoRangeSlidersDescription',
      desc: 'Description for the range sliders demo.',
      args: [],
    );
  }

  /// `Custom Sliders`
  String get demoCustomSlidersTitle {
    return Intl.message(
      'Custom Sliders',
      name: 'demoCustomSlidersTitle',
      desc: 'Title for the custom sliders component demo.',
      args: [],
    );
  }

  /// `Sliders reflect a range of values along a bar, from which users may select a single value or range of values. The sliders can be themed and customized.`
  String get demoCustomSlidersDescription {
    return Intl.message(
      'Sliders reflect a range of values along a bar, from which users may select a single value or range of values. The sliders can be themed and customized.',
      name: 'demoCustomSlidersDescription',
      desc: 'Description for the custom sliders demo.',
      args: [],
    );
  }

  /// `Continuous with Editable Numerical Value`
  String get demoSlidersContinuousWithEditableNumericalValue {
    return Intl.message(
      'Continuous with Editable Numerical Value',
      name: 'demoSlidersContinuousWithEditableNumericalValue',
      desc:
          'Text to describe a slider has a continuous value with an editable numerical value.',
      args: [],
    );
  }

  /// `Discrete`
  String get demoSlidersDiscrete {
    return Intl.message(
      'Discrete',
      name: 'demoSlidersDiscrete',
      desc: 'Text to describe that we have a slider with discrete values.',
      args: [],
    );
  }

  /// `Discrete Slider with Custom Theme`
  String get demoSlidersDiscreteSliderWithCustomTheme {
    return Intl.message(
      'Discrete Slider with Custom Theme',
      name: 'demoSlidersDiscreteSliderWithCustomTheme',
      desc:
          'Text to describe that we have a slider with discrete values and a custom theme. ',
      args: [],
    );
  }

  /// `Continuous Range Slider with Custom Theme`
  String get demoSlidersContinuousRangeSliderWithCustomTheme {
    return Intl.message(
      'Continuous Range Slider with Custom Theme',
      name: 'demoSlidersContinuousRangeSliderWithCustomTheme',
      desc:
          'Text to describe that we have a range slider with continuous values and a custom theme. ',
      args: [],
    );
  }

  /// `Continuous`
  String get demoSlidersContinuous {
    return Intl.message(
      'Continuous',
      name: 'demoSlidersContinuous',
      desc: 'Text to describe that we have a slider with continuous values.',
      args: [],
    );
  }

  /// `Editable numerical value`
  String get demoSlidersEditableNumericalValue {
    return Intl.message(
      'Editable numerical value',
      name: 'demoSlidersEditableNumericalValue',
      desc: 'Label for input field that has an editable numerical value.',
      args: [],
    );
  }

  /// `Menu`
  String get demoMenuTitle {
    return Intl.message(
      'Menu',
      name: 'demoMenuTitle',
      desc: 'Title for the menu component demo.',
      args: [],
    );
  }

  /// `Context menu`
  String get demoContextMenuTitle {
    return Intl.message(
      'Context menu',
      name: 'demoContextMenuTitle',
      desc: 'Title for the context menu component demo.',
      args: [],
    );
  }

  /// `Sectioned menu`
  String get demoSectionedMenuTitle {
    return Intl.message(
      'Sectioned menu',
      name: 'demoSectionedMenuTitle',
      desc: 'Title for the sectioned menu component demo.',
      args: [],
    );
  }

  /// `Simple menu`
  String get demoSimpleMenuTitle {
    return Intl.message(
      'Simple menu',
      name: 'demoSimpleMenuTitle',
      desc: 'Title for the simple menu component demo.',
      args: [],
    );
  }

  /// `Checklist menu`
  String get demoChecklistMenuTitle {
    return Intl.message(
      'Checklist menu',
      name: 'demoChecklistMenuTitle',
      desc: 'Title for the checklist menu component demo.',
      args: [],
    );
  }

  /// `Menu buttons and simple menus`
  String get demoMenuSubtitle {
    return Intl.message(
      'Menu buttons and simple menus',
      name: 'demoMenuSubtitle',
      desc: 'Short description for the menu component demo.',
      args: [],
    );
  }

  /// `A menu displays a list of choices on a temporary surface. They appear when users interact with a button, action, or other control.`
  String get demoMenuDescription {
    return Intl.message(
      'A menu displays a list of choices on a temporary surface. They appear when users interact with a button, action, or other control.',
      name: 'demoMenuDescription',
      desc: 'Description for the menu demo.',
      args: [],
    );
  }

  /// `Menu item one`
  String get demoMenuItemValueOne {
    return Intl.message(
      'Menu item one',
      name: 'demoMenuItemValueOne',
      desc: 'The first item in a menu.',
      args: [],
    );
  }

  /// `Menu item two`
  String get demoMenuItemValueTwo {
    return Intl.message(
      'Menu item two',
      name: 'demoMenuItemValueTwo',
      desc: 'The second item in a menu.',
      args: [],
    );
  }

  /// `Menu item three`
  String get demoMenuItemValueThree {
    return Intl.message(
      'Menu item three',
      name: 'demoMenuItemValueThree',
      desc: 'The third item in a menu.',
      args: [],
    );
  }

  /// `One`
  String get demoMenuOne {
    return Intl.message(
      'One',
      name: 'demoMenuOne',
      desc: 'The number one.',
      args: [],
    );
  }

  /// `Two`
  String get demoMenuTwo {
    return Intl.message(
      'Two',
      name: 'demoMenuTwo',
      desc: 'The number two.',
      args: [],
    );
  }

  /// `Three`
  String get demoMenuThree {
    return Intl.message(
      'Three',
      name: 'demoMenuThree',
      desc: 'The number three.',
      args: [],
    );
  }

  /// `Four`
  String get demoMenuFour {
    return Intl.message(
      'Four',
      name: 'demoMenuFour',
      desc: 'The number four.',
      args: [],
    );
  }

  /// `An item with a context menu`
  String get demoMenuAnItemWithAContextMenuButton {
    return Intl.message(
      'An item with a context menu',
      name: 'demoMenuAnItemWithAContextMenuButton',
      desc:
          'Label next to a button that opens a menu. A menu displays a list of choices on a temporary surface. Used as an example in a demo.',
      args: [],
    );
  }

  /// `Context menu item one`
  String get demoMenuContextMenuItemOne {
    return Intl.message(
      'Context menu item one',
      name: 'demoMenuContextMenuItemOne',
      desc:
          'Text label for a context menu item. A menu displays a list of choices on a temporary surface. Used as an example in a demo.',
      args: [],
    );
  }

  /// `Disabled menu item`
  String get demoMenuADisabledMenuItem {
    return Intl.message(
      'Disabled menu item',
      name: 'demoMenuADisabledMenuItem',
      desc:
          'Text label for a disabled menu item. A menu displays a list of choices on a temporary surface. Used as an example in a demo.',
      args: [],
    );
  }

  /// `Context menu item three`
  String get demoMenuContextMenuItemThree {
    return Intl.message(
      'Context menu item three',
      name: 'demoMenuContextMenuItemThree',
      desc:
          'Text label for a context menu item three. A menu displays a list of choices on a temporary surface. Used as an example in a demo.',
      args: [],
    );
  }

  /// `An item with a sectioned menu`
  String get demoMenuAnItemWithASectionedMenu {
    return Intl.message(
      'An item with a sectioned menu',
      name: 'demoMenuAnItemWithASectionedMenu',
      desc:
          'Label next to a button that opens a sectioned menu . A menu displays a list of choices on a temporary surface. Used as an example in a demo.',
      args: [],
    );
  }

  /// `Preview`
  String get demoMenuPreview {
    return Intl.message(
      'Preview',
      name: 'demoMenuPreview',
      desc: 'Button to preview content.',
      args: [],
    );
  }

  /// `Share`
  String get demoMenuShare {
    return Intl.message(
      'Share',
      name: 'demoMenuShare',
      desc: 'Button to share content.',
      args: [],
    );
  }

  /// `Get link`
  String get demoMenuGetLink {
    return Intl.message(
      'Get link',
      name: 'demoMenuGetLink',
      desc: 'Button to get link for content.',
      args: [],
    );
  }

  /// `Remove`
  String get demoMenuRemove {
    return Intl.message(
      'Remove',
      name: 'demoMenuRemove',
      desc: 'Button to remove content.',
      args: [],
    );
  }

  /// `Selected: {value}`
  String demoMenuSelected(Object value) {
    return Intl.message(
      'Selected: $value',
      name: 'demoMenuSelected',
      desc: 'A text to show what value was selected.',
      args: [value],
    );
  }

  /// `Checked: {value}`
  String demoMenuChecked(Object value) {
    return Intl.message(
      'Checked: $value',
      name: 'demoMenuChecked',
      desc: 'A text to show what value was checked.',
      args: [value],
    );
  }

  /// `Navigation Drawer`
  String get demoNavigationDrawerTitle {
    return Intl.message(
      'Navigation Drawer',
      name: 'demoNavigationDrawerTitle',
      desc: 'Title for the material drawer component demo.',
      args: [],
    );
  }

  /// `Displaying a drawer within appbar`
  String get demoNavigationDrawerSubtitle {
    return Intl.message(
      'Displaying a drawer within appbar',
      name: 'demoNavigationDrawerSubtitle',
      desc: 'Subtitle for the material drawer component demo.',
      args: [],
    );
  }

  /// `A Material Design panel that slides in horizontally from the edge of the screen to show navigation links in an application.`
  String get demoNavigationDrawerDescription {
    return Intl.message(
      'A Material Design panel that slides in horizontally from the edge of the screen to show navigation links in an application.',
      name: 'demoNavigationDrawerDescription',
      desc: 'Description for the material drawer component demo.',
      args: [],
    );
  }

  /// `User Name`
  String get demoNavigationDrawerUserName {
    return Intl.message(
      'User Name',
      name: 'demoNavigationDrawerUserName',
      desc: 'Demo username for navigation drawer.',
      args: [],
    );
  }

  /// `user.name@example.com`
  String get demoNavigationDrawerUserEmail {
    return Intl.message(
      'user.name@example.com',
      name: 'demoNavigationDrawerUserEmail',
      desc: 'Demo email for navigation drawer.',
      args: [],
    );
  }

  /// `Item One`
  String get demoNavigationDrawerToPageOne {
    return Intl.message(
      'Item One',
      name: 'demoNavigationDrawerToPageOne',
      desc: 'Drawer Item One.',
      args: [],
    );
  }

  /// `Item Two`
  String get demoNavigationDrawerToPageTwo {
    return Intl.message(
      'Item Two',
      name: 'demoNavigationDrawerToPageTwo',
      desc: 'Drawer Item Two.',
      args: [],
    );
  }

  /// `Swipe from the edge or tap the upper-left icon to see the drawer`
  String get demoNavigationDrawerText {
    return Intl.message(
      'Swipe from the edge or tap the upper-left icon to see the drawer',
      name: 'demoNavigationDrawerText',
      desc: 'Description to open navigation drawer.',
      args: [],
    );
  }

  /// `Navigation Rail`
  String get demoNavigationRailTitle {
    return Intl.message(
      'Navigation Rail',
      name: 'demoNavigationRailTitle',
      desc: 'Title for the material Navigation Rail component demo.',
      args: [],
    );
  }

  /// `Displaying a Navigation Rail within an app`
  String get demoNavigationRailSubtitle {
    return Intl.message(
      'Displaying a Navigation Rail within an app',
      name: 'demoNavigationRailSubtitle',
      desc: 'Subtitle for the material Navigation Rail component demo.',
      args: [],
    );
  }

  /// `A material widget that is meant to be displayed at the left or right of an app to navigate between a small number of views, typically between three and five.`
  String get demoNavigationRailDescription {
    return Intl.message(
      'A material widget that is meant to be displayed at the left or right of an app to navigate between a small number of views, typically between three and five.',
      name: 'demoNavigationRailDescription',
      desc: 'Description for the material Navigation Rail component demo.',
      args: [],
    );
  }

  /// `First`
  String get demoNavigationRailFirst {
    return Intl.message(
      'First',
      name: 'demoNavigationRailFirst',
      desc: 'Navigation Rail destination first label.',
      args: [],
    );
  }

  /// `Second`
  String get demoNavigationRailSecond {
    return Intl.message(
      'Second',
      name: 'demoNavigationRailSecond',
      desc: 'Navigation Rail destination second label.',
      args: [],
    );
  }

  /// `Third`
  String get demoNavigationRailThird {
    return Intl.message(
      'Third',
      name: 'demoNavigationRailThird',
      desc: 'Navigation Rail destination Third label.',
      args: [],
    );
  }

  /// `An item with a simple menu`
  String get demoMenuAnItemWithASimpleMenu {
    return Intl.message(
      'An item with a simple menu',
      name: 'demoMenuAnItemWithASimpleMenu',
      desc:
          'Label next to a button that opens a simple menu. A menu displays a list of choices on a temporary surface. Used as an example in a demo.',
      args: [],
    );
  }

  /// `An item with a checklist menu`
  String get demoMenuAnItemWithAChecklistMenu {
    return Intl.message(
      'An item with a checklist menu',
      name: 'demoMenuAnItemWithAChecklistMenu',
      desc:
          'Label next to a button that opens a checklist menu. A menu displays a list of choices on a temporary surface. Used as an example in a demo.',
      args: [],
    );
  }

  /// `Fullscreen`
  String get demoFullscreenDialogTitle {
    return Intl.message(
      'Fullscreen',
      name: 'demoFullscreenDialogTitle',
      desc: 'Title for the fullscreen dialog component demo.',
      args: [],
    );
  }

  /// `The fullscreenDialog property specifies whether the incoming page is a fullscreen modal dialog`
  String get demoFullscreenDialogDescription {
    return Intl.message(
      'The fullscreenDialog property specifies whether the incoming page is a fullscreen modal dialog',
      name: 'demoFullscreenDialogDescription',
      desc: 'Description for the fullscreen dialog component demo.',
      args: [],
    );
  }

  /// `Activity indicator`
  String get demoCupertinoActivityIndicatorTitle {
    return Intl.message(
      'Activity indicator',
      name: 'demoCupertinoActivityIndicatorTitle',
      desc: 'Title for the cupertino activity indicator component demo.',
      args: [],
    );
  }

  /// `iOS-style activity indicators`
  String get demoCupertinoActivityIndicatorSubtitle {
    return Intl.message(
      'iOS-style activity indicators',
      name: 'demoCupertinoActivityIndicatorSubtitle',
      desc: 'Subtitle for the cupertino activity indicator component demo.',
      args: [],
    );
  }

  /// `An iOS-style activity indicator that spins clockwise.`
  String get demoCupertinoActivityIndicatorDescription {
    return Intl.message(
      'An iOS-style activity indicator that spins clockwise.',
      name: 'demoCupertinoActivityIndicatorDescription',
      desc: 'Description for the cupertino activity indicator component demo.',
      args: [],
    );
  }

  /// `Buttons`
  String get demoCupertinoButtonsTitle {
    return Intl.message(
      'Buttons',
      name: 'demoCupertinoButtonsTitle',
      desc: 'Title for the cupertino buttons component demo.',
      args: [],
    );
  }

  /// `iOS-style buttons`
  String get demoCupertinoButtonsSubtitle {
    return Intl.message(
      'iOS-style buttons',
      name: 'demoCupertinoButtonsSubtitle',
      desc: 'Subtitle for the cupertino buttons component demo.',
      args: [],
    );
  }

  /// `An iOS-style button. It takes in text and/or an icon that fades out and in on touch. May optionally have a background.`
  String get demoCupertinoButtonsDescription {
    return Intl.message(
      'An iOS-style button. It takes in text and/or an icon that fades out and in on touch. May optionally have a background.',
      name: 'demoCupertinoButtonsDescription',
      desc: 'Description for the cupertino buttons component demo.',
      args: [],
    );
  }

  /// `Context Menu`
  String get demoCupertinoContextMenuTitle {
    return Intl.message(
      'Context Menu',
      name: 'demoCupertinoContextMenuTitle',
      desc: 'Title for the cupertino context menu component demo.',
      args: [],
    );
  }

  /// `iOS-style context menu`
  String get demoCupertinoContextMenuSubtitle {
    return Intl.message(
      'iOS-style context menu',
      name: 'demoCupertinoContextMenuSubtitle',
      desc: 'Subtitle for the cupertino context menu component demo.',
      args: [],
    );
  }

  /// `An iOS-style full screen contextual menu that appears when an element is long-pressed.`
  String get demoCupertinoContextMenuDescription {
    return Intl.message(
      'An iOS-style full screen contextual menu that appears when an element is long-pressed.',
      name: 'demoCupertinoContextMenuDescription',
      desc: 'Description for the cupertino context menu component demo.',
      args: [],
    );
  }

  /// `Action one`
  String get demoCupertinoContextMenuActionOne {
    return Intl.message(
      'Action one',
      name: 'demoCupertinoContextMenuActionOne',
      desc: 'Context menu list item one',
      args: [],
    );
  }

  /// `Action two`
  String get demoCupertinoContextMenuActionTwo {
    return Intl.message(
      'Action two',
      name: 'demoCupertinoContextMenuActionTwo',
      desc: 'Context menu list item two',
      args: [],
    );
  }

  /// `Tap and hold the Flutter logo to see the context menu.`
  String get demoCupertinoContextMenuActionText {
    return Intl.message(
      'Tap and hold the Flutter logo to see the context menu.',
      name: 'demoCupertinoContextMenuActionText',
      desc: 'Context menu text.',
      args: [],
    );
  }

  /// `Alerts`
  String get demoCupertinoAlertsTitle {
    return Intl.message(
      'Alerts',
      name: 'demoCupertinoAlertsTitle',
      desc: 'Title for the cupertino alerts component demo.',
      args: [],
    );
  }

  /// `iOS-style alert dialogs`
  String get demoCupertinoAlertsSubtitle {
    return Intl.message(
      'iOS-style alert dialogs',
      name: 'demoCupertinoAlertsSubtitle',
      desc: 'Subtitle for the cupertino alerts component demo.',
      args: [],
    );
  }

  /// `Alert`
  String get demoCupertinoAlertTitle {
    return Intl.message(
      'Alert',
      name: 'demoCupertinoAlertTitle',
      desc: 'Title for the cupertino alert component demo.',
      args: [],
    );
  }

  /// `An alert dialog informs the user about situations that require acknowledgement. An alert dialog has an optional title, optional content, and an optional list of actions. The title is displayed above the content and the actions are displayed below the content.`
  String get demoCupertinoAlertDescription {
    return Intl.message(
      'An alert dialog informs the user about situations that require acknowledgement. An alert dialog has an optional title, optional content, and an optional list of actions. The title is displayed above the content and the actions are displayed below the content.',
      name: 'demoCupertinoAlertDescription',
      desc: 'Description for the cupertino alert component demo.',
      args: [],
    );
  }

  /// `Alert With Title`
  String get demoCupertinoAlertWithTitleTitle {
    return Intl.message(
      'Alert With Title',
      name: 'demoCupertinoAlertWithTitleTitle',
      desc: 'Title for the cupertino alert with title component demo.',
      args: [],
    );
  }

  /// `Alert With Buttons`
  String get demoCupertinoAlertButtonsTitle {
    return Intl.message(
      'Alert With Buttons',
      name: 'demoCupertinoAlertButtonsTitle',
      desc: 'Title for the cupertino alert with buttons component demo.',
      args: [],
    );
  }

  /// `Alert Buttons Only`
  String get demoCupertinoAlertButtonsOnlyTitle {
    return Intl.message(
      'Alert Buttons Only',
      name: 'demoCupertinoAlertButtonsOnlyTitle',
      desc: 'Title for the cupertino alert buttons only component demo.',
      args: [],
    );
  }

  /// `Action Sheet`
  String get demoCupertinoActionSheetTitle {
    return Intl.message(
      'Action Sheet',
      name: 'demoCupertinoActionSheetTitle',
      desc: 'Title for the cupertino action sheet component demo.',
      args: [],
    );
  }

  /// `An action sheet is a specific style of alert that presents the user with a set of two or more choices related to the current context. An action sheet can have a title, an additional message, and a list of actions.`
  String get demoCupertinoActionSheetDescription {
    return Intl.message(
      'An action sheet is a specific style of alert that presents the user with a set of two or more choices related to the current context. An action sheet can have a title, an additional message, and a list of actions.',
      name: 'demoCupertinoActionSheetDescription',
      desc: 'Description for the cupertino action sheet component demo.',
      args: [],
    );
  }

  /// `Navigation bar`
  String get demoCupertinoNavigationBarTitle {
    return Intl.message(
      'Navigation bar',
      name: 'demoCupertinoNavigationBarTitle',
      desc: 'Title for the cupertino navigation bar component demo.',
      args: [],
    );
  }

  /// `iOS-style navigation bar`
  String get demoCupertinoNavigationBarSubtitle {
    return Intl.message(
      'iOS-style navigation bar',
      name: 'demoCupertinoNavigationBarSubtitle',
      desc: 'Subtitle for the cupertino navigation bar component demo.',
      args: [],
    );
  }

  /// `An iOS-styled navigation bar. The navigation bar is a toolbar that minimally consists of a page title, in the middle of the toolbar.`
  String get demoCupertinoNavigationBarDescription {
    return Intl.message(
      'An iOS-styled navigation bar. The navigation bar is a toolbar that minimally consists of a page title, in the middle of the toolbar.',
      name: 'demoCupertinoNavigationBarDescription',
      desc: 'Description for the cupertino navigation bar component demo.',
      args: [],
    );
  }

  /// `Pickers`
  String get demoCupertinoPickerTitle {
    return Intl.message(
      'Pickers',
      name: 'demoCupertinoPickerTitle',
      desc: 'Title for the cupertino date and time pickers component demo.',
      args: [],
    );
  }

  /// `iOS-style date and time pickers`
  String get demoCupertinoPickerSubtitle {
    return Intl.message(
      'iOS-style date and time pickers',
      name: 'demoCupertinoPickerSubtitle',
      desc: 'Subtitle for the cupertino pickers component demo.',
      args: [],
    );
  }

  /// `An iOS-style picker widget that can be used to select dates, times, or both date and time.`
  String get demoCupertinoPickerDescription {
    return Intl.message(
      'An iOS-style picker widget that can be used to select dates, times, or both date and time.',
      name: 'demoCupertinoPickerDescription',
      desc: 'Description for the cupertino pickers component demo.',
      args: [],
    );
  }

  /// `Timer`
  String get demoCupertinoPickerTimer {
    return Intl.message(
      'Timer',
      name: 'demoCupertinoPickerTimer',
      desc: 'Label to open a countdown timer picker.',
      args: [],
    );
  }

  /// `Date`
  String get demoCupertinoPickerDate {
    return Intl.message(
      'Date',
      name: 'demoCupertinoPickerDate',
      desc: 'Label to open a date picker.',
      args: [],
    );
  }

  /// `Time`
  String get demoCupertinoPickerTime {
    return Intl.message(
      'Time',
      name: 'demoCupertinoPickerTime',
      desc: 'Label to open a time picker.',
      args: [],
    );
  }

  /// `Date and Time`
  String get demoCupertinoPickerDateTime {
    return Intl.message(
      'Date and Time',
      name: 'demoCupertinoPickerDateTime',
      desc: 'Label to open a date and time picker.',
      args: [],
    );
  }

  /// `Pull to refresh`
  String get demoCupertinoPullToRefreshTitle {
    return Intl.message(
      'Pull to refresh',
      name: 'demoCupertinoPullToRefreshTitle',
      desc: 'Title for the cupertino pull-to-refresh component demo.',
      args: [],
    );
  }

  /// `iOS-style pull to refresh control`
  String get demoCupertinoPullToRefreshSubtitle {
    return Intl.message(
      'iOS-style pull to refresh control',
      name: 'demoCupertinoPullToRefreshSubtitle',
      desc: 'Subtitle for the cupertino pull-to-refresh component demo.',
      args: [],
    );
  }

  /// `A widget implementing the iOS-style pull to refresh content control.`
  String get demoCupertinoPullToRefreshDescription {
    return Intl.message(
      'A widget implementing the iOS-style pull to refresh content control.',
      name: 'demoCupertinoPullToRefreshDescription',
      desc: 'Description for the cupertino pull-to-refresh component demo.',
      args: [],
    );
  }

  /// `Segmented control`
  String get demoCupertinoSegmentedControlTitle {
    return Intl.message(
      'Segmented control',
      name: 'demoCupertinoSegmentedControlTitle',
      desc: 'Title for the cupertino segmented control component demo.',
      args: [],
    );
  }

  /// `iOS-style segmented control`
  String get demoCupertinoSegmentedControlSubtitle {
    return Intl.message(
      'iOS-style segmented control',
      name: 'demoCupertinoSegmentedControlSubtitle',
      desc: 'Subtitle for the cupertino segmented control component demo.',
      args: [],
    );
  }

  /// `Used to select between a number of mutually exclusive options. When one option in the segmented control is selected, the other options in the segmented control cease to be selected.`
  String get demoCupertinoSegmentedControlDescription {
    return Intl.message(
      'Used to select between a number of mutually exclusive options. When one option in the segmented control is selected, the other options in the segmented control cease to be selected.',
      name: 'demoCupertinoSegmentedControlDescription',
      desc: 'Description for the cupertino segmented control component demo.',
      args: [],
    );
  }

  /// `Slider`
  String get demoCupertinoSliderTitle {
    return Intl.message(
      'Slider',
      name: 'demoCupertinoSliderTitle',
      desc: 'Title for the cupertino slider component demo.',
      args: [],
    );
  }

  /// `iOS-style slider`
  String get demoCupertinoSliderSubtitle {
    return Intl.message(
      'iOS-style slider',
      name: 'demoCupertinoSliderSubtitle',
      desc: 'Subtitle for the cupertino slider component demo.',
      args: [],
    );
  }

  /// `A slider can be used to select from either a continuous or a discrete set of values.`
  String get demoCupertinoSliderDescription {
    return Intl.message(
      'A slider can be used to select from either a continuous or a discrete set of values.',
      name: 'demoCupertinoSliderDescription',
      desc: 'Description for the cupertino slider component demo.',
      args: [],
    );
  }

  /// `Continuous: {value}`
  String demoCupertinoSliderContinuous(Object value) {
    return Intl.message(
      'Continuous: $value',
      name: 'demoCupertinoSliderContinuous',
      desc:
          'A label for a continuous slider that indicates what value it is set to.',
      args: [value],
    );
  }

  /// `Discrete: {value}`
  String demoCupertinoSliderDiscrete(Object value) {
    return Intl.message(
      'Discrete: $value',
      name: 'demoCupertinoSliderDiscrete',
      desc:
          'A label for a discrete slider that indicates what value it is set to.',
      args: [value],
    );
  }

  /// `iOS-style switch`
  String get demoCupertinoSwitchSubtitle {
    return Intl.message(
      'iOS-style switch',
      name: 'demoCupertinoSwitchSubtitle',
      desc: 'Subtitle for the cupertino switch component demo.',
      args: [],
    );
  }

  /// `A switch is used to toggle the on/off state of a single setting.`
  String get demoCupertinoSwitchDescription {
    return Intl.message(
      'A switch is used to toggle the on/off state of a single setting.',
      name: 'demoCupertinoSwitchDescription',
      desc: 'Description for the cupertino switch component demo.',
      args: [],
    );
  }

  /// `Tab bar`
  String get demoCupertinoTabBarTitle {
    return Intl.message(
      'Tab bar',
      name: 'demoCupertinoTabBarTitle',
      desc: 'Title for the cupertino bottom tab bar demo.',
      args: [],
    );
  }

  /// `iOS-style bottom tab bar`
  String get demoCupertinoTabBarSubtitle {
    return Intl.message(
      'iOS-style bottom tab bar',
      name: 'demoCupertinoTabBarSubtitle',
      desc: 'Subtitle for the cupertino bottom tab bar demo.',
      args: [],
    );
  }

  /// `An iOS-style bottom navigation tab bar. Displays multiple tabs with one tab being active, the first tab by default.`
  String get demoCupertinoTabBarDescription {
    return Intl.message(
      'An iOS-style bottom navigation tab bar. Displays multiple tabs with one tab being active, the first tab by default.',
      name: 'demoCupertinoTabBarDescription',
      desc: 'Description for the cupertino bottom tab bar demo.',
      args: [],
    );
  }

  /// `Home`
  String get cupertinoTabBarHomeTab {
    return Intl.message(
      'Home',
      name: 'cupertinoTabBarHomeTab',
      desc: 'Title for the home tab in the bottom tab bar demo.',
      args: [],
    );
  }

  /// `Chat`
  String get cupertinoTabBarChatTab {
    return Intl.message(
      'Chat',
      name: 'cupertinoTabBarChatTab',
      desc: 'Title for the chat tab in the bottom tab bar demo.',
      args: [],
    );
  }

  /// `Profile`
  String get cupertinoTabBarProfileTab {
    return Intl.message(
      'Profile',
      name: 'cupertinoTabBarProfileTab',
      desc: 'Title for the profile tab in the bottom tab bar demo.',
      args: [],
    );
  }

  /// `Text fields`
  String get demoCupertinoTextFieldTitle {
    return Intl.message(
      'Text fields',
      name: 'demoCupertinoTextFieldTitle',
      desc: 'Title for the cupertino text field demo.',
      args: [],
    );
  }

  /// `iOS-style text fields`
  String get demoCupertinoTextFieldSubtitle {
    return Intl.message(
      'iOS-style text fields',
      name: 'demoCupertinoTextFieldSubtitle',
      desc: 'Subtitle for the cupertino text field demo.',
      args: [],
    );
  }

  /// `A text field lets the user enter text, either with a hardware keyboard or with an onscreen keyboard.`
  String get demoCupertinoTextFieldDescription {
    return Intl.message(
      'A text field lets the user enter text, either with a hardware keyboard or with an onscreen keyboard.',
      name: 'demoCupertinoTextFieldDescription',
      desc: 'Description for the cupertino text field demo.',
      args: [],
    );
  }

  /// `PIN`
  String get demoCupertinoTextFieldPIN {
    return Intl.message(
      'PIN',
      name: 'demoCupertinoTextFieldPIN',
      desc:
          'The placeholder for a text field where a user would enter their PIN number.',
      args: [],
    );
  }

  /// `Motion`
  String get demoMotionTitle {
    return Intl.message(
      'Motion',
      name: 'demoMotionTitle',
      desc: 'Title for the motion demo.',
      args: [],
    );
  }

  /// `All of the predefined transition patterns`
  String get demoMotionSubtitle {
    return Intl.message(
      'All of the predefined transition patterns',
      name: 'demoMotionSubtitle',
      desc: 'Subtitle for the motion demo.',
      args: [],
    );
  }

  /// `Cards, Lists & FAB`
  String get demoContainerTransformDemoInstructions {
    return Intl.message(
      'Cards, Lists & FAB',
      name: 'demoContainerTransformDemoInstructions',
      desc:
          'Instructions for the container transform demo located in the app bar.',
      args: [],
    );
  }

  /// `Next and Back Buttons`
  String get demoSharedXAxisDemoInstructions {
    return Intl.message(
      'Next and Back Buttons',
      name: 'demoSharedXAxisDemoInstructions',
      desc: 'Instructions for the shared x axis demo located in the app bar.',
      args: [],
    );
  }

  /// `Sort by "Recently Played"`
  String get demoSharedYAxisDemoInstructions {
    return Intl.message(
      'Sort by "Recently Played"',
      name: 'demoSharedYAxisDemoInstructions',
      desc: 'Instructions for the shared y axis demo located in the app bar.',
      args: [],
    );
  }

  /// `Settings icon button`
  String get demoSharedZAxisDemoInstructions {
    return Intl.message(
      'Settings icon button',
      name: 'demoSharedZAxisDemoInstructions',
      desc: 'Instructions for the shared z axis demo located in the app bar.',
      args: [],
    );
  }

  /// `Bottom navigation`
  String get demoFadeThroughDemoInstructions {
    return Intl.message(
      'Bottom navigation',
      name: 'demoFadeThroughDemoInstructions',
      desc: 'Instructions for the fade through demo located in the app bar.',
      args: [],
    );
  }

  /// `Modal and FAB`
  String get demoFadeScaleDemoInstructions {
    return Intl.message(
      'Modal and FAB',
      name: 'demoFadeScaleDemoInstructions',
      desc: 'Instructions for the fade scale demo located in the app bar.',
      args: [],
    );
  }

  /// `Container Transform`
  String get demoContainerTransformTitle {
    return Intl.message(
      'Container Transform',
      name: 'demoContainerTransformTitle',
      desc: 'Title for the container transform demo.',
      args: [],
    );
  }

  /// `The container transform pattern is designed for transitions between UI elements that include a container. This pattern creates a visible connection between two UI elements`
  String get demoContainerTransformDescription {
    return Intl.message(
      'The container transform pattern is designed for transitions between UI elements that include a container. This pattern creates a visible connection between two UI elements',
      name: 'demoContainerTransformDescription',
      desc: 'Description for the container transform demo.',
      args: [],
    );
  }

  /// `Fade mode`
  String get demoContainerTransformModalBottomSheetTitle {
    return Intl.message(
      'Fade mode',
      name: 'demoContainerTransformModalBottomSheetTitle',
      desc: 'Title for the container transform modal bottom sheet.',
      args: [],
    );
  }

  /// `FADE`
  String get demoContainerTransformTypeFade {
    return Intl.message(
      'FADE',
      name: 'demoContainerTransformTypeFade',
      desc: 'Description for container transform fade type setting.',
      args: [],
    );
  }

  /// `FADE THROUGH`
  String get demoContainerTransformTypeFadeThrough {
    return Intl.message(
      'FADE THROUGH',
      name: 'demoContainerTransformTypeFadeThrough',
      desc: 'Description for container transform fade through type setting.',
      args: [],
    );
  }

  /// `Title`
  String get demoMotionPlaceholderTitle {
    return Intl.message(
      'Title',
      name: 'demoMotionPlaceholderTitle',
      desc: 'The placeholder for the motion demos title properties.',
      args: [],
    );
  }

  /// `Secondary text`
  String get demoMotionPlaceholderSubtitle {
    return Intl.message(
      'Secondary text',
      name: 'demoMotionPlaceholderSubtitle',
      desc: 'The placeholder for the motion demos subtitle properties.',
      args: [],
    );
  }

  /// `Secondary`
  String get demoMotionSmallPlaceholderSubtitle {
    return Intl.message(
      'Secondary',
      name: 'demoMotionSmallPlaceholderSubtitle',
      desc:
          'The placeholder for the motion demos shortened subtitle properties.',
      args: [],
    );
  }

  /// `Details Page`
  String get demoMotionDetailsPageTitle {
    return Intl.message(
      'Details Page',
      name: 'demoMotionDetailsPageTitle',
      desc: 'The title for the details page in the motion demos.',
      args: [],
    );
  }

  /// `List item`
  String get demoMotionListTileTitle {
    return Intl.message(
      'List item',
      name: 'demoMotionListTileTitle',
      desc: 'The title for a list tile in the motion demos.',
      args: [],
    );
  }

  /// `The shared axis pattern is used for transitions between the UI elements that have a spatial or navigational relationship. This pattern uses a shared transformation on the x, y, or z axis to reinforce the relationship between elements.`
  String get demoSharedAxisDescription {
    return Intl.message(
      'The shared axis pattern is used for transitions between the UI elements that have a spatial or navigational relationship. This pattern uses a shared transformation on the x, y, or z axis to reinforce the relationship between elements.',
      name: 'demoSharedAxisDescription',
      desc: 'Description for the shared y axis demo.',
      args: [],
    );
  }

  /// `Shared x-axis`
  String get demoSharedXAxisTitle {
    return Intl.message(
      'Shared x-axis',
      name: 'demoSharedXAxisTitle',
      desc: 'Title for the shared x axis demo.',
      args: [],
    );
  }

  /// `BACK`
  String get demoSharedXAxisBackButtonText {
    return Intl.message(
      'BACK',
      name: 'demoSharedXAxisBackButtonText',
      desc: 'Button text for back button in the shared x axis demo.',
      args: [],
    );
  }

  /// `NEXT`
  String get demoSharedXAxisNextButtonText {
    return Intl.message(
      'NEXT',
      name: 'demoSharedXAxisNextButtonText',
      desc: 'Button text for the next button in the shared x axis demo.',
      args: [],
    );
  }

  /// `Streamline your courses`
  String get demoSharedXAxisCoursePageTitle {
    return Intl.message(
      'Streamline your courses',
      name: 'demoSharedXAxisCoursePageTitle',
      desc: 'Title for course selection page in the shared x axis demo.',
      args: [],
    );
  }

  /// `Bundled categories appear as groups in your feed. You can always change this later.`
  String get demoSharedXAxisCoursePageSubtitle {
    return Intl.message(
      'Bundled categories appear as groups in your feed. You can always change this later.',
      name: 'demoSharedXAxisCoursePageSubtitle',
      desc: 'Subtitle for course selection page in the shared x axis demo.',
      args: [],
    );
  }

  /// `Arts & Crafts`
  String get demoSharedXAxisArtsAndCraftsCourseTitle {
    return Intl.message(
      'Arts & Crafts',
      name: 'demoSharedXAxisArtsAndCraftsCourseTitle',
      desc: 'Title for the Arts & Crafts course in the shared x axis demo.',
      args: [],
    );
  }

  /// `Business`
  String get demoSharedXAxisBusinessCourseTitle {
    return Intl.message(
      'Business',
      name: 'demoSharedXAxisBusinessCourseTitle',
      desc: 'Title for the Business course in the shared x axis demo.',
      args: [],
    );
  }

  /// `Illustration`
  String get demoSharedXAxisIllustrationCourseTitle {
    return Intl.message(
      'Illustration',
      name: 'demoSharedXAxisIllustrationCourseTitle',
      desc: 'Title for the Illustration course in the shared x axis demo.',
      args: [],
    );
  }

  /// `Design`
  String get demoSharedXAxisDesignCourseTitle {
    return Intl.message(
      'Design',
      name: 'demoSharedXAxisDesignCourseTitle',
      desc: 'Title for the Design course in the shared x axis demo.',
      args: [],
    );
  }

  /// `Culinary`
  String get demoSharedXAxisCulinaryCourseTitle {
    return Intl.message(
      'Culinary',
      name: 'demoSharedXAxisCulinaryCourseTitle',
      desc: 'Title for the Culinary course in the shared x axis demo.',
      args: [],
    );
  }

  /// `Bundled`
  String get demoSharedXAxisBundledCourseSubtitle {
    return Intl.message(
      'Bundled',
      name: 'demoSharedXAxisBundledCourseSubtitle',
      desc: 'Subtitle for a bundled course in the shared x axis demo.',
      args: [],
    );
  }

  /// `Shown Individually`
  String get demoSharedXAxisIndividualCourseSubtitle {
    return Intl.message(
      'Shown Individually',
      name: 'demoSharedXAxisIndividualCourseSubtitle',
      desc: 'Subtitle for a individual course in the shared x axis demo.',
      args: [],
    );
  }

  /// `Hi David Park`
  String get demoSharedXAxisSignInWelcomeText {
    return Intl.message(
      'Hi David Park',
      name: 'demoSharedXAxisSignInWelcomeText',
      desc:
          'Welcome text for sign in page in the shared x axis demo. David Park is a name and does not need to be translated.',
      args: [],
    );
  }

  /// `Sign in with your account`
  String get demoSharedXAxisSignInSubtitleText {
    return Intl.message(
      'Sign in with your account',
      name: 'demoSharedXAxisSignInSubtitleText',
      desc: 'Subtitle text for sign in page in the shared x axis demo.',
      args: [],
    );
  }

  /// `Email or phone number`
  String get demoSharedXAxisSignInTextFieldLabel {
    return Intl.message(
      'Email or phone number',
      name: 'demoSharedXAxisSignInTextFieldLabel',
      desc: 'Label text for the sign in text field in the shared x axis demo.',
      args: [],
    );
  }

  /// `FORGOT EMAIL?`
  String get demoSharedXAxisForgotEmailButtonText {
    return Intl.message(
      'FORGOT EMAIL?',
      name: 'demoSharedXAxisForgotEmailButtonText',
      desc:
          'Button text for the forgot email button in the shared x axis demo.',
      args: [],
    );
  }

  /// `CREATE ACCOUNT`
  String get demoSharedXAxisCreateAccountButtonText {
    return Intl.message(
      'CREATE ACCOUNT',
      name: 'demoSharedXAxisCreateAccountButtonText',
      desc:
          'Button text for the create account button in the shared x axis demo.',
      args: [],
    );
  }

  /// `Shared y-axis`
  String get demoSharedYAxisTitle {
    return Intl.message(
      'Shared y-axis',
      name: 'demoSharedYAxisTitle',
      desc: 'Title for the shared y axis demo.',
      args: [],
    );
  }

  /// `268 albums`
  String get demoSharedYAxisAlbumCount {
    return Intl.message(
      '268 albums',
      name: 'demoSharedYAxisAlbumCount',
      desc: 'Text for album count in the shared y axis demo.',
      args: [],
    );
  }

  /// `A-Z`
  String get demoSharedYAxisAlphabeticalSortTitle {
    return Intl.message(
      'A-Z',
      name: 'demoSharedYAxisAlphabeticalSortTitle',
      desc: 'Title for alphabetical sorting type in the shared y axis demo.',
      args: [],
    );
  }

  /// `Recently played`
  String get demoSharedYAxisRecentSortTitle {
    return Intl.message(
      'Recently played',
      name: 'demoSharedYAxisRecentSortTitle',
      desc: 'Title for recently played sorting type in the shared y axis demo.',
      args: [],
    );
  }

  /// `Album`
  String get demoSharedYAxisAlbumTileTitle {
    return Intl.message(
      'Album',
      name: 'demoSharedYAxisAlbumTileTitle',
      desc: 'Title for an AlbumTile in the shared y axis demo.',
      args: [],
    );
  }

  /// `Artist`
  String get demoSharedYAxisAlbumTileSubtitle {
    return Intl.message(
      'Artist',
      name: 'demoSharedYAxisAlbumTileSubtitle',
      desc: 'Subtitle for an AlbumTile in the shared y axis demo.',
      args: [],
    );
  }

  /// `min`
  String get demoSharedYAxisAlbumTileDurationUnit {
    return Intl.message(
      'min',
      name: 'demoSharedYAxisAlbumTileDurationUnit',
      desc: 'Duration unit for an AlbumTile in the shared y axis demo.',
      args: [],
    );
  }

  /// `Shared z-axis`
  String get demoSharedZAxisTitle {
    return Intl.message(
      'Shared z-axis',
      name: 'demoSharedZAxisTitle',
      desc: 'Title for the shared z axis demo.',
      args: [],
    );
  }

  /// `Settings`
  String get demoSharedZAxisSettingsPageTitle {
    return Intl.message(
      'Settings',
      name: 'demoSharedZAxisSettingsPageTitle',
      desc: 'Title for the settings page in the shared z axis demo.',
      args: [],
    );
  }

  /// `Burger`
  String get demoSharedZAxisBurgerRecipeTitle {
    return Intl.message(
      'Burger',
      name: 'demoSharedZAxisBurgerRecipeTitle',
      desc: 'Title for burger recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Burger recipe`
  String get demoSharedZAxisBurgerRecipeDescription {
    return Intl.message(
      'Burger recipe',
      name: 'demoSharedZAxisBurgerRecipeDescription',
      desc: 'Subtitle for the burger recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Sandwich`
  String get demoSharedZAxisSandwichRecipeTitle {
    return Intl.message(
      'Sandwich',
      name: 'demoSharedZAxisSandwichRecipeTitle',
      desc: 'Title for sandwich recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Sandwich recipe`
  String get demoSharedZAxisSandwichRecipeDescription {
    return Intl.message(
      'Sandwich recipe',
      name: 'demoSharedZAxisSandwichRecipeDescription',
      desc: 'Subtitle for the sandwich recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Dessert`
  String get demoSharedZAxisDessertRecipeTitle {
    return Intl.message(
      'Dessert',
      name: 'demoSharedZAxisDessertRecipeTitle',
      desc: 'Title for dessert recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Dessert recipe`
  String get demoSharedZAxisDessertRecipeDescription {
    return Intl.message(
      'Dessert recipe',
      name: 'demoSharedZAxisDessertRecipeDescription',
      desc: 'Subtitle for the dessert recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Shrimp`
  String get demoSharedZAxisShrimpPlateRecipeTitle {
    return Intl.message(
      'Shrimp',
      name: 'demoSharedZAxisShrimpPlateRecipeTitle',
      desc: 'Title for shrimp plate recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Shrimp plate recipe`
  String get demoSharedZAxisShrimpPlateRecipeDescription {
    return Intl.message(
      'Shrimp plate recipe',
      name: 'demoSharedZAxisShrimpPlateRecipeDescription',
      desc:
          'Subtitle for the shrimp plate recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Crab`
  String get demoSharedZAxisCrabPlateRecipeTitle {
    return Intl.message(
      'Crab',
      name: 'demoSharedZAxisCrabPlateRecipeTitle',
      desc: 'Title for crab plate recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Crab plate recipe`
  String get demoSharedZAxisCrabPlateRecipeDescription {
    return Intl.message(
      'Crab plate recipe',
      name: 'demoSharedZAxisCrabPlateRecipeDescription',
      desc:
          'Subtitle for the crab plate recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Beef Sandwich`
  String get demoSharedZAxisBeefSandwichRecipeTitle {
    return Intl.message(
      'Beef Sandwich',
      name: 'demoSharedZAxisBeefSandwichRecipeTitle',
      desc: 'Title for beef sandwich recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Beef Sandwich recipe`
  String get demoSharedZAxisBeefSandwichRecipeDescription {
    return Intl.message(
      'Beef Sandwich recipe',
      name: 'demoSharedZAxisBeefSandwichRecipeDescription',
      desc:
          'Subtitle for the beef sandwich recipe tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Saved Recipes`
  String get demoSharedZAxisSavedRecipesListTitle {
    return Intl.message(
      'Saved Recipes',
      name: 'demoSharedZAxisSavedRecipesListTitle',
      desc: 'Title for list of saved recipes in the shared z axis demo.',
      args: [],
    );
  }

  /// `Profile`
  String get demoSharedZAxisProfileSettingLabel {
    return Intl.message(
      'Profile',
      name: 'demoSharedZAxisProfileSettingLabel',
      desc: 'Text label for profile setting tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Notifications`
  String get demoSharedZAxisNotificationSettingLabel {
    return Intl.message(
      'Notifications',
      name: 'demoSharedZAxisNotificationSettingLabel',
      desc:
          'Text label for notifications setting tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Privacy`
  String get demoSharedZAxisPrivacySettingLabel {
    return Intl.message(
      'Privacy',
      name: 'demoSharedZAxisPrivacySettingLabel',
      desc:
          'Text label for the privacy setting tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Help`
  String get demoSharedZAxisHelpSettingLabel {
    return Intl.message(
      'Help',
      name: 'demoSharedZAxisHelpSettingLabel',
      desc: 'Text label for the help setting tile in the shared z axis demo.',
      args: [],
    );
  }

  /// `Fade through`
  String get demoFadeThroughTitle {
    return Intl.message(
      'Fade through',
      name: 'demoFadeThroughTitle',
      desc: 'Title for the fade through demo.',
      args: [],
    );
  }

  /// `The fade through pattern is used for transitions between UI elements that do not have a strong relationship to each other.`
  String get demoFadeThroughDescription {
    return Intl.message(
      'The fade through pattern is used for transitions between UI elements that do not have a strong relationship to each other.',
      name: 'demoFadeThroughDescription',
      desc: 'Description for the fade through demo.',
      args: [],
    );
  }

  /// `Albums`
  String get demoFadeThroughAlbumsDestination {
    return Intl.message(
      'Albums',
      name: 'demoFadeThroughAlbumsDestination',
      desc:
          'Text for albums bottom navigation bar destination in the fade through demo.',
      args: [],
    );
  }

  /// `Photos`
  String get demoFadeThroughPhotosDestination {
    return Intl.message(
      'Photos',
      name: 'demoFadeThroughPhotosDestination',
      desc:
          'Text for photos bottom navigation bar destination in the fade through demo.',
      args: [],
    );
  }

  /// `Search`
  String get demoFadeThroughSearchDestination {
    return Intl.message(
      'Search',
      name: 'demoFadeThroughSearchDestination',
      desc:
          'Text for search bottom navigation bar destination in the fade through demo.',
      args: [],
    );
  }

  /// `123 photos`
  String get demoFadeThroughTextPlaceholder {
    return Intl.message(
      '123 photos',
      name: 'demoFadeThroughTextPlaceholder',
      desc: 'Placeholder for example card title in the fade through demo.',
      args: [],
    );
  }

  /// `Fade`
  String get demoFadeScaleTitle {
    return Intl.message(
      'Fade',
      name: 'demoFadeScaleTitle',
      desc: 'Title for the fade scale demo.',
      args: [],
    );
  }

  /// `The fade pattern is used for UI elements that enter or exit within the bounds of the screen, such as a dialog that fades in the center of the screen.`
  String get demoFadeScaleDescription {
    return Intl.message(
      'The fade pattern is used for UI elements that enter or exit within the bounds of the screen, such as a dialog that fades in the center of the screen.',
      name: 'demoFadeScaleDescription',
      desc: 'Description for the fade scale demo.',
      args: [],
    );
  }

  /// `SHOW MODAL`
  String get demoFadeScaleShowAlertDialogButton {
    return Intl.message(
      'SHOW MODAL',
      name: 'demoFadeScaleShowAlertDialogButton',
      desc: 'Button text to show alert dialog in the fade scale demo.',
      args: [],
    );
  }

  /// `SHOW FAB`
  String get demoFadeScaleShowFabButton {
    return Intl.message(
      'SHOW FAB',
      name: 'demoFadeScaleShowFabButton',
      desc: 'Button text to show fab in the fade scale demo.',
      args: [],
    );
  }

  /// `HIDE FAB`
  String get demoFadeScaleHideFabButton {
    return Intl.message(
      'HIDE FAB',
      name: 'demoFadeScaleHideFabButton',
      desc: 'Button text to hide fab in the fade scale demo.',
      args: [],
    );
  }

  /// `Alert Dialog`
  String get demoFadeScaleAlertDialogHeader {
    return Intl.message(
      'Alert Dialog',
      name: 'demoFadeScaleAlertDialogHeader',
      desc: 'Generic header for alert dialog in the fade scale demo.',
      args: [],
    );
  }

  /// `CANCEL`
  String get demoFadeScaleAlertDialogCancelButton {
    return Intl.message(
      'CANCEL',
      name: 'demoFadeScaleAlertDialogCancelButton',
      desc:
          'Button text for alert dialog cancel button in the fade scale demo.',
      args: [],
    );
  }

  /// `DISCARD`
  String get demoFadeScaleAlertDialogDiscardButton {
    return Intl.message(
      'DISCARD',
      name: 'demoFadeScaleAlertDialogDiscardButton',
      desc:
          'Button text for alert dialog discard button in the fade scale demo.',
      args: [],
    );
  }

  /// `Colors`
  String get demoColorsTitle {
    return Intl.message(
      'Colors',
      name: 'demoColorsTitle',
      desc: 'Title for the colors demo.',
      args: [],
    );
  }

  /// `All of the predefined colors`
  String get demoColorsSubtitle {
    return Intl.message(
      'All of the predefined colors',
      name: 'demoColorsSubtitle',
      desc: 'Subtitle for the colors demo.',
      args: [],
    );
  }

  /// `Color and color swatch constants which represent Material Design's color palette.`
  String get demoColorsDescription {
    return Intl.message(
      'Color and color swatch constants which represent Material Design\'s color palette.',
      name: 'demoColorsDescription',
      desc:
          'Description for the colors demo. Material Design should remain capitalized.',
      args: [],
    );
  }

  /// `Typography`
  String get demoTypographyTitle {
    return Intl.message(
      'Typography',
      name: 'demoTypographyTitle',
      desc: 'Title for the typography demo.',
      args: [],
    );
  }

  /// `All of the predefined text styles`
  String get demoTypographySubtitle {
    return Intl.message(
      'All of the predefined text styles',
      name: 'demoTypographySubtitle',
      desc: 'Subtitle for the typography demo.',
      args: [],
    );
  }

  /// `Definitions for the various typographical styles found in Material Design.`
  String get demoTypographyDescription {
    return Intl.message(
      'Definitions for the various typographical styles found in Material Design.',
      name: 'demoTypographyDescription',
      desc:
          'Description for the typography demo. Material Design should remain capitalized.',
      args: [],
    );
  }

  /// `2D transformations`
  String get demo2dTransformationsTitle {
    return Intl.message(
      '2D transformations',
      name: 'demo2dTransformationsTitle',
      desc: 'Title for the 2D transformations demo.',
      args: [],
    );
  }

  /// `Pan, zoom, rotate`
  String get demo2dTransformationsSubtitle {
    return Intl.message(
      'Pan, zoom, rotate',
      name: 'demo2dTransformationsSubtitle',
      desc: 'Subtitle for the 2D transformations demo.',
      args: [],
    );
  }

  /// `Tap to edit tiles, and use gestures to move around the scene. Drag to pan, pinch to zoom, rotate with two fingers. Press the reset button to return to the starting orientation.`
  String get demo2dTransformationsDescription {
    return Intl.message(
      'Tap to edit tiles, and use gestures to move around the scene. Drag to pan, pinch to zoom, rotate with two fingers. Press the reset button to return to the starting orientation.',
      name: 'demo2dTransformationsDescription',
      desc: 'Description for the 2D transformations demo.',
      args: [],
    );
  }

  /// `Reset transformations`
  String get demo2dTransformationsResetTooltip {
    return Intl.message(
      'Reset transformations',
      name: 'demo2dTransformationsResetTooltip',
      desc:
          'Tooltip for a button to reset the transformations (scale, translation) for the 2D transformations demo.',
      args: [],
    );
  }

  /// `Edit tile`
  String get demo2dTransformationsEditTooltip {
    return Intl.message(
      'Edit tile',
      name: 'demo2dTransformationsEditTooltip',
      desc: 'Tooltip for a button to edit a tile.',
      args: [],
    );
  }

  /// `BUTTON`
  String get buttonText {
    return Intl.message(
      'BUTTON',
      name: 'buttonText',
      desc: 'Text for a generic button.',
      args: [],
    );
  }

  /// `Bottom sheet`
  String get demoBottomSheetTitle {
    return Intl.message(
      'Bottom sheet',
      name: 'demoBottomSheetTitle',
      desc: 'Title for bottom sheet demo.',
      args: [],
    );
  }

  /// `Persistent and modal bottom sheets`
  String get demoBottomSheetSubtitle {
    return Intl.message(
      'Persistent and modal bottom sheets',
      name: 'demoBottomSheetSubtitle',
      desc: 'Description for bottom sheet demo.',
      args: [],
    );
  }

  /// `Persistent bottom sheet`
  String get demoBottomSheetPersistentTitle {
    return Intl.message(
      'Persistent bottom sheet',
      name: 'demoBottomSheetPersistentTitle',
      desc: 'Title for persistent bottom sheet demo.',
      args: [],
    );
  }

  /// `A persistent bottom sheet shows information that supplements the primary content of the app. A persistent bottom sheet remains visible even when the user interacts with other parts of the app.`
  String get demoBottomSheetPersistentDescription {
    return Intl.message(
      'A persistent bottom sheet shows information that supplements the primary content of the app. A persistent bottom sheet remains visible even when the user interacts with other parts of the app.',
      name: 'demoBottomSheetPersistentDescription',
      desc: 'Description for persistent bottom sheet demo.',
      args: [],
    );
  }

  /// `Modal bottom sheet`
  String get demoBottomSheetModalTitle {
    return Intl.message(
      'Modal bottom sheet',
      name: 'demoBottomSheetModalTitle',
      desc: 'Title for modal bottom sheet demo.',
      args: [],
    );
  }

  /// `A modal bottom sheet is an alternative to a menu or a dialog and prevents the user from interacting with the rest of the app.`
  String get demoBottomSheetModalDescription {
    return Intl.message(
      'A modal bottom sheet is an alternative to a menu or a dialog and prevents the user from interacting with the rest of the app.',
      name: 'demoBottomSheetModalDescription',
      desc: 'Description for modal bottom sheet demo.',
      args: [],
    );
  }

  /// `Add`
  String get demoBottomSheetAddLabel {
    return Intl.message(
      'Add',
      name: 'demoBottomSheetAddLabel',
      desc: 'Semantic label for add icon.',
      args: [],
    );
  }

  /// `SHOW BOTTOM SHEET`
  String get demoBottomSheetButtonText {
    return Intl.message(
      'SHOW BOTTOM SHEET',
      name: 'demoBottomSheetButtonText',
      desc: 'Button text to show bottom sheet.',
      args: [],
    );
  }

  /// `Header`
  String get demoBottomSheetHeader {
    return Intl.message(
      'Header',
      name: 'demoBottomSheetHeader',
      desc: 'Generic header placeholder.',
      args: [],
    );
  }

  /// `Item {value}`
  String demoBottomSheetItem(Object value) {
    return Intl.message(
      'Item $value',
      name: 'demoBottomSheetItem',
      desc: 'Generic item placeholder.',
      args: [value],
    );
  }

  /// `Lists`
  String get demoListsTitle {
    return Intl.message(
      'Lists',
      name: 'demoListsTitle',
      desc: 'Title for lists demo.',
      args: [],
    );
  }

  /// `Scrolling list layouts`
  String get demoListsSubtitle {
    return Intl.message(
      'Scrolling list layouts',
      name: 'demoListsSubtitle',
      desc: 'Subtitle for lists demo.',
      args: [],
    );
  }

  /// `A single fixed-height row that typically contains some text as well as a leading or trailing icon.`
  String get demoListsDescription {
    return Intl.message(
      'A single fixed-height row that typically contains some text as well as a leading or trailing icon.',
      name: 'demoListsDescription',
      desc:
          'Description for lists demo. This describes what a single row in a list consists of.',
      args: [],
    );
  }

  /// `One Line`
  String get demoOneLineListsTitle {
    return Intl.message(
      'One Line',
      name: 'demoOneLineListsTitle',
      desc: 'Title for lists demo with only one line of text per row.',
      args: [],
    );
  }

  /// `Two Lines`
  String get demoTwoLineListsTitle {
    return Intl.message(
      'Two Lines',
      name: 'demoTwoLineListsTitle',
      desc: 'Title for lists demo with two lines of text per row.',
      args: [],
    );
  }

  /// `Secondary text`
  String get demoListsSecondary {
    return Intl.message(
      'Secondary text',
      name: 'demoListsSecondary',
      desc: 'Text that appears in the second line of a list item.',
      args: [],
    );
  }

  /// `Progress indicators`
  String get demoProgressIndicatorTitle {
    return Intl.message(
      'Progress indicators',
      name: 'demoProgressIndicatorTitle',
      desc: 'Title for progress indicators demo.',
      args: [],
    );
  }

  /// `Linear, circular, indeterminate`
  String get demoProgressIndicatorSubtitle {
    return Intl.message(
      'Linear, circular, indeterminate',
      name: 'demoProgressIndicatorSubtitle',
      desc: 'Subtitle for progress indicators demo.',
      args: [],
    );
  }

  /// `Circular Progress Indicator`
  String get demoCircularProgressIndicatorTitle {
    return Intl.message(
      'Circular Progress Indicator',
      name: 'demoCircularProgressIndicatorTitle',
      desc: 'Title for circular progress indicator demo.',
      args: [],
    );
  }

  /// `A Material Design circular progress indicator, which spins to indicate that the application is busy.`
  String get demoCircularProgressIndicatorDescription {
    return Intl.message(
      'A Material Design circular progress indicator, which spins to indicate that the application is busy.',
      name: 'demoCircularProgressIndicatorDescription',
      desc: 'Description for circular progress indicator demo.',
      args: [],
    );
  }

  /// `Linear Progress Indicator`
  String get demoLinearProgressIndicatorTitle {
    return Intl.message(
      'Linear Progress Indicator',
      name: 'demoLinearProgressIndicatorTitle',
      desc: 'Title for linear progress indicator demo.',
      args: [],
    );
  }

  /// `A Material Design linear progress indicator, also known as a progress bar.`
  String get demoLinearProgressIndicatorDescription {
    return Intl.message(
      'A Material Design linear progress indicator, also known as a progress bar.',
      name: 'demoLinearProgressIndicatorDescription',
      desc: 'Description for linear progress indicator demo.',
      args: [],
    );
  }

  /// `Pickers`
  String get demoPickersTitle {
    return Intl.message(
      'Pickers',
      name: 'demoPickersTitle',
      desc: 'Title for pickers demo.',
      args: [],
    );
  }

  /// `Date and time selection`
  String get demoPickersSubtitle {
    return Intl.message(
      'Date and time selection',
      name: 'demoPickersSubtitle',
      desc: 'Subtitle for pickers demo.',
      args: [],
    );
  }

  /// `Date Picker`
  String get demoDatePickerTitle {
    return Intl.message(
      'Date Picker',
      name: 'demoDatePickerTitle',
      desc: 'Title for date picker demo.',
      args: [],
    );
  }

  /// `Shows a dialog containing a Material Design date picker.`
  String get demoDatePickerDescription {
    return Intl.message(
      'Shows a dialog containing a Material Design date picker.',
      name: 'demoDatePickerDescription',
      desc: 'Description for date picker demo.',
      args: [],
    );
  }

  /// `Time Picker`
  String get demoTimePickerTitle {
    return Intl.message(
      'Time Picker',
      name: 'demoTimePickerTitle',
      desc: 'Title for time picker demo.',
      args: [],
    );
  }

  /// `Shows a dialog containing a Material Design time picker.`
  String get demoTimePickerDescription {
    return Intl.message(
      'Shows a dialog containing a Material Design time picker.',
      name: 'demoTimePickerDescription',
      desc: 'Description for time picker demo.',
      args: [],
    );
  }

  /// `Date Range Picker`
  String get demoDateRangePickerTitle {
    return Intl.message(
      'Date Range Picker',
      name: 'demoDateRangePickerTitle',
      desc: 'Title for date range picker demo.',
      args: [],
    );
  }

  /// `Shows a dialog containing a Material Design date range picker.`
  String get demoDateRangePickerDescription {
    return Intl.message(
      'Shows a dialog containing a Material Design date range picker.',
      name: 'demoDateRangePickerDescription',
      desc: 'Description for date range picker demo.',
      args: [],
    );
  }

  /// `SHOW PICKER`
  String get demoPickersShowPicker {
    return Intl.message(
      'SHOW PICKER',
      name: 'demoPickersShowPicker',
      desc: 'Button text to show the date or time picker in the demo.',
      args: [],
    );
  }

  /// `Tabs`
  String get demoTabsTitle {
    return Intl.message(
      'Tabs',
      name: 'demoTabsTitle',
      desc: 'Title for tabs demo.',
      args: [],
    );
  }

  /// `Scrolling`
  String get demoTabsScrollingTitle {
    return Intl.message(
      'Scrolling',
      name: 'demoTabsScrollingTitle',
      desc: 'Title for tabs demo with a tab bar that scrolls.',
      args: [],
    );
  }

  /// `Non-scrolling`
  String get demoTabsNonScrollingTitle {
    return Intl.message(
      'Non-scrolling',
      name: 'demoTabsNonScrollingTitle',
      desc: 'Title for tabs demo with a tab bar that doesn\'t scroll.',
      args: [],
    );
  }

  /// `Tabs with independently scrollable views`
  String get demoTabsSubtitle {
    return Intl.message(
      'Tabs with independently scrollable views',
      name: 'demoTabsSubtitle',
      desc: 'Subtitle for tabs demo.',
      args: [],
    );
  }

  /// `Tabs organize content across different screens, data sets, and other interactions.`
  String get demoTabsDescription {
    return Intl.message(
      'Tabs organize content across different screens, data sets, and other interactions.',
      name: 'demoTabsDescription',
      desc: 'Description for tabs demo.',
      args: [],
    );
  }

  /// `Snackbars`
  String get demoSnackbarsTitle {
    return Intl.message(
      'Snackbars',
      name: 'demoSnackbarsTitle',
      desc: 'Title for snackbars demo.',
      args: [],
    );
  }

  /// `Snackbars show messages at the bottom of the screen`
  String get demoSnackbarsSubtitle {
    return Intl.message(
      'Snackbars show messages at the bottom of the screen',
      name: 'demoSnackbarsSubtitle',
      desc: 'Subtitle for snackbars demo.',
      args: [],
    );
  }

  /// `Snackbars inform users of a process that an app has performed or will perform. They appear temporarily, towards the bottom of the screen. They shouldn’t interrupt the user experience, and they don’t require user input to disappear.`
  String get demoSnackbarsDescription {
    return Intl.message(
      'Snackbars inform users of a process that an app has performed or will perform. They appear temporarily, towards the bottom of the screen. They shouldn’t interrupt the user experience, and they don’t require user input to disappear.',
      name: 'demoSnackbarsDescription',
      desc: 'Description for snackbars demo.',
      args: [],
    );
  }

  /// `SHOW A SNACKBAR`
  String get demoSnackbarsButtonLabel {
    return Intl.message(
      'SHOW A SNACKBAR',
      name: 'demoSnackbarsButtonLabel',
      desc: 'Label for button to show a snackbar.',
      args: [],
    );
  }

  /// `This is a snackbar.`
  String get demoSnackbarsText {
    return Intl.message(
      'This is a snackbar.',
      name: 'demoSnackbarsText',
      desc: 'Text to show on a snackbar.',
      args: [],
    );
  }

  /// `ACTION`
  String get demoSnackbarsActionButtonLabel {
    return Intl.message(
      'ACTION',
      name: 'demoSnackbarsActionButtonLabel',
      desc: 'Label for action button text on the snackbar.',
      args: [],
    );
  }

  /// `You pressed the snackbar action.`
  String get demoSnackbarsAction {
    return Intl.message(
      'You pressed the snackbar action.',
      name: 'demoSnackbarsAction',
      desc: 'Text that appears when you press on a snackbars’ action.',
      args: [],
    );
  }

  /// `Selection controls`
  String get demoSelectionControlsTitle {
    return Intl.message(
      'Selection controls',
      name: 'demoSelectionControlsTitle',
      desc: 'Title for selection controls demo.',
      args: [],
    );
  }

  /// `Checkboxes, radio buttons, and switches`
  String get demoSelectionControlsSubtitle {
    return Intl.message(
      'Checkboxes, radio buttons, and switches',
      name: 'demoSelectionControlsSubtitle',
      desc: 'Subtitle for selection controls demo.',
      args: [],
    );
  }

  /// `Checkbox`
  String get demoSelectionControlsCheckboxTitle {
    return Intl.message(
      'Checkbox',
      name: 'demoSelectionControlsCheckboxTitle',
      desc: 'Title for the checkbox (selection controls) demo.',
      args: [],
    );
  }

  /// `Checkboxes allow the user to select multiple options from a set. A normal checkbox's value is true or false and a tristate checkbox's value can also be null.`
  String get demoSelectionControlsCheckboxDescription {
    return Intl.message(
      'Checkboxes allow the user to select multiple options from a set. A normal checkbox\'s value is true or false and a tristate checkbox\'s value can also be null.',
      name: 'demoSelectionControlsCheckboxDescription',
      desc: 'Description for the checkbox (selection controls) demo.',
      args: [],
    );
  }

  /// `Radio`
  String get demoSelectionControlsRadioTitle {
    return Intl.message(
      'Radio',
      name: 'demoSelectionControlsRadioTitle',
      desc: 'Title for the radio button (selection controls) demo.',
      args: [],
    );
  }

  /// `Radio buttons allow the user to select one option from a set. Use radio buttons for exclusive selection if you think that the user needs to see all available options side-by-side.`
  String get demoSelectionControlsRadioDescription {
    return Intl.message(
      'Radio buttons allow the user to select one option from a set. Use radio buttons for exclusive selection if you think that the user needs to see all available options side-by-side.',
      name: 'demoSelectionControlsRadioDescription',
      desc: 'Description for the radio button (selection controls) demo.',
      args: [],
    );
  }

  /// `Switch`
  String get demoSelectionControlsSwitchTitle {
    return Intl.message(
      'Switch',
      name: 'demoSelectionControlsSwitchTitle',
      desc: 'Title for the switches (selection controls) demo.',
      args: [],
    );
  }

  /// `On/off switches toggle the state of a single settings option. The option that the switch controls, as well as the state it’s in, should be made clear from the corresponding inline label.`
  String get demoSelectionControlsSwitchDescription {
    return Intl.message(
      'On/off switches toggle the state of a single settings option. The option that the switch controls, as well as the state it’s in, should be made clear from the corresponding inline label.',
      name: 'demoSelectionControlsSwitchDescription',
      desc: 'Description for the switches (selection controls) demo.',
      args: [],
    );
  }

  /// `Text fields`
  String get demoBottomTextFieldsTitle {
    return Intl.message(
      'Text fields',
      name: 'demoBottomTextFieldsTitle',
      desc: 'Title for text fields demo.',
      args: [],
    );
  }

  /// `Text fields`
  String get demoTextFieldTitle {
    return Intl.message(
      'Text fields',
      name: 'demoTextFieldTitle',
      desc: 'Title for text fields demo.',
      args: [],
    );
  }

  /// `Single line of editable text and numbers`
  String get demoTextFieldSubtitle {
    return Intl.message(
      'Single line of editable text and numbers',
      name: 'demoTextFieldSubtitle',
      desc: 'Description for text fields demo.',
      args: [],
    );
  }

  /// `Text fields allow users to enter text into a UI. They typically appear in forms and dialogs.`
  String get demoTextFieldDescription {
    return Intl.message(
      'Text fields allow users to enter text into a UI. They typically appear in forms and dialogs.',
      name: 'demoTextFieldDescription',
      desc: 'Description for text fields demo.',
      args: [],
    );
  }

  /// `Show password`
  String get demoTextFieldShowPasswordLabel {
    return Intl.message(
      'Show password',
      name: 'demoTextFieldShowPasswordLabel',
      desc: 'Label for show password icon.',
      args: [],
    );
  }

  /// `Hide password`
  String get demoTextFieldHidePasswordLabel {
    return Intl.message(
      'Hide password',
      name: 'demoTextFieldHidePasswordLabel',
      desc: 'Label for hide password icon.',
      args: [],
    );
  }

  /// `Please fix the errors in red before submitting.`
  String get demoTextFieldFormErrors {
    return Intl.message(
      'Please fix the errors in red before submitting.',
      name: 'demoTextFieldFormErrors',
      desc: 'Text that shows up on form errors.',
      args: [],
    );
  }

  /// `Name is required.`
  String get demoTextFieldNameRequired {
    return Intl.message(
      'Name is required.',
      name: 'demoTextFieldNameRequired',
      desc: 'Shows up as submission error if name is not given in the form.',
      args: [],
    );
  }

  /// `Please enter only alphabetical characters.`
  String get demoTextFieldOnlyAlphabeticalChars {
    return Intl.message(
      'Please enter only alphabetical characters.',
      name: 'demoTextFieldOnlyAlphabeticalChars',
      desc: 'Error that shows if non-alphabetical characters are given.',
      args: [],
    );
  }

  /// `(###) ###-#### - Enter a US phone number.`
  String get demoTextFieldEnterUSPhoneNumber {
    return Intl.message(
      '(###) ###-#### - Enter a US phone number.',
      name: 'demoTextFieldEnterUSPhoneNumber',
      desc: 'Error that shows up if non-valid non-US phone number is given.',
      args: [],
    );
  }

  /// `Please enter a password.`
  String get demoTextFieldEnterPassword {
    return Intl.message(
      'Please enter a password.',
      name: 'demoTextFieldEnterPassword',
      desc: 'Error that shows up if password is not given.',
      args: [],
    );
  }

  /// `The passwords don't match`
  String get demoTextFieldPasswordsDoNotMatch {
    return Intl.message(
      'The passwords don\'t match',
      name: 'demoTextFieldPasswordsDoNotMatch',
      desc:
          'Error that shows up, if the re-typed password does not match the already given password.',
      args: [],
    );
  }

  /// `What do people call you?`
  String get demoTextFieldWhatDoPeopleCallYou {
    return Intl.message(
      'What do people call you?',
      name: 'demoTextFieldWhatDoPeopleCallYou',
      desc: 'Placeholder for name field in form.',
      args: [],
    );
  }

  /// `Name*`
  String get demoTextFieldNameField {
    return Intl.message(
      'Name*',
      name: 'demoTextFieldNameField',
      desc:
          'The label for a name input field that is required (hence the star).',
      args: [],
    );
  }

  /// `Where can we reach you?`
  String get demoTextFieldWhereCanWeReachYou {
    return Intl.message(
      'Where can we reach you?',
      name: 'demoTextFieldWhereCanWeReachYou',
      desc: 'Placeholder for when entering a phone number in a form.',
      args: [],
    );
  }

  /// `Phone number*`
  String get demoTextFieldPhoneNumber {
    return Intl.message(
      'Phone number*',
      name: 'demoTextFieldPhoneNumber',
      desc:
          'The label for a phone number input field that is required (hence the star).',
      args: [],
    );
  }

  /// `Your email address`
  String get demoTextFieldYourEmailAddress {
    return Intl.message(
      'Your email address',
      name: 'demoTextFieldYourEmailAddress',
      desc: 'The label for an email address input field.',
      args: [],
    );
  }

  /// `Email`
  String get demoTextFieldEmail {
    return Intl.message(
      'Email',
      name: 'demoTextFieldEmail',
      desc: 'The label for an email address input field',
      args: [],
    );
  }

  /// `Tell us about yourself (e.g., write down what you do or what hobbies you have)`
  String get demoTextFieldTellUsAboutYourself {
    return Intl.message(
      'Tell us about yourself (e.g., write down what you do or what hobbies you have)',
      name: 'demoTextFieldTellUsAboutYourself',
      desc: 'The placeholder text for biography/life story input field.',
      args: [],
    );
  }

  /// `Keep it short, this is just a demo.`
  String get demoTextFieldKeepItShort {
    return Intl.message(
      'Keep it short, this is just a demo.',
      name: 'demoTextFieldKeepItShort',
      desc: 'Helper text for biography/life story input field.',
      args: [],
    );
  }

  /// `Life story`
  String get demoTextFieldLifeStory {
    return Intl.message(
      'Life story',
      name: 'demoTextFieldLifeStory',
      desc: 'The label for for biography/life story input field.',
      args: [],
    );
  }

  /// `Salary`
  String get demoTextFieldSalary {
    return Intl.message(
      'Salary',
      name: 'demoTextFieldSalary',
      desc: 'The label for salary input field.',
      args: [],
    );
  }

  /// `USD`
  String get demoTextFieldUSD {
    return Intl.message(
      'USD',
      name: 'demoTextFieldUSD',
      desc: 'US currency, used as suffix in input field for salary.',
      args: [],
    );
  }

  /// `No more than 8 characters.`
  String get demoTextFieldNoMoreThan {
    return Intl.message(
      'No more than 8 characters.',
      name: 'demoTextFieldNoMoreThan',
      desc: 'Helper text for password input field.',
      args: [],
    );
  }

  /// `Password*`
  String get demoTextFieldPassword {
    return Intl.message(
      'Password*',
      name: 'demoTextFieldPassword',
      desc:
          'Label for password input field, that is required (hence the star).',
      args: [],
    );
  }

  /// `Re-type password*`
  String get demoTextFieldRetypePassword {
    return Intl.message(
      'Re-type password*',
      name: 'demoTextFieldRetypePassword',
      desc: 'Label for repeat password input field.',
      args: [],
    );
  }

  /// `SUBMIT`
  String get demoTextFieldSubmit {
    return Intl.message(
      'SUBMIT',
      name: 'demoTextFieldSubmit',
      desc: 'The submit button text for form.',
      args: [],
    );
  }

  /// `{name} phone number is {phoneNumber}`
  String demoTextFieldNameHasPhoneNumber(Object name, Object phoneNumber) {
    return Intl.message(
      '$name phone number is $phoneNumber',
      name: 'demoTextFieldNameHasPhoneNumber',
      desc:
          'Text that shows up when valid phone number and name is submitted in form.',
      args: [name, phoneNumber],
    );
  }

  /// `* indicates required field`
  String get demoTextFieldRequiredField {
    return Intl.message(
      '* indicates required field',
      name: 'demoTextFieldRequiredField',
      desc: 'Helper text to indicate that * means that it is a required field.',
      args: [],
    );
  }

  /// `Tooltips`
  String get demoTooltipTitle {
    return Intl.message(
      'Tooltips',
      name: 'demoTooltipTitle',
      desc: 'Title for tooltip demo.',
      args: [],
    );
  }

  /// `Short message displayed on long press or hover`
  String get demoTooltipSubtitle {
    return Intl.message(
      'Short message displayed on long press or hover',
      name: 'demoTooltipSubtitle',
      desc: 'Subtitle for tooltip demo.',
      args: [],
    );
  }

  /// `Tooltips provide text labels that help explain the function of a button or other user interface action. Tooltips display informative text when users hover over, focus on, or long press an element.`
  String get demoTooltipDescription {
    return Intl.message(
      'Tooltips provide text labels that help explain the function of a button or other user interface action. Tooltips display informative text when users hover over, focus on, or long press an element.',
      name: 'demoTooltipDescription',
      desc: 'Description for tooltip demo.',
      args: [],
    );
  }

  /// `Long press or hover to display the tooltip.`
  String get demoTooltipInstructions {
    return Intl.message(
      'Long press or hover to display the tooltip.',
      name: 'demoTooltipInstructions',
      desc: 'Instructions for how to trigger a tooltip in the tooltip demo.',
      args: [],
    );
  }

  /// `Comments`
  String get bottomNavigationCommentsTab {
    return Intl.message(
      'Comments',
      name: 'bottomNavigationCommentsTab',
      desc: 'Title for Comments tab of bottom navigation.',
      args: [],
    );
  }

  /// `Calendar`
  String get bottomNavigationCalendarTab {
    return Intl.message(
      'Calendar',
      name: 'bottomNavigationCalendarTab',
      desc: 'Title for Calendar tab of bottom navigation.',
      args: [],
    );
  }

  /// `Account`
  String get bottomNavigationAccountTab {
    return Intl.message(
      'Account',
      name: 'bottomNavigationAccountTab',
      desc: 'Title for Account tab of bottom navigation.',
      args: [],
    );
  }

  /// `Alarm`
  String get bottomNavigationAlarmTab {
    return Intl.message(
      'Alarm',
      name: 'bottomNavigationAlarmTab',
      desc: 'Title for Alarm tab of bottom navigation.',
      args: [],
    );
  }

  /// `Camera`
  String get bottomNavigationCameraTab {
    return Intl.message(
      'Camera',
      name: 'bottomNavigationCameraTab',
      desc: 'Title for Camera tab of bottom navigation.',
      args: [],
    );
  }

  /// `Placeholder for {title} tab`
  String bottomNavigationContentPlaceholder(Object title) {
    return Intl.message(
      'Placeholder for $title tab',
      name: 'bottomNavigationContentPlaceholder',
      desc:
          'Accessibility label for the content placeholder in the bottom navigation demo',
      args: [title],
    );
  }

  /// `Create`
  String get buttonTextCreate {
    return Intl.message(
      'Create',
      name: 'buttonTextCreate',
      desc: 'Tooltip text for a create button.',
      args: [],
    );
  }

  /// `You selected: "{value}"`
  String dialogSelectedOption(Object value) {
    return Intl.message(
      'You selected: "$value"',
      name: 'dialogSelectedOption',
      desc: 'Message displayed after an option is selected from a dialog',
      args: [value],
    );
  }

  /// `Turn on lights`
  String get chipTurnOnLights {
    return Intl.message(
      'Turn on lights',
      name: 'chipTurnOnLights',
      desc: 'A chip component to turn on the lights.',
      args: [],
    );
  }

  /// `Small`
  String get chipSmall {
    return Intl.message(
      'Small',
      name: 'chipSmall',
      desc: 'A chip component to select a small size.',
      args: [],
    );
  }

  /// `Medium`
  String get chipMedium {
    return Intl.message(
      'Medium',
      name: 'chipMedium',
      desc: 'A chip component to select a medium size.',
      args: [],
    );
  }

  /// `Large`
  String get chipLarge {
    return Intl.message(
      'Large',
      name: 'chipLarge',
      desc: 'A chip component to select a large size.',
      args: [],
    );
  }

  /// `Elevator`
  String get chipElevator {
    return Intl.message(
      'Elevator',
      name: 'chipElevator',
      desc: 'A chip component to filter selection by elevators.',
      args: [],
    );
  }

  /// `Washer`
  String get chipWasher {
    return Intl.message(
      'Washer',
      name: 'chipWasher',
      desc: 'A chip component to filter selection by washers.',
      args: [],
    );
  }

  /// `Fireplace`
  String get chipFireplace {
    return Intl.message(
      'Fireplace',
      name: 'chipFireplace',
      desc: 'A chip component to filter selection by fireplaces.',
      args: [],
    );
  }

  /// `Biking`
  String get chipBiking {
    return Intl.message(
      'Biking',
      name: 'chipBiking',
      desc: 'A chip component to that indicates a biking selection.',
      args: [],
    );
  }

  /// `Discard draft?`
  String get dialogDiscardTitle {
    return Intl.message(
      'Discard draft?',
      name: 'dialogDiscardTitle',
      desc: 'Alert dialog message to discard draft.',
      args: [],
    );
  }

  /// `Use Google's location service?`
  String get dialogLocationTitle {
    return Intl.message(
      'Use Google\'s location service?',
      name: 'dialogLocationTitle',
      desc: 'Alert dialog title to use location services.',
      args: [],
    );
  }

  /// `Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running.`
  String get dialogLocationDescription {
    return Intl.message(
      'Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running.',
      name: 'dialogLocationDescription',
      desc: 'Alert dialog description to use location services.',
      args: [],
    );
  }

  /// `CANCEL`
  String get dialogCancel {
    return Intl.message(
      'CANCEL',
      name: 'dialogCancel',
      desc: 'Alert dialog cancel option.',
      args: [],
    );
  }

  /// `DISCARD`
  String get dialogDiscard {
    return Intl.message(
      'DISCARD',
      name: 'dialogDiscard',
      desc: 'Alert dialog discard option.',
      args: [],
    );
  }

  /// `DISAGREE`
  String get dialogDisagree {
    return Intl.message(
      'DISAGREE',
      name: 'dialogDisagree',
      desc: 'Alert dialog disagree option.',
      args: [],
    );
  }

  /// `AGREE`
  String get dialogAgree {
    return Intl.message(
      'AGREE',
      name: 'dialogAgree',
      desc: 'Alert dialog agree option.',
      args: [],
    );
  }

  /// `Set backup account`
  String get dialogSetBackup {
    return Intl.message(
      'Set backup account',
      name: 'dialogSetBackup',
      desc: 'Alert dialog title for setting a backup account.',
      args: [],
    );
  }

  /// `Add account`
  String get dialogAddAccount {
    return Intl.message(
      'Add account',
      name: 'dialogAddAccount',
      desc: 'Alert dialog option for adding an account.',
      args: [],
    );
  }

  /// `SHOW DIALOG`
  String get dialogShow {
    return Intl.message(
      'SHOW DIALOG',
      name: 'dialogShow',
      desc: 'Button text to display a dialog.',
      args: [],
    );
  }

  /// `Full Screen Dialog`
  String get dialogFullscreenTitle {
    return Intl.message(
      'Full Screen Dialog',
      name: 'dialogFullscreenTitle',
      desc: 'Title for full screen dialog demo.',
      args: [],
    );
  }

  /// `SAVE`
  String get dialogFullscreenSave {
    return Intl.message(
      'SAVE',
      name: 'dialogFullscreenSave',
      desc: 'Save button for full screen dialog demo.',
      args: [],
    );
  }

  /// `A full screen dialog demo`
  String get dialogFullscreenDescription {
    return Intl.message(
      'A full screen dialog demo',
      name: 'dialogFullscreenDescription',
      desc: 'Description for full screen dialog demo.',
      args: [],
    );
  }

  /// `Button`
  String get cupertinoButton {
    return Intl.message(
      'Button',
      name: 'cupertinoButton',
      desc: 'Button text for a generic iOS-style button.',
      args: [],
    );
  }

  /// `With Background`
  String get cupertinoButtonWithBackground {
    return Intl.message(
      'With Background',
      name: 'cupertinoButtonWithBackground',
      desc: 'Button text for a iOS-style button with a filled background.',
      args: [],
    );
  }

  /// `Cancel`
  String get cupertinoAlertCancel {
    return Intl.message(
      'Cancel',
      name: 'cupertinoAlertCancel',
      desc: 'iOS-style alert cancel option.',
      args: [],
    );
  }

  /// `Discard`
  String get cupertinoAlertDiscard {
    return Intl.message(
      'Discard',
      name: 'cupertinoAlertDiscard',
      desc: 'iOS-style alert discard option.',
      args: [],
    );
  }

  /// `Allow "Maps" to access your location while you are using the app?`
  String get cupertinoAlertLocationTitle {
    return Intl.message(
      'Allow "Maps" to access your location while you are using the app?',
      name: 'cupertinoAlertLocationTitle',
      desc: 'iOS-style alert title for location permission.',
      args: [],
    );
  }

  /// `Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.`
  String get cupertinoAlertLocationDescription {
    return Intl.message(
      'Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.',
      name: 'cupertinoAlertLocationDescription',
      desc: 'iOS-style alert description for location permission.',
      args: [],
    );
  }

  /// `Allow`
  String get cupertinoAlertAllow {
    return Intl.message(
      'Allow',
      name: 'cupertinoAlertAllow',
      desc: 'iOS-style alert allow option.',
      args: [],
    );
  }

  /// `Don't Allow`
  String get cupertinoAlertDontAllow {
    return Intl.message(
      'Don\'t Allow',
      name: 'cupertinoAlertDontAllow',
      desc: 'iOS-style alert don\'t allow option.',
      args: [],
    );
  }

  /// `Select Favorite Dessert`
  String get cupertinoAlertFavoriteDessert {
    return Intl.message(
      'Select Favorite Dessert',
      name: 'cupertinoAlertFavoriteDessert',
      desc: 'iOS-style alert title for selecting favorite dessert.',
      args: [],
    );
  }

  /// `Please select your favorite type of dessert from the list below. Your selection will be used to customize the suggested list of eateries in your area.`
  String get cupertinoAlertDessertDescription {
    return Intl.message(
      'Please select your favorite type of dessert from the list below. Your selection will be used to customize the suggested list of eateries in your area.',
      name: 'cupertinoAlertDessertDescription',
      desc: 'iOS-style alert description for selecting favorite dessert.',
      args: [],
    );
  }

  /// `Cheesecake`
  String get cupertinoAlertCheesecake {
    return Intl.message(
      'Cheesecake',
      name: 'cupertinoAlertCheesecake',
      desc: 'iOS-style alert cheesecake option.',
      args: [],
    );
  }

  /// `Tiramisu`
  String get cupertinoAlertTiramisu {
    return Intl.message(
      'Tiramisu',
      name: 'cupertinoAlertTiramisu',
      desc: 'iOS-style alert tiramisu option.',
      args: [],
    );
  }

  /// `Apple Pie`
  String get cupertinoAlertApplePie {
    return Intl.message(
      'Apple Pie',
      name: 'cupertinoAlertApplePie',
      desc: 'iOS-style alert apple pie option.',
      args: [],
    );
  }

  /// `Chocolate Brownie`
  String get cupertinoAlertChocolateBrownie {
    return Intl.message(
      'Chocolate Brownie',
      name: 'cupertinoAlertChocolateBrownie',
      desc: 'iOS-style alert chocolate brownie option.',
      args: [],
    );
  }

  /// `Show Alert`
  String get cupertinoShowAlert {
    return Intl.message(
      'Show Alert',
      name: 'cupertinoShowAlert',
      desc: 'Button text to show iOS-style alert.',
      args: [],
    );
  }

  /// `RED`
  String get colorsRed {
    return Intl.message(
      'RED',
      name: 'colorsRed',
      desc: 'Tab title for the color red.',
      args: [],
    );
  }

  /// `PINK`
  String get colorsPink {
    return Intl.message(
      'PINK',
      name: 'colorsPink',
      desc: 'Tab title for the color pink.',
      args: [],
    );
  }

  /// `PURPLE`
  String get colorsPurple {
    return Intl.message(
      'PURPLE',
      name: 'colorsPurple',
      desc: 'Tab title for the color purple.',
      args: [],
    );
  }

  /// `DEEP PURPLE`
  String get colorsDeepPurple {
    return Intl.message(
      'DEEP PURPLE',
      name: 'colorsDeepPurple',
      desc: 'Tab title for the color deep purple.',
      args: [],
    );
  }

  /// `INDIGO`
  String get colorsIndigo {
    return Intl.message(
      'INDIGO',
      name: 'colorsIndigo',
      desc: 'Tab title for the color indigo.',
      args: [],
    );
  }

  /// `BLUE`
  String get colorsBlue {
    return Intl.message(
      'BLUE',
      name: 'colorsBlue',
      desc: 'Tab title for the color blue.',
      args: [],
    );
  }

  /// `LIGHT BLUE`
  String get colorsLightBlue {
    return Intl.message(
      'LIGHT BLUE',
      name: 'colorsLightBlue',
      desc: 'Tab title for the color light blue.',
      args: [],
    );
  }

  /// `CYAN`
  String get colorsCyan {
    return Intl.message(
      'CYAN',
      name: 'colorsCyan',
      desc: 'Tab title for the color cyan.',
      args: [],
    );
  }

  /// `TEAL`
  String get colorsTeal {
    return Intl.message(
      'TEAL',
      name: 'colorsTeal',
      desc: 'Tab title for the color teal.',
      args: [],
    );
  }

  /// `GREEN`
  String get colorsGreen {
    return Intl.message(
      'GREEN',
      name: 'colorsGreen',
      desc: 'Tab title for the color green.',
      args: [],
    );
  }

  /// `LIGHT GREEN`
  String get colorsLightGreen {
    return Intl.message(
      'LIGHT GREEN',
      name: 'colorsLightGreen',
      desc: 'Tab title for the color light green.',
      args: [],
    );
  }

  /// `LIME`
  String get colorsLime {
    return Intl.message(
      'LIME',
      name: 'colorsLime',
      desc: 'Tab title for the color lime.',
      args: [],
    );
  }

  /// `YELLOW`
  String get colorsYellow {
    return Intl.message(
      'YELLOW',
      name: 'colorsYellow',
      desc: 'Tab title for the color yellow.',
      args: [],
    );
  }

  /// `AMBER`
  String get colorsAmber {
    return Intl.message(
      'AMBER',
      name: 'colorsAmber',
      desc: 'Tab title for the color amber.',
      args: [],
    );
  }

  /// `ORANGE`
  String get colorsOrange {
    return Intl.message(
      'ORANGE',
      name: 'colorsOrange',
      desc: 'Tab title for the color orange.',
      args: [],
    );
  }

  /// `DEEP ORANGE`
  String get colorsDeepOrange {
    return Intl.message(
      'DEEP ORANGE',
      name: 'colorsDeepOrange',
      desc: 'Tab title for the color deep orange.',
      args: [],
    );
  }

  /// `BROWN`
  String get colorsBrown {
    return Intl.message(
      'BROWN',
      name: 'colorsBrown',
      desc: 'Tab title for the color brown.',
      args: [],
    );
  }

  /// `GREY`
  String get colorsGrey {
    return Intl.message(
      'GREY',
      name: 'colorsGrey',
      desc: 'Tab title for the color grey.',
      args: [],
    );
  }

  /// `BLUE GREY`
  String get colorsBlueGrey {
    return Intl.message(
      'BLUE GREY',
      name: 'colorsBlueGrey',
      desc: 'Tab title for the color blue grey.',
      args: [],
    );
  }

  /// `Chennai`
  String get placeChennai {
    return Intl.message(
      'Chennai',
      name: 'placeChennai',
      desc: 'Title for Chennai location.',
      args: [],
    );
  }

  /// `Tanjore`
  String get placeTanjore {
    return Intl.message(
      'Tanjore',
      name: 'placeTanjore',
      desc: 'Title for Tanjore location.',
      args: [],
    );
  }

  /// `Chettinad`
  String get placeChettinad {
    return Intl.message(
      'Chettinad',
      name: 'placeChettinad',
      desc: 'Title for Chettinad location.',
      args: [],
    );
  }

  /// `Pondicherry`
  String get placePondicherry {
    return Intl.message(
      'Pondicherry',
      name: 'placePondicherry',
      desc: 'Title for Pondicherry location.',
      args: [],
    );
  }

  /// `Flower Market`
  String get placeFlowerMarket {
    return Intl.message(
      'Flower Market',
      name: 'placeFlowerMarket',
      desc: 'Title for Flower Market location.',
      args: [],
    );
  }

  /// `Bronze Works`
  String get placeBronzeWorks {
    return Intl.message(
      'Bronze Works',
      name: 'placeBronzeWorks',
      desc: 'Title for Bronze Works location.',
      args: [],
    );
  }

  /// `Market`
  String get placeMarket {
    return Intl.message(
      'Market',
      name: 'placeMarket',
      desc: 'Title for Market location.',
      args: [],
    );
  }

  /// `Thanjavur Temple`
  String get placeThanjavurTemple {
    return Intl.message(
      'Thanjavur Temple',
      name: 'placeThanjavurTemple',
      desc: 'Title for Thanjavur Temple location.',
      args: [],
    );
  }

  /// `Salt Farm`
  String get placeSaltFarm {
    return Intl.message(
      'Salt Farm',
      name: 'placeSaltFarm',
      desc: 'Title for Salt Farm location.',
      args: [],
    );
  }

  /// `Scooters`
  String get placeScooters {
    return Intl.message(
      'Scooters',
      name: 'placeScooters',
      desc: 'Title for image of people riding on scooters.',
      args: [],
    );
  }

  /// `Silk Maker`
  String get placeSilkMaker {
    return Intl.message(
      'Silk Maker',
      name: 'placeSilkMaker',
      desc: 'Title for an image of a silk maker.',
      args: [],
    );
  }

  /// `Lunch Prep`
  String get placeLunchPrep {
    return Intl.message(
      'Lunch Prep',
      name: 'placeLunchPrep',
      desc: 'Title for an image of preparing lunch.',
      args: [],
    );
  }

  /// `Beach`
  String get placeBeach {
    return Intl.message(
      'Beach',
      name: 'placeBeach',
      desc: 'Title for Beach location.',
      args: [],
    );
  }

  /// `Fisherman`
  String get placeFisherman {
    return Intl.message(
      'Fisherman',
      name: 'placeFisherman',
      desc: 'Title for an image of a fisherman.',
      args: [],
    );
  }

  /// `Starter app`
  String get starterAppTitle {
    return Intl.message(
      'Starter app',
      name: 'starterAppTitle',
      desc: 'The title and name for the starter app.',
      args: [],
    );
  }

  /// `A responsive starter layout`
  String get starterAppDescription {
    return Intl.message(
      'A responsive starter layout',
      name: 'starterAppDescription',
      desc: 'The description for the starter app.',
      args: [],
    );
  }

  /// `BUTTON`
  String get starterAppGenericButton {
    return Intl.message(
      'BUTTON',
      name: 'starterAppGenericButton',
      desc: 'Generic placeholder for button.',
      args: [],
    );
  }

  /// `Add`
  String get starterAppTooltipAdd {
    return Intl.message(
      'Add',
      name: 'starterAppTooltipAdd',
      desc: 'Tooltip on add icon.',
      args: [],
    );
  }

  /// `Favorite`
  String get starterAppTooltipFavorite {
    return Intl.message(
      'Favorite',
      name: 'starterAppTooltipFavorite',
      desc: 'Tooltip on favorite icon.',
      args: [],
    );
  }

  /// `Share`
  String get starterAppTooltipShare {
    return Intl.message(
      'Share',
      name: 'starterAppTooltipShare',
      desc: 'Tooltip on share icon.',
      args: [],
    );
  }

  /// `Search`
  String get starterAppTooltipSearch {
    return Intl.message(
      'Search',
      name: 'starterAppTooltipSearch',
      desc: 'Tooltip on search icon.',
      args: [],
    );
  }

  /// `Title`
  String get starterAppGenericTitle {
    return Intl.message(
      'Title',
      name: 'starterAppGenericTitle',
      desc: 'Generic placeholder for title in app bar.',
      args: [],
    );
  }

  /// `Subtitle`
  String get starterAppGenericSubtitle {
    return Intl.message(
      'Subtitle',
      name: 'starterAppGenericSubtitle',
      desc: 'Generic placeholder for subtitle in drawer.',
      args: [],
    );
  }

  /// `Headline`
  String get starterAppGenericHeadline {
    return Intl.message(
      'Headline',
      name: 'starterAppGenericHeadline',
      desc: 'Generic placeholder for headline in drawer.',
      args: [],
    );
  }

  /// `Body`
  String get starterAppGenericBody {
    return Intl.message(
      'Body',
      name: 'starterAppGenericBody',
      desc: 'Generic placeholder for body text in drawer.',
      args: [],
    );
  }

  /// `Item {value}`
  String starterAppDrawerItem(Object value) {
    return Intl.message(
      'Item $value',
      name: 'starterAppDrawerItem',
      desc: 'Generic placeholder drawer item.',
      args: [value],
    );
  }

  /// `MENU`
  String get shrineMenuCaption {
    return Intl.message(
      'MENU',
      name: 'shrineMenuCaption',
      desc: 'Caption for a menu page.',
      args: [],
    );
  }

  /// `ALL`
  String get shrineCategoryNameAll {
    return Intl.message(
      'ALL',
      name: 'shrineCategoryNameAll',
      desc: 'A tab showing products from all categories.',
      args: [],
    );
  }

  /// `ACCESSORIES`
  String get shrineCategoryNameAccessories {
    return Intl.message(
      'ACCESSORIES',
      name: 'shrineCategoryNameAccessories',
      desc:
          'A category of products consisting of accessories (clothing items).',
      args: [],
    );
  }

  /// `CLOTHING`
  String get shrineCategoryNameClothing {
    return Intl.message(
      'CLOTHING',
      name: 'shrineCategoryNameClothing',
      desc: 'A category of products consisting of clothing.',
      args: [],
    );
  }

  /// `HOME`
  String get shrineCategoryNameHome {
    return Intl.message(
      'HOME',
      name: 'shrineCategoryNameHome',
      desc: 'A category of products consisting of items used at home.',
      args: [],
    );
  }

  /// `LOGOUT`
  String get shrineLogoutButtonCaption {
    return Intl.message(
      'LOGOUT',
      name: 'shrineLogoutButtonCaption',
      desc: 'Label for a logout button.',
      args: [],
    );
  }

  /// `Username`
  String get shrineLoginUsernameLabel {
    return Intl.message(
      'Username',
      name: 'shrineLoginUsernameLabel',
      desc:
          'On the login screen, a label for a textfield for the user to input their username.',
      args: [],
    );
  }

  /// `Password`
  String get shrineLoginPasswordLabel {
    return Intl.message(
      'Password',
      name: 'shrineLoginPasswordLabel',
      desc:
          'On the login screen, a label for a textfield for the user to input their password.',
      args: [],
    );
  }

  /// `CANCEL`
  String get shrineCancelButtonCaption {
    return Intl.message(
      'CANCEL',
      name: 'shrineCancelButtonCaption',
      desc: 'On the login screen, the caption for a button to cancel login.',
      args: [],
    );
  }

  /// `NEXT`
  String get shrineNextButtonCaption {
    return Intl.message(
      'NEXT',
      name: 'shrineNextButtonCaption',
      desc: 'On the login screen, the caption for a button to proceed login.',
      args: [],
    );
  }

  /// `CART`
  String get shrineCartPageCaption {
    return Intl.message(
      'CART',
      name: 'shrineCartPageCaption',
      desc: 'Caption for a shopping cart page.',
      args: [],
    );
  }

  /// `Quantity: {quantity}`
  String shrineProductQuantity(Object quantity) {
    return Intl.message(
      'Quantity: $quantity',
      name: 'shrineProductQuantity',
      desc: 'A text showing the number of items for a specific product.',
      args: [quantity],
    );
  }

  /// `x {price}`
  String shrineProductPrice(Object price) {
    return Intl.message(
      'x $price',
      name: 'shrineProductPrice',
      desc:
          'A text showing the unit price of each product. Used as: \'Quantity: 3 x \$129\'. The currency will be handled by the formatter.',
      args: [price],
    );
  }

  /// `{quantity, plural, =0{NO ITEMS} =1{1 ITEM} other{{quantity} ITEMS}}`
  String shrineCartItemCount(num quantity) {
    return Intl.plural(
      quantity,
      zero: 'NO ITEMS',
      one: '1 ITEM',
      other: '$quantity ITEMS',
      name: 'shrineCartItemCount',
      desc: 'A text showing the total number of items in the cart.',
      args: [quantity],
    );
  }

  /// `CLEAR CART`
  String get shrineCartClearButtonCaption {
    return Intl.message(
      'CLEAR CART',
      name: 'shrineCartClearButtonCaption',
      desc: 'Caption for a button used to clear the cart.',
      args: [],
    );
  }

  /// `TOTAL`
  String get shrineCartTotalCaption {
    return Intl.message(
      'TOTAL',
      name: 'shrineCartTotalCaption',
      desc: 'Label for a text showing total price of the items in the cart.',
      args: [],
    );
  }

  /// `Subtotal:`
  String get shrineCartSubtotalCaption {
    return Intl.message(
      'Subtotal:',
      name: 'shrineCartSubtotalCaption',
      desc:
          'Label for a text showing the subtotal price of the items in the cart (excluding shipping and tax).',
      args: [],
    );
  }

  /// `Shipping:`
  String get shrineCartShippingCaption {
    return Intl.message(
      'Shipping:',
      name: 'shrineCartShippingCaption',
      desc:
          'Label for a text showing the shipping cost for the items in the cart.',
      args: [],
    );
  }

  /// `Tax:`
  String get shrineCartTaxCaption {
    return Intl.message(
      'Tax:',
      name: 'shrineCartTaxCaption',
      desc: 'Label for a text showing the tax for the items in the cart.',
      args: [],
    );
  }

  /// `Vagabond sack`
  String get shrineProductVagabondSack {
    return Intl.message(
      'Vagabond sack',
      name: 'shrineProductVagabondSack',
      desc: 'Name of the product \'Vagabond sack\'.',
      args: [],
    );
  }

  /// `Stella sunglasses`
  String get shrineProductStellaSunglasses {
    return Intl.message(
      'Stella sunglasses',
      name: 'shrineProductStellaSunglasses',
      desc: 'Name of the product \'Stella sunglasses\'.',
      args: [],
    );
  }

  /// `Whitney belt`
  String get shrineProductWhitneyBelt {
    return Intl.message(
      'Whitney belt',
      name: 'shrineProductWhitneyBelt',
      desc: 'Name of the product \'Whitney belt\'.',
      args: [],
    );
  }

  /// `Garden strand`
  String get shrineProductGardenStrand {
    return Intl.message(
      'Garden strand',
      name: 'shrineProductGardenStrand',
      desc: 'Name of the product \'Garden strand\'.',
      args: [],
    );
  }

  /// `Strut earrings`
  String get shrineProductStrutEarrings {
    return Intl.message(
      'Strut earrings',
      name: 'shrineProductStrutEarrings',
      desc: 'Name of the product \'Strut earrings\'.',
      args: [],
    );
  }

  /// `Varsity socks`
  String get shrineProductVarsitySocks {
    return Intl.message(
      'Varsity socks',
      name: 'shrineProductVarsitySocks',
      desc: 'Name of the product \'Varsity socks\'.',
      args: [],
    );
  }

  /// `Weave keyring`
  String get shrineProductWeaveKeyring {
    return Intl.message(
      'Weave keyring',
      name: 'shrineProductWeaveKeyring',
      desc: 'Name of the product \'Weave keyring\'.',
      args: [],
    );
  }

  /// `Gatsby hat`
  String get shrineProductGatsbyHat {
    return Intl.message(
      'Gatsby hat',
      name: 'shrineProductGatsbyHat',
      desc: 'Name of the product \'Gatsby hat\'.',
      args: [],
    );
  }

  /// `Shrug bag`
  String get shrineProductShrugBag {
    return Intl.message(
      'Shrug bag',
      name: 'shrineProductShrugBag',
      desc: 'Name of the product \'Shrug bag\'.',
      args: [],
    );
  }

  /// `Gilt desk trio`
  String get shrineProductGiltDeskTrio {
    return Intl.message(
      'Gilt desk trio',
      name: 'shrineProductGiltDeskTrio',
      desc: 'Name of the product \'Gilt desk trio\'.',
      args: [],
    );
  }

  /// `Copper wire rack`
  String get shrineProductCopperWireRack {
    return Intl.message(
      'Copper wire rack',
      name: 'shrineProductCopperWireRack',
      desc: 'Name of the product \'Copper wire rack\'.',
      args: [],
    );
  }

  /// `Soothe ceramic set`
  String get shrineProductSootheCeramicSet {
    return Intl.message(
      'Soothe ceramic set',
      name: 'shrineProductSootheCeramicSet',
      desc: 'Name of the product \'Soothe ceramic set\'.',
      args: [],
    );
  }

  /// `Hurrahs tea set`
  String get shrineProductHurrahsTeaSet {
    return Intl.message(
      'Hurrahs tea set',
      name: 'shrineProductHurrahsTeaSet',
      desc: 'Name of the product \'Hurrahs tea set\'.',
      args: [],
    );
  }

  /// `Blue stone mug`
  String get shrineProductBlueStoneMug {
    return Intl.message(
      'Blue stone mug',
      name: 'shrineProductBlueStoneMug',
      desc: 'Name of the product \'Blue stone mug\'.',
      args: [],
    );
  }

  /// `Rainwater tray`
  String get shrineProductRainwaterTray {
    return Intl.message(
      'Rainwater tray',
      name: 'shrineProductRainwaterTray',
      desc: 'Name of the product \'Rainwater tray\'.',
      args: [],
    );
  }

  /// `Chambray napkins`
  String get shrineProductChambrayNapkins {
    return Intl.message(
      'Chambray napkins',
      name: 'shrineProductChambrayNapkins',
      desc: 'Name of the product \'Chambray napkins\'.',
      args: [],
    );
  }

  /// `Succulent planters`
  String get shrineProductSucculentPlanters {
    return Intl.message(
      'Succulent planters',
      name: 'shrineProductSucculentPlanters',
      desc: 'Name of the product \'Succulent planters\'.',
      args: [],
    );
  }

  /// `Quartet table`
  String get shrineProductQuartetTable {
    return Intl.message(
      'Quartet table',
      name: 'shrineProductQuartetTable',
      desc: 'Name of the product \'Quartet table\'.',
      args: [],
    );
  }

  /// `Kitchen quattro`
  String get shrineProductKitchenQuattro {
    return Intl.message(
      'Kitchen quattro',
      name: 'shrineProductKitchenQuattro',
      desc: 'Name of the product \'Kitchen quattro\'.',
      args: [],
    );
  }

  /// `Clay sweater`
  String get shrineProductClaySweater {
    return Intl.message(
      'Clay sweater',
      name: 'shrineProductClaySweater',
      desc: 'Name of the product \'Clay sweater\'.',
      args: [],
    );
  }

  /// `Sea tunic`
  String get shrineProductSeaTunic {
    return Intl.message(
      'Sea tunic',
      name: 'shrineProductSeaTunic',
      desc: 'Name of the product \'Sea tunic\'.',
      args: [],
    );
  }

  /// `Plaster tunic`
  String get shrineProductPlasterTunic {
    return Intl.message(
      'Plaster tunic',
      name: 'shrineProductPlasterTunic',
      desc: 'Name of the product \'Plaster tunic\'.',
      args: [],
    );
  }

  /// `White pinstripe shirt`
  String get shrineProductWhitePinstripeShirt {
    return Intl.message(
      'White pinstripe shirt',
      name: 'shrineProductWhitePinstripeShirt',
      desc: 'Name of the product \'White pinstripe shirt\'.',
      args: [],
    );
  }

  /// `Chambray shirt`
  String get shrineProductChambrayShirt {
    return Intl.message(
      'Chambray shirt',
      name: 'shrineProductChambrayShirt',
      desc: 'Name of the product \'Chambray shirt\'.',
      args: [],
    );
  }

  /// `Seabreeze sweater`
  String get shrineProductSeabreezeSweater {
    return Intl.message(
      'Seabreeze sweater',
      name: 'shrineProductSeabreezeSweater',
      desc: 'Name of the product \'Seabreeze sweater\'.',
      args: [],
    );
  }

  /// `Gentry jacket`
  String get shrineProductGentryJacket {
    return Intl.message(
      'Gentry jacket',
      name: 'shrineProductGentryJacket',
      desc: 'Name of the product \'Gentry jacket\'.',
      args: [],
    );
  }

  /// `Navy trousers`
  String get shrineProductNavyTrousers {
    return Intl.message(
      'Navy trousers',
      name: 'shrineProductNavyTrousers',
      desc: 'Name of the product \'Navy trousers\'.',
      args: [],
    );
  }

  /// `Walter henley (white)`
  String get shrineProductWalterHenleyWhite {
    return Intl.message(
      'Walter henley (white)',
      name: 'shrineProductWalterHenleyWhite',
      desc: 'Name of the product \'Walter henley (white)\'.',
      args: [],
    );
  }

  /// `Surf and perf shirt`
  String get shrineProductSurfAndPerfShirt {
    return Intl.message(
      'Surf and perf shirt',
      name: 'shrineProductSurfAndPerfShirt',
      desc: 'Name of the product \'Surf and perf shirt\'.',
      args: [],
    );
  }

  /// `Ginger scarf`
  String get shrineProductGingerScarf {
    return Intl.message(
      'Ginger scarf',
      name: 'shrineProductGingerScarf',
      desc: 'Name of the product \'Ginger scarf\'.',
      args: [],
    );
  }

  /// `Ramona crossover`
  String get shrineProductRamonaCrossover {
    return Intl.message(
      'Ramona crossover',
      name: 'shrineProductRamonaCrossover',
      desc: 'Name of the product \'Ramona crossover\'.',
      args: [],
    );
  }

  /// `Classic white collar`
  String get shrineProductClassicWhiteCollar {
    return Intl.message(
      'Classic white collar',
      name: 'shrineProductClassicWhiteCollar',
      desc: 'Name of the product \'Classic white collar\'.',
      args: [],
    );
  }

  /// `Cerise scallop tee`
  String get shrineProductCeriseScallopTee {
    return Intl.message(
      'Cerise scallop tee',
      name: 'shrineProductCeriseScallopTee',
      desc: 'Name of the product \'Cerise scallop tee\'.',
      args: [],
    );
  }

  /// `Shoulder rolls tee`
  String get shrineProductShoulderRollsTee {
    return Intl.message(
      'Shoulder rolls tee',
      name: 'shrineProductShoulderRollsTee',
      desc: 'Name of the product \'Shoulder rolls tee\'.',
      args: [],
    );
  }

  /// `Grey slouch tank`
  String get shrineProductGreySlouchTank {
    return Intl.message(
      'Grey slouch tank',
      name: 'shrineProductGreySlouchTank',
      desc: 'Name of the product \'Grey slouch tank\'.',
      args: [],
    );
  }

  /// `Sunshirt dress`
  String get shrineProductSunshirtDress {
    return Intl.message(
      'Sunshirt dress',
      name: 'shrineProductSunshirtDress',
      desc: 'Name of the product \'Sunshirt dress\'.',
      args: [],
    );
  }

  /// `Fine lines tee`
  String get shrineProductFineLinesTee {
    return Intl.message(
      'Fine lines tee',
      name: 'shrineProductFineLinesTee',
      desc: 'Name of the product \'Fine lines tee\'.',
      args: [],
    );
  }

  /// `Search`
  String get shrineTooltipSearch {
    return Intl.message(
      'Search',
      name: 'shrineTooltipSearch',
      desc:
          'The tooltip text for a search button. Also used as a semantic label, used by screen readers, such as TalkBack and VoiceOver.',
      args: [],
    );
  }

  /// `Settings`
  String get shrineTooltipSettings {
    return Intl.message(
      'Settings',
      name: 'shrineTooltipSettings',
      desc:
          'The tooltip text for a settings button. Also used as a semantic label, used by screen readers, such as TalkBack and VoiceOver.',
      args: [],
    );
  }

  /// `Open menu`
  String get shrineTooltipOpenMenu {
    return Intl.message(
      'Open menu',
      name: 'shrineTooltipOpenMenu',
      desc:
          'The tooltip text for a menu button. Also used as a semantic label, used by screen readers, such as TalkBack and VoiceOver.',
      args: [],
    );
  }

  /// `Close menu`
  String get shrineTooltipCloseMenu {
    return Intl.message(
      'Close menu',
      name: 'shrineTooltipCloseMenu',
      desc:
          'The tooltip text for a button to close a menu. Also used as a semantic label, used by screen readers, such as TalkBack and VoiceOver.',
      args: [],
    );
  }

  /// `Close cart`
  String get shrineTooltipCloseCart {
    return Intl.message(
      'Close cart',
      name: 'shrineTooltipCloseCart',
      desc:
          'The tooltip text for a button to close the shopping cart page. Also used as a semantic label, used by screen readers, such as TalkBack and VoiceOver.',
      args: [],
    );
  }

  /// `{quantity, plural, =0{Shopping cart, no items} =1{Shopping cart, 1 item} other{Shopping cart, {quantity} items}}`
  String shrineScreenReaderCart(num quantity) {
    return Intl.plural(
      quantity,
      zero: 'Shopping cart, no items',
      one: 'Shopping cart, 1 item',
      other: 'Shopping cart, $quantity items',
      name: 'shrineScreenReaderCart',
      desc:
          'The description of a shopping cart button containing some products. Used by screen readers, such as TalkBack and VoiceOver.',
      args: [quantity],
    );
  }

  /// `Add to cart`
  String get shrineScreenReaderProductAddToCart {
    return Intl.message(
      'Add to cart',
      name: 'shrineScreenReaderProductAddToCart',
      desc:
          'An announcement made by screen readers, such as TalkBack and VoiceOver to indicate the action of a button for adding a product to the cart.',
      args: [],
    );
  }

  /// `Remove {product}`
  String shrineScreenReaderRemoveProductButton(Object product) {
    return Intl.message(
      'Remove $product',
      name: 'shrineScreenReaderRemoveProductButton',
      desc:
          'A tooltip for a button to remove a product. This will be read by screen readers, such as TalkBack and VoiceOver when a product is added to the shopping cart.',
      args: [product],
    );
  }

  /// `Remove item`
  String get shrineTooltipRemoveItem {
    return Intl.message(
      'Remove item',
      name: 'shrineTooltipRemoveItem',
      desc:
          'The tooltip text for a button to remove an item (a product) in a shopping cart. Also used as a semantic label, used by screen readers, such as TalkBack and VoiceOver.',
      args: [],
    );
  }

  /// `Diners`
  String get craneFormDiners {
    return Intl.message(
      'Diners',
      name: 'craneFormDiners',
      desc: 'Form field label to enter the number of diners.',
      args: [],
    );
  }

  /// `Select Date`
  String get craneFormDate {
    return Intl.message(
      'Select Date',
      name: 'craneFormDate',
      desc: 'Form field label to select a date.',
      args: [],
    );
  }

  /// `Select Time`
  String get craneFormTime {
    return Intl.message(
      'Select Time',
      name: 'craneFormTime',
      desc: 'Form field label to select a time.',
      args: [],
    );
  }

  /// `Select Location`
  String get craneFormLocation {
    return Intl.message(
      'Select Location',
      name: 'craneFormLocation',
      desc: 'Form field label to select a location.',
      args: [],
    );
  }

  /// `Travelers`
  String get craneFormTravelers {
    return Intl.message(
      'Travelers',
      name: 'craneFormTravelers',
      desc: 'Form field label to select the number of travellers.',
      args: [],
    );
  }

  /// `Choose Origin`
  String get craneFormOrigin {
    return Intl.message(
      'Choose Origin',
      name: 'craneFormOrigin',
      desc: 'Form field label to choose a travel origin.',
      args: [],
    );
  }

  /// `Choose Destination`
  String get craneFormDestination {
    return Intl.message(
      'Choose Destination',
      name: 'craneFormDestination',
      desc: 'Form field label to choose a travel destination.',
      args: [],
    );
  }

  /// `Select Dates`
  String get craneFormDates {
    return Intl.message(
      'Select Dates',
      name: 'craneFormDates',
      desc: 'Form field label to select multiple dates.',
      args: [],
    );
  }

  /// `{hours, plural, =1{1h} other{{hours}h}}`
  String craneHours(num hours) {
    return Intl.plural(
      hours,
      one: '1h',
      other: '${hours}h',
      name: 'craneHours',
      desc:
          'Generic text for an amount of hours, abbreviated to the shortest form. For example 1h. {hours} should remain untranslated.',
      args: [hours],
    );
  }

  /// `{minutes, plural, =1{1m} other{{minutes}m}}`
  String craneMinutes(num minutes) {
    return Intl.plural(
      minutes,
      one: '1m',
      other: '${minutes}m',
      name: 'craneMinutes',
      desc:
          'Generic text for an amount of minutes, abbreviated to the shortest form. For example 15m. {minutes} should remain untranslated.',
      args: [minutes],
    );
  }

  /// `{hoursShortForm} {minutesShortForm}`
  String craneFlightDuration(Object hoursShortForm, Object minutesShortForm) {
    return Intl.message(
      '$hoursShortForm $minutesShortForm',
      name: 'craneFlightDuration',
      desc:
          'A pattern to define the layout of a flight duration string. For example in English one might say 1h 15m. Translation should only rearrange the inputs. {hoursShortForm} would for example be replaced by 1h, already translated to the given locale. {minutesShortForm} would for example be replaced by 15m, already translated to the given locale.',
      args: [hoursShortForm, minutesShortForm],
    );
  }

  /// `FLY`
  String get craneFly {
    return Intl.message(
      'FLY',
      name: 'craneFly',
      desc: 'Title for FLY tab.',
      args: [],
    );
  }

  /// `SLEEP`
  String get craneSleep {
    return Intl.message(
      'SLEEP',
      name: 'craneSleep',
      desc: 'Title for SLEEP tab.',
      args: [],
    );
  }

  /// `EAT`
  String get craneEat {
    return Intl.message(
      'EAT',
      name: 'craneEat',
      desc: 'Title for EAT tab.',
      args: [],
    );
  }

  /// `Explore Flights by Destination`
  String get craneFlySubhead {
    return Intl.message(
      'Explore Flights by Destination',
      name: 'craneFlySubhead',
      desc: 'Subhead for FLY tab.',
      args: [],
    );
  }

  /// `Explore Properties by Destination`
  String get craneSleepSubhead {
    return Intl.message(
      'Explore Properties by Destination',
      name: 'craneSleepSubhead',
      desc: 'Subhead for SLEEP tab.',
      args: [],
    );
  }

  /// `Explore Restaurants by Destination`
  String get craneEatSubhead {
    return Intl.message(
      'Explore Restaurants by Destination',
      name: 'craneEatSubhead',
      desc: 'Subhead for EAT tab.',
      args: [],
    );
  }

  /// `{numberOfStops, plural, =0{Nonstop} =1{1 stop} other{{numberOfStops} stops}}`
  String craneFlyStops(num numberOfStops) {
    return Intl.plural(
      numberOfStops,
      zero: 'Nonstop',
      one: '1 stop',
      other: '$numberOfStops stops',
      name: 'craneFlyStops',
      desc:
          'Label indicating if a flight is nonstop or how many layovers it includes.',
      args: [numberOfStops],
    );
  }

  /// `{totalProperties, plural, =0{No Available Properties} =1{1 Available Properties} other{{totalProperties} Available Properties}}`
  String craneSleepProperties(num totalProperties) {
    return Intl.plural(
      totalProperties,
      zero: 'No Available Properties',
      one: '1 Available Properties',
      other: '$totalProperties Available Properties',
      name: 'craneSleepProperties',
      desc:
          'Text indicating the number of available properties (temporary rentals). Always plural.',
      args: [totalProperties],
    );
  }

  /// `{totalRestaurants, plural, =0{No Restaurants} =1{1 Restaurant} other{{totalRestaurants} Restaurants}}`
  String craneEatRestaurants(num totalRestaurants) {
    return Intl.plural(
      totalRestaurants,
      zero: 'No Restaurants',
      one: '1 Restaurant',
      other: '$totalRestaurants Restaurants',
      name: 'craneEatRestaurants',
      desc: 'Text indicating the number of restaurants. Always plural.',
      args: [totalRestaurants],
    );
  }

  /// `Aspen, United States`
  String get craneFly0 {
    return Intl.message(
      'Aspen, United States',
      name: 'craneFly0',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Big Sur, United States`
  String get craneFly1 {
    return Intl.message(
      'Big Sur, United States',
      name: 'craneFly1',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Khumbu Valley, Nepal`
  String get craneFly2 {
    return Intl.message(
      'Khumbu Valley, Nepal',
      name: 'craneFly2',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Machu Picchu, Peru`
  String get craneFly3 {
    return Intl.message(
      'Machu Picchu, Peru',
      name: 'craneFly3',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Malé, Maldives`
  String get craneFly4 {
    return Intl.message(
      'Malé, Maldives',
      name: 'craneFly4',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Vitznau, Switzerland`
  String get craneFly5 {
    return Intl.message(
      'Vitznau, Switzerland',
      name: 'craneFly5',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Mexico City, Mexico`
  String get craneFly6 {
    return Intl.message(
      'Mexico City, Mexico',
      name: 'craneFly6',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Mount Rushmore, United States`
  String get craneFly7 {
    return Intl.message(
      'Mount Rushmore, United States',
      name: 'craneFly7',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Singapore`
  String get craneFly8 {
    return Intl.message(
      'Singapore',
      name: 'craneFly8',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Havana, Cuba`
  String get craneFly9 {
    return Intl.message(
      'Havana, Cuba',
      name: 'craneFly9',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Cairo, Egypt`
  String get craneFly10 {
    return Intl.message(
      'Cairo, Egypt',
      name: 'craneFly10',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Lisbon, Portugal`
  String get craneFly11 {
    return Intl.message(
      'Lisbon, Portugal',
      name: 'craneFly11',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Napa, United States`
  String get craneFly12 {
    return Intl.message(
      'Napa, United States',
      name: 'craneFly12',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Bali, Indonesia`
  String get craneFly13 {
    return Intl.message(
      'Bali, Indonesia',
      name: 'craneFly13',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Malé, Maldives`
  String get craneSleep0 {
    return Intl.message(
      'Malé, Maldives',
      name: 'craneSleep0',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Aspen, United States`
  String get craneSleep1 {
    return Intl.message(
      'Aspen, United States',
      name: 'craneSleep1',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Machu Picchu, Peru`
  String get craneSleep2 {
    return Intl.message(
      'Machu Picchu, Peru',
      name: 'craneSleep2',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Havana, Cuba`
  String get craneSleep3 {
    return Intl.message(
      'Havana, Cuba',
      name: 'craneSleep3',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Vitznau, Switzerland`
  String get craneSleep4 {
    return Intl.message(
      'Vitznau, Switzerland',
      name: 'craneSleep4',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Big Sur, United States`
  String get craneSleep5 {
    return Intl.message(
      'Big Sur, United States',
      name: 'craneSleep5',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Napa, United States`
  String get craneSleep6 {
    return Intl.message(
      'Napa, United States',
      name: 'craneSleep6',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Porto, Portugal`
  String get craneSleep7 {
    return Intl.message(
      'Porto, Portugal',
      name: 'craneSleep7',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Tulum, Mexico`
  String get craneSleep8 {
    return Intl.message(
      'Tulum, Mexico',
      name: 'craneSleep8',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Lisbon, Portugal`
  String get craneSleep9 {
    return Intl.message(
      'Lisbon, Portugal',
      name: 'craneSleep9',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Cairo, Egypt`
  String get craneSleep10 {
    return Intl.message(
      'Cairo, Egypt',
      name: 'craneSleep10',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Taipei, Taiwan`
  String get craneSleep11 {
    return Intl.message(
      'Taipei, Taiwan',
      name: 'craneSleep11',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Naples, Italy`
  String get craneEat0 {
    return Intl.message(
      'Naples, Italy',
      name: 'craneEat0',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Dallas, United States`
  String get craneEat1 {
    return Intl.message(
      'Dallas, United States',
      name: 'craneEat1',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Córdoba, Argentina`
  String get craneEat2 {
    return Intl.message(
      'Córdoba, Argentina',
      name: 'craneEat2',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Portland, United States`
  String get craneEat3 {
    return Intl.message(
      'Portland, United States',
      name: 'craneEat3',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Paris, France`
  String get craneEat4 {
    return Intl.message(
      'Paris, France',
      name: 'craneEat4',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Seoul, South Korea`
  String get craneEat5 {
    return Intl.message(
      'Seoul, South Korea',
      name: 'craneEat5',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Seattle, United States`
  String get craneEat6 {
    return Intl.message(
      'Seattle, United States',
      name: 'craneEat6',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Nashville, United States`
  String get craneEat7 {
    return Intl.message(
      'Nashville, United States',
      name: 'craneEat7',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Atlanta, United States`
  String get craneEat8 {
    return Intl.message(
      'Atlanta, United States',
      name: 'craneEat8',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Madrid, Spain`
  String get craneEat9 {
    return Intl.message(
      'Madrid, Spain',
      name: 'craneEat9',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Lisbon, Portugal`
  String get craneEat10 {
    return Intl.message(
      'Lisbon, Portugal',
      name: 'craneEat10',
      desc: 'Label for city.',
      args: [],
    );
  }

  /// `Chalet in a snowy landscape with evergreen trees`
  String get craneFly0SemanticLabel {
    return Intl.message(
      'Chalet in a snowy landscape with evergreen trees',
      name: 'craneFly0SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Tent in a field`
  String get craneFly1SemanticLabel {
    return Intl.message(
      'Tent in a field',
      name: 'craneFly1SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Prayer flags in front of snowy mountain`
  String get craneFly2SemanticLabel {
    return Intl.message(
      'Prayer flags in front of snowy mountain',
      name: 'craneFly2SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Machu Picchu citadel`
  String get craneFly3SemanticLabel {
    return Intl.message(
      'Machu Picchu citadel',
      name: 'craneFly3SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Overwater bungalows`
  String get craneFly4SemanticLabel {
    return Intl.message(
      'Overwater bungalows',
      name: 'craneFly4SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Lake-side hotel in front of mountains`
  String get craneFly5SemanticLabel {
    return Intl.message(
      'Lake-side hotel in front of mountains',
      name: 'craneFly5SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Aerial view of Palacio de Bellas Artes`
  String get craneFly6SemanticLabel {
    return Intl.message(
      'Aerial view of Palacio de Bellas Artes',
      name: 'craneFly6SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Mount Rushmore`
  String get craneFly7SemanticLabel {
    return Intl.message(
      'Mount Rushmore',
      name: 'craneFly7SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Supertree Grove`
  String get craneFly8SemanticLabel {
    return Intl.message(
      'Supertree Grove',
      name: 'craneFly8SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Man leaning on an antique blue car`
  String get craneFly9SemanticLabel {
    return Intl.message(
      'Man leaning on an antique blue car',
      name: 'craneFly9SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Al-Azhar Mosque towers during sunset`
  String get craneFly10SemanticLabel {
    return Intl.message(
      'Al-Azhar Mosque towers during sunset',
      name: 'craneFly10SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Brick lighthouse at sea`
  String get craneFly11SemanticLabel {
    return Intl.message(
      'Brick lighthouse at sea',
      name: 'craneFly11SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Pool with palm trees`
  String get craneFly12SemanticLabel {
    return Intl.message(
      'Pool with palm trees',
      name: 'craneFly12SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Sea-side pool with palm trees`
  String get craneFly13SemanticLabel {
    return Intl.message(
      'Sea-side pool with palm trees',
      name: 'craneFly13SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Overwater bungalows`
  String get craneSleep0SemanticLabel {
    return Intl.message(
      'Overwater bungalows',
      name: 'craneSleep0SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Chalet in a snowy landscape with evergreen trees`
  String get craneSleep1SemanticLabel {
    return Intl.message(
      'Chalet in a snowy landscape with evergreen trees',
      name: 'craneSleep1SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Machu Picchu citadel`
  String get craneSleep2SemanticLabel {
    return Intl.message(
      'Machu Picchu citadel',
      name: 'craneSleep2SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Man leaning on an antique blue car`
  String get craneSleep3SemanticLabel {
    return Intl.message(
      'Man leaning on an antique blue car',
      name: 'craneSleep3SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Lake-side hotel in front of mountains`
  String get craneSleep4SemanticLabel {
    return Intl.message(
      'Lake-side hotel in front of mountains',
      name: 'craneSleep4SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Tent in a field`
  String get craneSleep5SemanticLabel {
    return Intl.message(
      'Tent in a field',
      name: 'craneSleep5SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Pool with palm trees`
  String get craneSleep6SemanticLabel {
    return Intl.message(
      'Pool with palm trees',
      name: 'craneSleep6SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Colorful apartments at Riberia Square`
  String get craneSleep7SemanticLabel {
    return Intl.message(
      'Colorful apartments at Riberia Square',
      name: 'craneSleep7SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Mayan ruins on a cliff above a beach`
  String get craneSleep8SemanticLabel {
    return Intl.message(
      'Mayan ruins on a cliff above a beach',
      name: 'craneSleep8SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Brick lighthouse at sea`
  String get craneSleep9SemanticLabel {
    return Intl.message(
      'Brick lighthouse at sea',
      name: 'craneSleep9SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Al-Azhar Mosque towers during sunset`
  String get craneSleep10SemanticLabel {
    return Intl.message(
      'Al-Azhar Mosque towers during sunset',
      name: 'craneSleep10SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Taipei 101 skyscraper`
  String get craneSleep11SemanticLabel {
    return Intl.message(
      'Taipei 101 skyscraper',
      name: 'craneSleep11SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Pizza in a wood-fired oven`
  String get craneEat0SemanticLabel {
    return Intl.message(
      'Pizza in a wood-fired oven',
      name: 'craneEat0SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Empty bar with diner-style stools`
  String get craneEat1SemanticLabel {
    return Intl.message(
      'Empty bar with diner-style stools',
      name: 'craneEat1SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Burger`
  String get craneEat2SemanticLabel {
    return Intl.message(
      'Burger',
      name: 'craneEat2SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Korean taco`
  String get craneEat3SemanticLabel {
    return Intl.message(
      'Korean taco',
      name: 'craneEat3SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Chocolate dessert`
  String get craneEat4SemanticLabel {
    return Intl.message(
      'Chocolate dessert',
      name: 'craneEat4SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Artsy restaurant seating area`
  String get craneEat5SemanticLabel {
    return Intl.message(
      'Artsy restaurant seating area',
      name: 'craneEat5SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Shrimp dish`
  String get craneEat6SemanticLabel {
    return Intl.message(
      'Shrimp dish',
      name: 'craneEat6SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Bakery entrance`
  String get craneEat7SemanticLabel {
    return Intl.message(
      'Bakery entrance',
      name: 'craneEat7SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Plate of crawfish`
  String get craneEat8SemanticLabel {
    return Intl.message(
      'Plate of crawfish',
      name: 'craneEat8SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Cafe counter with pastries`
  String get craneEat9SemanticLabel {
    return Intl.message(
      'Cafe counter with pastries',
      name: 'craneEat9SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Woman holding huge pastrami sandwich`
  String get craneEat10SemanticLabel {
    return Intl.message(
      'Woman holding huge pastrami sandwich',
      name: 'craneEat10SemanticLabel',
      desc: 'Semantic label for an image.',
      args: [],
    );
  }

  /// `Front Page`
  String get fortnightlyMenuFrontPage {
    return Intl.message(
      'Front Page',
      name: 'fortnightlyMenuFrontPage',
      desc: 'Menu item for the front page of the news app.',
      args: [],
    );
  }

  /// `World`
  String get fortnightlyMenuWorld {
    return Intl.message(
      'World',
      name: 'fortnightlyMenuWorld',
      desc: 'Menu item for the world news section of the news app.',
      args: [],
    );
  }

  /// `US`
  String get fortnightlyMenuUS {
    return Intl.message(
      'US',
      name: 'fortnightlyMenuUS',
      desc: 'Menu item for the United States news section of the news app.',
      args: [],
    );
  }

  /// `Politics`
  String get fortnightlyMenuPolitics {
    return Intl.message(
      'Politics',
      name: 'fortnightlyMenuPolitics',
      desc: 'Menu item for the political news section of the news app.',
      args: [],
    );
  }

  /// `Business`
  String get fortnightlyMenuBusiness {
    return Intl.message(
      'Business',
      name: 'fortnightlyMenuBusiness',
      desc: 'Menu item for the business news section of the news app.',
      args: [],
    );
  }

  /// `Tech`
  String get fortnightlyMenuTech {
    return Intl.message(
      'Tech',
      name: 'fortnightlyMenuTech',
      desc: 'Menu item for the tech news section of the news app.',
      args: [],
    );
  }

  /// `Science`
  String get fortnightlyMenuScience {
    return Intl.message(
      'Science',
      name: 'fortnightlyMenuScience',
      desc: 'Menu item for the science news section of the news app.',
      args: [],
    );
  }

  /// `Sports`
  String get fortnightlyMenuSports {
    return Intl.message(
      'Sports',
      name: 'fortnightlyMenuSports',
      desc: 'Menu item for the sports news section of the news app.',
      args: [],
    );
  }

  /// `Travel`
  String get fortnightlyMenuTravel {
    return Intl.message(
      'Travel',
      name: 'fortnightlyMenuTravel',
      desc: 'Menu item for the travel news section of the news app.',
      args: [],
    );
  }

  /// `Culture`
  String get fortnightlyMenuCulture {
    return Intl.message(
      'Culture',
      name: 'fortnightlyMenuCulture',
      desc: 'Menu item for the culture news section of the news app.',
      args: [],
    );
  }

  /// `TechDesign`
  String get fortnightlyTrendingTechDesign {
    return Intl.message(
      'TechDesign',
      name: 'fortnightlyTrendingTechDesign',
      desc: 'Hashtag for the tech design trending topic of the news app.',
      args: [],
    );
  }

  /// `Reform`
  String get fortnightlyTrendingReform {
    return Intl.message(
      'Reform',
      name: 'fortnightlyTrendingReform',
      desc: 'Hashtag for the reform trending topic of the news app.',
      args: [],
    );
  }

  /// `HealthcareRevolution`
  String get fortnightlyTrendingHealthcareRevolution {
    return Intl.message(
      'HealthcareRevolution',
      name: 'fortnightlyTrendingHealthcareRevolution',
      desc:
          'Hashtag for the healthcare revolution trending topic of the news app.',
      args: [],
    );
  }

  /// `GreenArmy`
  String get fortnightlyTrendingGreenArmy {
    return Intl.message(
      'GreenArmy',
      name: 'fortnightlyTrendingGreenArmy',
      desc: 'Hashtag for the green army trending topic of the news app.',
      args: [],
    );
  }

  /// `Stocks`
  String get fortnightlyTrendingStocks {
    return Intl.message(
      'Stocks',
      name: 'fortnightlyTrendingStocks',
      desc: 'Hashtag for the stocks trending topic of the news app.',
      args: [],
    );
  }

  /// `Latest Updates`
  String get fortnightlyLatestUpdates {
    return Intl.message(
      'Latest Updates',
      name: 'fortnightlyLatestUpdates',
      desc: 'Title for news section regarding the latest updates.',
      args: [],
    );
  }

  /// `The Quiet, Yet Powerful Healthcare Revolution`
  String get fortnightlyHeadlineHealthcare {
    return Intl.message(
      'The Quiet, Yet Powerful Healthcare Revolution',
      name: 'fortnightlyHeadlineHealthcare',
      desc: 'Headline for a news article about healthcare.',
      args: [],
    );
  }

  /// `Divided American Lives During War`
  String get fortnightlyHeadlineWar {
    return Intl.message(
      'Divided American Lives During War',
      name: 'fortnightlyHeadlineWar',
      desc: 'Headline for a news article about war.',
      args: [],
    );
  }

  /// `The Future of Gasoline`
  String get fortnightlyHeadlineGasoline {
    return Intl.message(
      'The Future of Gasoline',
      name: 'fortnightlyHeadlineGasoline',
      desc: 'Headline for a news article about gasoline.',
      args: [],
    );
  }

  /// `Reforming The Green Army From Within`
  String get fortnightlyHeadlineArmy {
    return Intl.message(
      'Reforming The Green Army From Within',
      name: 'fortnightlyHeadlineArmy',
      desc: 'Headline for a news article about the green army.',
      args: [],
    );
  }

  /// `As Stocks Stagnate, Many Look To Currency`
  String get fortnightlyHeadlineStocks {
    return Intl.message(
      'As Stocks Stagnate, Many Look To Currency',
      name: 'fortnightlyHeadlineStocks',
      desc: 'Headline for a news article about stocks.',
      args: [],
    );
  }

  /// `Designers Use Tech To Make Futuristic Fabrics`
  String get fortnightlyHeadlineFabrics {
    return Intl.message(
      'Designers Use Tech To Make Futuristic Fabrics',
      name: 'fortnightlyHeadlineFabrics',
      desc: 'Headline for a news article about fabric.',
      args: [],
    );
  }

  /// `Feminists Take On Partisanship`
  String get fortnightlyHeadlineFeminists {
    return Intl.message(
      'Feminists Take On Partisanship',
      name: 'fortnightlyHeadlineFeminists',
      desc: 'Headline for a news article about feminists and partisanship.',
      args: [],
    );
  }

  /// `Farmland Bees In Short Supply`
  String get fortnightlyHeadlineBees {
    return Intl.message(
      'Farmland Bees In Short Supply',
      name: 'fortnightlyHeadlineBees',
      desc: 'Headline for a news article about bees.',
      args: [],
    );
  }

  /// `Inbox`
  String get replyInboxLabel {
    return Intl.message(
      'Inbox',
      name: 'replyInboxLabel',
      desc: 'Text label for Inbox destination.',
      args: [],
    );
  }

  /// `Starred`
  String get replyStarredLabel {
    return Intl.message(
      'Starred',
      name: 'replyStarredLabel',
      desc: 'Text label for Starred destination.',
      args: [],
    );
  }

  /// `Sent`
  String get replySentLabel {
    return Intl.message(
      'Sent',
      name: 'replySentLabel',
      desc: 'Text label for Sent destination.',
      args: [],
    );
  }

  /// `Trash`
  String get replyTrashLabel {
    return Intl.message(
      'Trash',
      name: 'replyTrashLabel',
      desc: 'Text label for Trash destination.',
      args: [],
    );
  }

  /// `Spam`
  String get replySpamLabel {
    return Intl.message(
      'Spam',
      name: 'replySpamLabel',
      desc: 'Text label for Spam destination.',
      args: [],
    );
  }

  /// `Drafts`
  String get replyDraftsLabel {
    return Intl.message(
      'Drafts',
      name: 'replyDraftsLabel',
      desc: 'Text label for Drafts destination.',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'si'),
      Locale.fromSubtags(languageCode: 'ta'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
