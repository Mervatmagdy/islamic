import 'package:flutter/material.dart';
import 'package:islamic/Hadeth/Hadeth_Body.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../MyTheme.dart';

class Hadeth_detail extends StatefulWidget {
  static const routeName='hadeth_detail';

  @override
  State<Hadeth_detail> createState() => _Hadeth_detailState();
}

class _Hadeth_detailState extends State<Hadeth_detail> {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as HadethData;
    return Stack(
      children: [
        provider.isDarkMode()?Image.asset(
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
        appBar:AppBar(
          title: Text('${args.title}',
              style: Theme.of(context).textTheme.bodyLarge),
        ),
          body: Container(
            margin:EdgeInsets.symmetric(
                vertical:MediaQuery.of(context).size.height*0.06,
                horizontal: MediaQuery.of(context).size.width*0.05
            ),
            decoration:
                provider.isDarkMode()? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color:MyTheme.primarydark):
            BoxDecoration(
                borderRadius: BorderRadius.circular(20),color:MyTheme.whitecolor),
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    '${args.content[index]}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontFamily:'decotype thuluth'),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  );
                },
                itemCount:1),
          ),
      ),
    ]);
  }
}
