import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerz/Components/bottom_bar.dart';
import 'package:hungerz/Locale/locales.dart';
import 'package:hungerz/Routes/routes.dart';
import 'package:hungerz/Themes/colors.dart';
import 'package:hungerz/language_cubit.dart';
import 'package:hungerz/theme_cubit.dart';

class ThemeList {
  final String? title;
  final String? subtitle;

  ThemeList({this.title, this.subtitle});
}

class LanguageList {
  final String? title;

  LanguageList({this.title});
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool sliderValue = false;
  late LanguageCubit _languageCubit;
  late ThemeCubit _themeCubit;
  String? selectedLocal;
  String? selectedTheme;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    final List<String> language = [
      'English',
      'عربى',
      'français',
      'bahasa Indonesia',
      'português',
      'Español',
      'italiano',
      'Türk',
      'Kiswahili'
    ];
    final List<ThemeList> themes = <ThemeList>[
      ThemeList(
        title: AppLocalizations.of(context)!.darkMode,
        subtitle: AppLocalizations.of(context)!.darkText,
      ),
      ThemeList(
        title: AppLocalizations.of(context)!.lightMode,
        subtitle: AppLocalizations.of(context)!.lightText,
      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(AppLocalizations.of(context)!.settings!,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold)),
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
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              children: [
                Container(
                  height: 57.7,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  //color: kCardBackgroundColor,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.display!,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.08,
                          fontSize: 17),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: ListTile(
                    title: Text(
                      locale.darkMode!,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 18.3,
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      themes[1].subtitle!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.blueGrey),
                    ),
                    trailing: Switch(
                      value: sliderValue,
                      onChanged: (value) {
                        setState(
                          () {
                            sliderValue = value;

                            if (sliderValue == true) {
                              _themeCubit.selectDarkTheme();
                            } else if (sliderValue == false) {
                              _themeCubit.selectLightTheme();
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 58.0,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.selectLanguage!,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: kTextColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.08,
                          fontSize: 17),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: language.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: language[index],
                      groupValue: selectedLocal,
                      title: Text(
                        language[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onChanged: (dynamic value) {
                        setState(() {
                          selectedLocal = value;
                        });
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                ),
              ],
              physics: BouncingScrollPhysics(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(
                  text: AppLocalizations.of(context)!.submit,
                  onTap: () {
                    if (selectedLocal == 'English') {
                      _languageCubit.selectEngLanguage();
                    } else if (selectedLocal == 'عربى') {
                      _languageCubit.selectArabicLanguage();
                    } else if (selectedLocal == 'français') {
                      _languageCubit.selectFrenchLanguage();
                    } else if (selectedLocal == 'bahasa Indonesia') {
                      _languageCubit.selectIndonesianLanguage();
                    } else if (selectedLocal == 'português') {
                      _languageCubit.selectPortugueseLanguage();
                    } else if (selectedLocal == 'Español') {
                      _languageCubit.selectSpanishLanguage();
                    } else if (selectedLocal == 'italiano') {
                      _languageCubit.selectItalianLanguage();
                    } else if (selectedLocal == 'Türk') {
                      _languageCubit.selectTurkishLanguage();
                    } else if (selectedLocal == 'Kiswahili') {
                      _languageCubit.selectSwahiliLanguage();
                    }

                    Navigator.pushNamed(context, PageRoutes.loginNavigator);
                  }),
            ),
          ],
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
