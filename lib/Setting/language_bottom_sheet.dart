
import 'package:flutter/material.dart';
import 'package:islamic/MyTheme.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class language_bottom_sheet extends StatefulWidget {
  @override
  State<language_bottom_sheet> createState() => _language_bottom_sheetState();
}

class _language_bottom_sheetState extends State<language_bottom_sheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      color:provider.isDarkMode()?MyTheme.primarydark:MyTheme.whitecolor,
      padding:EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');
            },
            child:provider.appLanguage=='en'?getSelectedItem(AppLocalizations.of(context)!.english):
            getUnselectedItem(AppLocalizations.of(context)!.english),
          ),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
            },
            child:provider.appLanguage=='ar'?getSelectedItem(AppLocalizations.of(context)!.arabic):
            getUnselectedItem(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text){
    var provider=Provider.of<AppConfigProvider>(context);
    return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,
    children: [
      Text(text,style:Theme.of(context).textTheme.bodyLarge!.copyWith(color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight)),
      Icon(Icons.check,color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight,size: 25,)
    ],
    ),
    );
  }
  Widget getUnselectedItem(String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
          Text(text,style:Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
