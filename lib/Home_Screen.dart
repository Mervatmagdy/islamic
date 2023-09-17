import 'package:flutter/material.dart';
import 'package:islamic/Hadeth/Hadeth_Body.dart';
import 'package:islamic/MyTheme.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:islamic/Quran/Quran_Body.dart';
import 'package:islamic/Radio/Radio_Body.dart';
import 'package:islamic/Sebha/Sebha_Body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Setting/Setting_body.dart';
import 'package:provider/provider.dart';
class Home_Screen extends StatefulWidget {
  List<Widget>taps=[QuranTab(),HadethTab(),SebhaTab(),RadioTab(),Setting()];
  static const routeName = 'home-screen';
  int selected=0;

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()? Image.asset(
          'assets/images/dark_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ):
        Image.asset(
          'assets/images/default_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title:
                Text(AppLocalizations.of(context)!.app_title, style: Theme.of(context).textTheme.titleLarge),
          ),
          bottomNavigationBar:
          Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex:widget.selected ,
                onTap: (index) {
                widget.selected=index;
                setState(() {
                });
                },
                items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                label: AppLocalizations.of(context)!.quran,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                label:  AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                label: AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                label: AppLocalizations.of(context)!.radio,
              ),
                  BottomNavigationBarItem(
                    icon:Icon(Icons.settings),
                    label:AppLocalizations.of(context)!.setting,
                  ),
            ]),
          ),
       body:widget.taps[widget.selected], )
      ],
    );
  }
}
