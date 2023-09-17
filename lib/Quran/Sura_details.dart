import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/MyTheme.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:islamic/Quran/Quran_Body.dart';
import 'package:provider/provider.dart';

class Sura_detail extends StatefulWidget {
  static const routeName = 'sura_detail';

  @override
  State<Sura_detail> createState() => _Sura_detailState();
}

class _Sura_detailState extends State<Sura_detail> {
  List<String> verse = [];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as QuranArgs;
    if (verse.isEmpty) {
      loadfiles(args.index);
    }
    return Stack(children: [
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
            title: Text('${args.name}',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: verse.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ))
              : Container(
            margin:EdgeInsets.symmetric(
            vertical:MediaQuery.of(context).size.height*0.06,
              horizontal: MediaQuery.of(context).size.width*0.05
            ),
                  decoration: provider.isDarkMode()? BoxDecoration(
                      borderRadius: BorderRadius.circular(20),color:MyTheme.primarydark):
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(20),color:MyTheme.whitecolor),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Text(
                          '${verse[index]}{${index + 1}}',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontFamily:'decotype thuluth'),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        );
                      },
                      separatorBuilder: (context, index) =>
                      provider.isDarkMode()? Divider(
                          color:MyTheme.yellowcolor,
                          thickness: 2):
                          Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 2),
                      itemCount: verse.length),
                )),
    ]);
  }

  Future<void> loadfiles(index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verse = lines;
    // print(verse);
    setState(() {});
  }
}
