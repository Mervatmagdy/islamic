
import 'package:flutter/material.dart';
import 'package:islamic/MyTheme.dart';
import 'package:islamic/Setting/language_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Setting/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../Providers/app_config_provider.dart';
class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.language,style:Theme.of(context).textTheme.bodyLarge,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding:EdgeInsets.all(10),
            decoration:BoxDecoration(
              color:Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(40)
            ),

            child: InkWell(
              onTap: (){
                showlanguageBottomSheet(context);
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(style:Theme.of(context).textTheme.titleSmall
                      ,AppConfigProvider.getAppLanguage('AppLanguage')=='ar'?AppLocalizations.of(context)!.arabic:
                  AppLocalizations.of(context)!.english),
                  Icon(Icons.arrow_drop_down_outlined,size: 30,)
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context)!.theming,style:Theme.of(context).textTheme.bodyLarge,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding:EdgeInsets.all(10),
            decoration:BoxDecoration(
                color:Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40)
            ),

            child: InkWell(
              onTap: (){
                showThemeBottomSheet(context);
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(style:Theme.of(context).textTheme.titleSmall
                      ,provider.isDarkMode()?AppLocalizations.of(context)!.dark_mode:
                      AppLocalizations.of(context)!.light_mode),
                  Icon(Icons.arrow_drop_down_outlined,size:30,)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => theme_bottom_sheet());
  }
}

void showlanguageBottomSheet(context) {
  showModalBottomSheet(context: context, builder:(context) {
   return language_bottom_sheet();
  },);

}
