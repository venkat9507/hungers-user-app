import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungerz/Chat/UI/animated_bottom_bar.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/account_page.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/home.dart';
import 'package:hungerz/HomeOrderAccount/Order/UI/order_page.dart';
import 'package:hungerz/Locale/locales.dart';

class HomeOrderAccount extends StatefulWidget {
  final int index;
  HomeOrderAccount([this.index = 0]);
  @override
  _HomeOrderAccountState createState() => _HomeOrderAccountState();
}

class _HomeOrderAccountState extends State<HomeOrderAccount> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  // void onTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  static String bottomIconHome = 'images/footermenu/ic_home.png';

  static String bottomIconOrder = 'images/footermenu/ic_orders.png';

  static String bottomIconAccount = 'images/footermenu/ic_profile.png';

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    final List<BarItem> barItems = [
      BarItem(
        text: appLocalization.homeText,
        image: bottomIconHome,
      ),
      BarItem(
        text: "Orders",
        image: bottomIconOrder,
      ),
      BarItem(
        text: "Account",
        image: bottomIconAccount,
      ),
    ];

    final List<Widget> _children = [
      HomePage(),
      OrderPage(),
      AccountPage(),
    ];
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          onBarTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
