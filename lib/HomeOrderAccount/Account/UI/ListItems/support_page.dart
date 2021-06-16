import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz/Components/bottom_bar.dart';
import 'package:hungerz/Components/textfield.dart';
import 'package:hungerz/Themes/colors.dart';

import 'package:hungerz/Locale/locales.dart';

class SupportPage extends StatelessWidget {
  static const String id = 'support_page';
  final String? number;

  SupportPage({this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppLocalizations.of(context)!.support!,
            style: Theme.of(context).textTheme.bodyText1),
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 48.0),
                  color: Theme.of(context).cardColor,
                  child: FadedScaleAnimation(
                    Image(
                      image: AssetImage("images/logouser.png"),
                      height: 130.0,
                      width: 99.7,
                    ),
                    durationInMilliseconds: 800,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 16.0),
                        child: Text(
                          AppLocalizations.of(context)!.orWrite!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                        child: Text(
                          AppLocalizations.of(context)!.yourWords!,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            inputField(
                              AppLocalizations.of(context)!.mobileNumber!,
                              '+1 987 654 3210',
                              'images/icons/ic_phone.png',
                            ),
                            inputField(
                              AppLocalizations.of(context)!.message!,
                              AppLocalizations.of(context)!.enterMessage,
                              'images/icons/ic_mail.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                BottomBar(
                  text: AppLocalizations.of(context)!.submit,
                  onTap: () {
                    /*............*/
                  },
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Container inputField(String title, String? hint, String img) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 20,
                child: Image(
                  image: AssetImage(
                    img,
                  ),
                  color: kMainColor,
                ),
              ),
              SizedBox(
                width: 13,
              ),
              Text(title,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12))
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 33),
            child: Column(
              children: [
                SmallTextFormField(null, hint),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
