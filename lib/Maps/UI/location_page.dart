import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz/Components/bottom_bar.dart';
import 'package:hungerz/Components/custom_appbar.dart';
import 'package:hungerz/Components/entry_field.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Maps/Components/address_type_button.dart';
import 'package:hungerz/Routes/routes.dart';

TextEditingController _addressController = TextEditingController();

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SetLocation();
  }
}

class SetLocation extends StatefulWidget {
  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  bool isCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//          extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(126.0),
        child: CustomAppBar(
          // titleSpacing: 0,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleWidget: Text(
            AppLocalizations.of(context)!.setLocation!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onTap: null,
          hint: AppLocalizations.of(context)!.enterLocation,
        ),
      ),
      body: FadedSlideAnimation(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'images/map.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 36.0),
                        child: FadedScaleAnimation(
                          Image.asset(
                            'images/map_pin.png',
                            height: 36,
                          ),
                          durationInMilliseconds: 800,
                        ),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FadedScaleAnimation(
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.my_location,
                            color: Colors.black,
                          ),
                        ),
                        durationInMilliseconds: 800,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Theme.of(context).cardColor,
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  FadedScaleAnimation(
                    Image.asset(
                      'images/map_pin.png',
                      scale: 2.5,
                    ),
                    durationInMilliseconds: 800,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Text(
                      '1024,Central Residency Park,Paris, France',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
            isCard ? SaveAddressCard() : Container(),
            BottomBar(
                text: AppLocalizations.of(context)!.continueText,
                onTap: () {
                  if (isCard == false) {
                    setState(() {
                      isCard = true;
                    });
                  } else {
                    Navigator.popAndPushNamed(
                        context, PageRoutes.homeOrderAccountPage);
                  }
                }),
          ],
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

enum AddressType {
  Home,
  Office,
  Other,
}
AddressType selectedAddress = AddressType.Other;

class SaveAddressCard extends StatefulWidget {
  @override
  _SaveAddressCardState createState() => _SaveAddressCardState();
}

class _SaveAddressCardState extends State<SaveAddressCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: EntryField(
                controller: _addressController,
                label: AppLocalizations.of(context)!.addressLabel,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                AppLocalizations.of(context)!.saveAddress!.toUpperCase(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AddressTypeButton(
                    label: AppLocalizations.of(context)!.homeText,
                    image: 'images/address/ic_homeblk.png',
                    onPressed: () {
                      setState(() {
                        selectedAddress = AddressType.Home;
                      });
                    },
                    isSelected: selectedAddress == AddressType.Home,
                  ),
                  AddressTypeButton(
                    label: AppLocalizations.of(context)!.office,
                    image: 'images/address/ic_officeblk.png',
                    onPressed: () {
                      setState(() {
                        selectedAddress = AddressType.Office;
                      });
                    },
                    isSelected: selectedAddress == AddressType.Office,
                  ),
                  AddressTypeButton(
                    label: AppLocalizations.of(context)!.other,
                    image: 'images/address/ic_otherblk.png',
                    onPressed: () {
                      setState(() {
                        selectedAddress = AddressType.Other;
                      });
                    },
                    isSelected: selectedAddress == AddressType.Other,
                  ),
                ],
              ),
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
