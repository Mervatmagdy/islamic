import 'package:flutter/material.dart';
import 'package:islamic/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';
class RadioTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(child: Image.asset('assets/images/radio_image.png')),
        Text(AppLocalizations.of(context)!.quran_radio,style:Theme.of(context).textTheme.titleMedium,textAlign:TextAlign.center),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            IconButton(onPressed:(){}, icon:Icon(Icons.skip_previous,color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight,size:35,)),
            IconButton(onPressed:(){}, icon:Icon(Icons.play_arrow,color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight,size:45,)),
            IconButton(onPressed:(){}, icon:Icon(Icons.skip_next,color:provider.isDarkMode()?MyTheme.yellowcolor:MyTheme.primarylight,size: 35,)),
          ],
        ),

      ],
    );
  }
}
