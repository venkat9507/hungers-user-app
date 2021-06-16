import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz/Components/bottom_bar.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Themes/colors.dart';
import 'package:hungerz/HomeOrderAccount/home_order_account.dart';

class TableBooked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.all(60.0),
              child: FadedScaleAnimation(
                Image.asset(
                  'images/table booked.png',
                  height: 265.7,
                  width: 260.7,
                ),
                durationInMilliseconds: 800,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.booked!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 23.3),
            ),
            Text(
              AppLocalizations.of(context)!.thankstb!,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: kDisabledColor),
            ),
            Spacer(
              flex: 2,
            ),
            BottomBar(
              text: AppLocalizations.of(context)!.orderTextt,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeOrderAccount(1),
                  )),
            )
          ],
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
