import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Hadeth/Hadeth_details.dart';
import 'package:islamic/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';
class HadethTab extends StatefulWidget {
  List<HadethData> lines = [];

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
  if(widget.lines.isEmpty){
    loadfile();
  }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth_logo.png')),
        provider.isDarkMode()?Divider(
          color:MyTheme.yellowcolor,
          thickness: 3,
        ):Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        provider.isDarkMode()? Divider(
          color:MyTheme.yellowcolor,
          thickness: 3,
        ):
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        widget.lines.isEmpty?Center(
          child: CircularProgressIndicator(
            color:Theme.of(context).primaryColor,
          ),
        ):
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(Hadeth_detail.routeName,arguments:widget.lines[index]);
                  },
                    child: Text(
                      widget.lines[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'ElMessiri-SemiBold'),
                  textAlign: TextAlign.center,
                ));
              },
              separatorBuilder: (context, index) =>
              provider.isDarkMode()?Divider(thickness: 2,color:MyTheme.yellowcolor):
                  Divider(thickness: 2,color:Theme.of(context).primaryColor),
              itemCount: widget.lines.length),
        )
      ],
    );
  }

  void loadfile() async {
    String ahadeth = await rootBundle.loadString('assets/ahadeth.txt');
    List<String> ahadethLines = ahadeth.split('#\r\n');
    for (int i = 0; i < ahadethLines.length; i++) {
      List<String> hadethContent = ahadethLines[i].split('\n');
      String title = hadethContent[0];
      hadethContent.removeAt(0);
      HadethData hadethData = HadethData(title: title, content: hadethContent);
      widget.lines.add(hadethData);
      setState(() {});
    }
    // print(ahadethLines[0]);
  }
}

class HadethData {
  String title;
  List<String> content;
  HadethData({required this.title, required this.content});
}
