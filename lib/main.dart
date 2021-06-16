import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:hungerz/HomeOrderAccount/Account/UI/ListItems/settings_page.dart';
import 'package:hungerz/HomeOrderAccount/Home/UI/home.dart';
import 'package:hungerz/HomeOrderAccount/Home/constants/controller.dart';
import 'package:hungerz/HomeOrderAccount/Home/controller/categories_controller/foodController.dart';
import 'package:hungerz/HomeOrderAccount/Home/controller/home_controller/home_controller.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Routes/routes.dart';
import 'package:hungerz/language_cubit.dart';
import 'package:hungerz/theme_cubit.dart';

import 'HomeOrderAccount/Home/constants/firebase_constants.dart';
import 'HomeOrderAccount/Home/controller/categories_controller/categories_controller.dart';
import 'HomeOrderAccount/Home/controller/restaurant_contrioller/restaurant_controller.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(CategoryController());
    Get.put(RestaurantControllers());
    Get.put(FoodController());
  });
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(Phoenix(child: Hungerz()));
}

class Hungerz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (_, locale) {
              return GetMaterialApp(
                localizationsDelegates: [
                  const AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('en'),
                  const Locale('ar'),
                  const Locale('fr'),
                  const Locale('id'),
                  const Locale('pt'),
                  const Locale('es'),
                  const Locale('it'),
                  const Locale('tr'),
                  const Locale('sw'),
                ],
                debugShowCheckedModeBanner: false,
                locale: locale,
                theme: theme,
                home: Home(),
                routes: PageRoutes().routes(),
              );
            },
          );
        },
      ),
    );
  }
}
