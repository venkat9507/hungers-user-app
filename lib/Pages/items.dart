import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hungerz/Components/bottom_bar.dart';
import 'package:hungerz/Components/custom_appbar.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/booking_row.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/choose_ordering_method.dart';
import 'package:hungerz/HomeOrderAccount/Home/constants/controller.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Routes/routes.dart';
import 'package:hungerz/Themes/colors.dart';

List<String> list = ['Extra Cheese', 'Extra Mayonnaise', 'Extra Veggies'];
List<String> list1 = ['\$ 3.00', '\$ 2.00', '\$ 1.50'];

class ItemsPage extends StatefulWidget {
  final String? name;
  final bool isBooking;
  ItemsPage(this.name, [this.isBooking = false]);

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  bool itemAdded = false;
  int itemCount = 0;
  int itemCount1 = 0;
  int itemCount2 = 0;

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;
    final List<Tab> tabs = <Tab>[
      Tab(text: appLocalization.fast),
      Tab(text: appLocalization.stater!.toUpperCase()),
      Tab(text: appLocalization.mainCourse!.toUpperCase()),
      Tab(text: appLocalization.desert!.toUpperCase()),
    ];
    return Obx(()=>
       Material(
        child: Stack(
          children: <Widget>[
            DefaultTabController(
              length: tabs.length,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(185.0),
                  child: CustomAppBar(
                    leading: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: FadedScaleAnimation(
                          Icon(
                            Icons.favorite_border,
                            size: 19.5,
                          ),
                          durationInMilliseconds: 800,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: FadedScaleAnimation(
                          Icon(Icons.search),
                          durationInMilliseconds: 800,
                        ),
                      )
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(0.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, PageRoutes.review),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(foodController.restaurantName.value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor)),
                                  // SizedBox(
                                  //   height: 10.0,
                                  // ),
                                  // Text(AppLocalizations.of(context)!.type!,
                                  //     style:
                                  //         Theme.of(context).textTheme.overline),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: kIconColor,
                                        size: 13,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text('2.4 km ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline),
                                      Text('| ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline!
                                              .copyWith(color: kMainColor)),
                                      Text(
                                         foodController.restaurantAddress.value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline),
                                      Spacer(),




                                      // Icon(
                                      //   Icons.star,
                                      //   color: Color(0xff7ac81e),
                                      //   size: 13,
                                      // ),
                                      // SizedBox(width: 8.0),
                                      // Text('4.2',
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .overline!
                                      //         .copyWith(
                                      //             color: Color(0xff7ac81e))),
                                      // SizedBox(width: 8.0),
                                      // Text('148 reviews',
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .overline),
                                      // SizedBox(width: 8.0),
                                      // Icon(
                                      //   Icons.arrow_forward_ios,
                                      //   color: kIconColor,
                                      //   size: 10,
                                      // ),






                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 18,
                            ),
                            // BookingRow(),


                            //
                            // TabBar(
                            //   tabs: tabs,
                            //   isScrollable: true,
                            //   labelColor: kMainColor,
                            //   unselectedLabelColor: kLightTextColor,
                            //   indicatorPadding:
                            //       EdgeInsets.symmetric(horizontal: 24.0),
                            // ),

                            // SizedBox(
                            //   height: 50,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                body:
                      ListView.builder(
                          itemCount: foodController.foods.length,
                          itemBuilder: (BuildContext context,int index){
                        return
                          ListTile(
                            leading: FadedScaleAnimation(
                              SizedBox(
                                  height: 50.0,
                                  width:50.7,
                                  child: Image.network(foodController.foods[index].photourl,fit: BoxFit.fill,)),
                              // Image.asset(
                              //   'images/Food images/2.png',
                              //   scale: 3,
                              // ),
                              durationInMilliseconds: 800,
                            ),
                            title: Text(foodController.foods[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: [
                                  FadedScaleAnimation(
                                    Image.asset(
                                      'images/ic_veg.png',
                                      height: 16.0,
                                      width: 16.7,
                                    ),
                                    durationInMilliseconds: 800,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text('₹ ${foodController.foods[index].price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(fontSize: 15)),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  // widget.isBooking
                                  //     ? SizedBox.shrink()
                                  //     : InkWell(
                                  //   onTap: () {
                                  //     showModalBottomSheet(
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return Container(
                                  //             height: 280,
                                  //             child: BottomSheetWidget());
                                  //       },
                                  //     );
                                  //   },
                                  //   child: Text(
                                  //     AppLocalizations.of(context)!.customize!,
                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .caption!
                                  //         .copyWith(
                                  //         fontWeight: FontWeight.bold,
                                  //         color: kMainColor),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            trailing: widget.isBooking
                                ? SizedBox.shrink()
                                : itemCount == 0
                                ? Container(
                              height: 33.0,
                              child: TextButton(
                                child: Text(
                                 'Add',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                      color: kMainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  setState(() {
                                    itemCount++;
                                    itemAdded = true;
                                  });
                                },
                              ),
                            )
                                : FittedBox(
                              child: Container(
                                height: 33.0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: kMainColor),
                                  borderRadius:
                                  BorderRadius.circular(30.0),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          itemCount--;
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: kMainColor,
                                        size: 20.0,
                                        //size: 23.3,
                                      ),
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(itemCount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption),
                                    SizedBox(width: 8.0),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          itemCount++;
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: kMainColor,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                      })
                ),
              ),
            if (itemAdded)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: <Widget>[
                      FadedScaleAnimation(
                        Image.asset(
                          'images/icons/ic_cart wt.png',
                          height: 19.0,
                          width: 18.3,
                        ),
                        durationInMilliseconds: 800,
                      ),
                      SizedBox(width: 20.7),
                      Text(
                        'Items: 3 | \$ 21.00',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                  color: Color(0xfff8f9fd), child: Bottom());
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            AppLocalizations.of(context)!.viewCart!,
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                color: kMainColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  color: kMainColor,
                  height: 60.0,
                ),
              )
            else
              SizedBox.shrink(),
            widget.isBooking
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomBar(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              child: BottomWidget(),
                            );
                          },
                        );
                      },
                      text: "Book A Table",
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  List<String> _selectedList = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 100.7,
          color: Theme.of(context).cardColor,
          padding: EdgeInsets.all(15.0),
          child: ListTile(
            title: Text(AppLocalizations.of(context)!.sandwich!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w500)),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  FadedScaleAnimation(
                    Image.asset(
                      'images/ic_veg.png',
                      height: 16.0,
                      width: 16.7,
                    ),
                    durationInMilliseconds: 800,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text('\$ 5.00',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 15)),
                ],
              ),
            ),
            trailing: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)!.add!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: kMainColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) => CheckboxListTile(
            title: Text(list[index]),
            value: _selectedList.contains(list[index]),
            onChanged: (value) {
              if (value!) {
                _selectedList.add(list[index]);
              } else {
                _selectedList.remove(list[index]);
              }
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
