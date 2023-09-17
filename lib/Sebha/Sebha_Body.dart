import 'package:flutter/material.dart';
import 'package:islamic/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/Providers/app_config_provider.dart';
import 'package:provider/provider.dart';
class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  double rotate=0;
  int Counter=0;
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height:50,),
     Center(
       child:
           provider.isDarkMode()?Stack(alignment:const Alignment(0.4,-2.2),
             children: [
               Image.asset('assets/images/head_sebha_dark.png',),
               RotatedBox(
                 quarterTurns:rotate.toInt(),
                 child: InkWell(

                     onTap: (){
                       rotate+=1;
                       Counter+=1;
                       setState(() {

                       });
                     },
                     child: Image.asset('assets/images/body_sebha_dark.png',)),
               ),
             ],
           ):
       Stack(alignment:const Alignment(0.4,-2.2),
         children: [
           Image.asset('assets/images/head_sebha_logo.png',),
           RotatedBox(
             quarterTurns:rotate.toInt(),
             child: InkWell(

                 onTap: (){
                   rotate+=1;
                   Counter+=1;
                   setState(() {

                   });
                 },
                 child: Image.asset('assets/images/body_sebha_logo.png',)),
           ),
         ],
       ),
     ),

        Text(AppLocalizations.of(context)!.number_of_tasbihs,style: Theme.of(context).textTheme.titleMedium,textAlign:TextAlign.center,),
        // SizedBox(height: 20,),
        provider.isDarkMode()?Container(
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:MyTheme.Seconddark,
          ),
          padding: EdgeInsets.symmetric(horizontal:25,vertical: 30),
          child:Text('$Counter',style:Theme.of(context).textTheme.titleMedium,),
        ):
        Container(
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color:MyTheme.secondcolor,
          ),
          padding: EdgeInsets.symmetric(horizontal:25,vertical: 30),
          child:Text('$Counter',style:Theme.of(context).textTheme.titleMedium,),
        ),
        // SizedBox(height: 20,),
        provider.isDarkMode()? Container(
          padding: EdgeInsets.symmetric(horizontal:35,vertical:10),
          decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(25),
              color:MyTheme.yellowcolor
          ),
          child:Text('${sebha_Change()}',style:Theme.of(context).textTheme.titleLarge!.copyWith(color:MyTheme.primarydark,fontFamily:'monotype koufi',fontSize:25)),
        ):
        Container(
          padding: EdgeInsets.symmetric(horizontal:35,vertical:10),
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(25),
            color:MyTheme.primarylight
          ),
          child:Text('${sebha_Change()}',style:Theme.of(context).textTheme.titleLarge!.copyWith(color:MyTheme.whitecolor,fontFamily:'monotype koufi',fontSize:25)),
        ),
        SizedBox(height:10,),
      ],
    );
  }
  List<String>sebha=['سبحان الله','الحمد لله','لا اله الا الله','الله أكبر','استغفر الله'];
  int i=0;
 sebha_Change(){
   if(i==sebha.length-1){
     i=0;
     setState(() {

     });
   }
     if(Counter%30==0 && Counter!=0){
    i++;
    return sebha[i];
  }else {
       return sebha[i];
     }
 }

}
