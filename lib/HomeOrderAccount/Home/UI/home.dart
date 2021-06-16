import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz/HomeOrderAccount/Home/Models/category.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/Stores/stores.dart';
import 'package:hungerz/HomeOrderAccount/Home/constants/controller.dart';
import 'package:hungerz/Pages/items.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Routes/routes.dart';
import 'package:hungerz/Themes/colors.dart';

import 'booking_row.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final bool isBooking = false;
    final banner = [
      'images/Banners/Banner 2.png',
      'images/Banners/Banner 1.png',
    ];
    final List<Category> categories = [
      Category('images/Categories/ic_fastfood.png',
          AppLocalizations.of(context)!.fast),
      Category('images/Categories/ic_Seafood.png',
          AppLocalizations.of(context)!.sea),
      Category('images/Categories/ic_chinese.png',
          AppLocalizations.of(context)!.chinese),
      Category('images/Categories/ic_dessert.png',
          AppLocalizations.of(context)!.desert),
    ];
    String value = "New York, USA";
    return Obx(()=>
       Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: FadedScaleAnimation(
              Icon(Icons.location_on, color: kMainColor),
              durationInMilliseconds: 200,
            ),
          ),
          title: Container(
            child: Row(
              children: [
                Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 15, color: Colors.grey[500]),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageRoutes.locationPage);
                  },
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[500]),
                )
              ],
            ),
          ),
          // DropdownButton(
          //   value: value,
          //   icon: Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey),
          //   iconSize: 24.0,
          //   elevation: 16,
          //   style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 15),
          //   underline: Container(height: 0),
          //   onChanged: (String newValue) {
          //     setState(() {
          //       value = newValue;
          //     });
          //     if (value == appLocalization.setLocation)
          //       Navigator.pushNamed(context, PageRoutes.locationPage);
          //   },
          //   items: <String>[
          //     "New York, USA",
          //     appLocalization.office,
          //     appLocalization.other,
          //     appLocalization.setLocation
          //   ].map<DropdownMenuItem<String>>((address) {
          //     return DropdownMenuItem<String>(
          //       value: address,
          //       child: Text(
          //         address,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     );
          //   }).toList(),
          // ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: FadedScaleAnimation(
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    /*.......*/
                  },
                ),
                durationInMilliseconds: 200,
              ),
            ),
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Categories',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              height: 83.3,
              margin: EdgeInsets.only(left: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryController.categories.length,
                  itemBuilder: (context, index) {
                    print(categories[index].title);
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StoresPage(categories[index].title))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          height: 83.3,
                          width: 83.3,
                          color: Theme.of(context).cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FadedScaleAnimation(
                                Image.asset(
                                  categories[index].image,
                                  height: 37.3,
                                  width: 41.3,
                                ),
                                durationInMilliseconds: 200,
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Text(
                                categoryController.categories[index].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.homeText2!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, PageRoutes.offer),
                    child: Text(
                      AppLocalizations.of(context)!.seeAll!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: kMainColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 136,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: banner.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: FadedScaleAnimation(
                        Image.asset(banner[index]),
                        durationInMilliseconds: 200,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 5,top: 10,right: 20),
              child: Row(
                children: [
                  Text(
                    'Restaurants',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),

                  Spacer(),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => StoresPage("Near You"),
                  //         ));
                  //   },
                  //   child: Text(
                  //    'See All',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .bodyText1!
                  //         .copyWith(color: kMainColor,fontSize: 15),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
              child: Text(
               '${ restaurantControllers.restaurants.length.toString()} - Restaurant Found',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(
                    color: kHintColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: FadedSlideAnimation(
                ListView.builder(
                  itemCount: restaurantControllers.restaurants.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var data = restaurantControllers.restaurants[index];

                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            foodController.foods.clear();
                            foodController.restaurantName.value = data.name;
                            foodController.restaurantAddress.value = data.address;
                            foodController.docID.value = data.restaurantId;
                            foodController.foods.bindStream(foodController.getfoods(data.restaurantId));
                            //
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemsPage(
                                    AppLocalizations.of(context)!.store,
                                  ),
                                ));
                              },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                            child: Row(
                              children: <Widget>[
                                FadedScaleAnimation(
                                  // Image(
                                  //   image: AssetImage("images/Restaurants/Layer 1.png"),
                                  //   height: 93.3,
                                  // ),
                                  Image.network(data.image,scale: 15,),
                                  durationInMilliseconds: 800,
                                ),
                                SizedBox(width: 13.3),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(data.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                            color:
                                            Theme.of(context).secondaryHeaderColor,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 8.0),
                                    // SizedBox(height: 10.3),
                                    // Row(
                                    //   children: <Widget>[
                                    //     Icon(
                                    //       Icons.star,
                                    //       color: Color(0xff7ac81e),
                                    //       size: 15,
                                    //     ),
                                    //     SizedBox(width: 10.0),
                                    //     Text('4.5',
                                    //         style: Theme.of(context)
                                    //             .textTheme
                                    //             .caption!
                                    //             .copyWith(
                                    //             color: Color(0xff7ac81e),
                                    //             fontSize: 10.0,
                                    //             fontWeight: FontWeight.bold)),
                                    //   ],
                                    // ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          color: kIconColor,
                                          size: 15,
                                        ),
                                        SizedBox(width: 10.0),
                                        Text('5.0 km ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                color: kHintColor, fontSize: 10.0)),
                                        Text('| ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                color: kMainColor, fontSize: 10.0)),
                                        Text(data.address,overflow: TextOverflow.ellipsis,maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                color: kHintColor, fontSize: 10.0)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                beginOffset: Offset(0.0, 0.3),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quickGrid(BuildContext context, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ItemsPage(AppLocalizations.of(context)!.store),
            ));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage(image),
            height: 62.5,
          ),
          SizedBox(width: 13.3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(AppLocalizations.of(context)!.store!,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0),
              Text(AppLocalizations.of(context)!.type!,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: kLightTextColor, fontSize: 10.0)),
              SizedBox(height: 10.3),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: kIconColor,
                    size: 13,
                  ),
                  SizedBox(width: 10.0),
                  Text('5.0 km ',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: kLightTextColor, fontSize: 10.0)),
                  Text('| ',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: kMainColor, fontSize: 10.0)),
                  Text(AppLocalizations.of(context)!.storeAddress!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: kLightTextColor, fontSize: 10.0)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
