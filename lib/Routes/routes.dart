import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungerz/Auth/login_navigator.dart';
import 'package:hungerz/Chat/UI/chat_page.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/addMoney_page.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/addToWallet.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/favourite.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/saved_addresses_page.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/settings_page.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/support_page.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/tnc_page.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/wallet_page.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/account_page.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/home.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/order_placed_map.dart';
import 'package:hungerz/HomeOrderAccount/Order/UI/order_page.dart';
import 'package:hungerz/HomeOrderAccount/Order/UI/rateNow.dart';
import 'package:hungerz/HomeOrderAccount/home_order_account.dart';
import 'package:hungerz/Maps/UI/location_page.dart';
import 'package:hungerz/Pages/offers.dart';
import 'package:hungerz/Pages/order_placed.dart';
import 'package:hungerz/Pages/tablebooked.dart';
import 'package:hungerz/Pages/payment_method.dart';
import 'package:hungerz/Pages/reviews.dart';
import 'package:hungerz/Pages/view_cart.dart';
import 'package:hungerz/Pages/tablebooking.dart';

class PageRoutes {
  static const String locationPage = 'location_page';
  static const String homeOrderAccountPage = 'home_order_account';
  static const String homePage = 'home_page';
  static const String accountPage = 'account_page';
  static const String orderPage = 'order_page';
  static const String tablebooked = 'tablebooked';
  static const String items = 'items';
  static const String tncPage = 'tnc_page';
  static const String savedAddressesPage = 'saved_addresses_page';
  static const String supportPage = 'support_page';
  static const String loginNavigator = 'login_navigator';
  static const String orderMapPage = 'order_map_page';
  static const String chatPage = 'chat_page';
  static const String viewCart = 'view_cart';
  static const String orderPlaced = 'order_placed';
  static const String paymentMethod = 'payment_method';
  static const String wallet = 'wallet_page';
  static const String addMoney = 'addMoney_page';
  static const String settings = 'settings_page';
  static const String review = 'reviews';
  static const String rate = 'rateNow';
  static const String addToWallet = 'addToWallet';
  static const String favourite = 'favourite';
  static const String offer = 'offers';
  static const String tablebooking = 'tablebooking';

  Map<String, WidgetBuilder> routes() {
    return {
      offer: (context) => Offers(),
      locationPage: (context) => LocationPage(),
      homeOrderAccountPage: (context) => HomeOrderAccount(),
      homePage: (context) => HomePage(),
      orderPage: (context) => OrderPage(),
      accountPage: (context) => AccountPage(),
      tncPage: (context) => TncPage(),
      savedAddressesPage: (context) => SavedAddressesPage(),
      supportPage: (context) => SupportPage(),
      loginNavigator: (context) => LoginNavigator(),
      orderMapPage: (context) => OrderMapPage(),
      chatPage: (context) => ChatPage(),
      // items: (context) => ItemsPage(),
      viewCart: (context) => ViewCart(),
      paymentMethod: (context) => PaymentPage(),
      orderPlaced: (context) => OrderPlaced(),
      wallet: (context) => WalletPage(),
      addMoney: (context) => AddMoney(),
      settings: (context) => Settings(),
      review: (context) => ReviewPage(),
      rate: (context) => RateNow(),
      addToWallet: (context) => AddToWallet(),
      favourite: (context) => Favourite(),
      tablebooked: (context) => TableBooked(),
      tablebooking: (context) => Tablebooking(),
    };
  }
}
