import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Widgets/MainButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashscreenState();
  }

}

class _SplashscreenState extends State<Splashscreen> {

  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    /**this is the screenUtil lines that handle the screen ratios*/

    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 360, height: 750);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset("assets/Images/galdem.png",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset("assets/Images/Milikitechnician.png",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset("assets/Images/Milikipattern.png",
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(60),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(26),
                    ),
                    Image.asset("assets/Images/logo.png",
                      width: ScreenUtil().setWidth(96),),
                  ],),
                SizedBox(
                  height: ScreenUtil().setHeight(124),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(26),
                    ),
                    Text("Hi!",style:GoogleFonts.getFont("Poppins",
                        color: Color(0xffFFFFFF),
                        fontSize: ScreenUtil().setSp(21)),)
                  ],),
                SizedBox(
                  height: ScreenUtil().setHeight(29),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(26),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text("As part of our continued commitment to"
                              ,style:GoogleFonts.getFont("Poppins",
                                  color: Color(0xffFFFFFF),
                                  fontSize: ScreenUtil().setSp(15)),),
                            Text("#ChampionCustomerConvenience,        "
                              ,style:GoogleFonts.getFont("Poppins",
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(15)),),
                          ],
                        ),

                      ],
                    ),

                  ],),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(27),
                    ),
                    Container(
                      child: Text("LRA wishes to share"
                          "with you self service options on how to verify your details on LRA"
                        ,style:GoogleFonts.getFont("Poppins",
                            color: Color(0xffFFFFFF),
                            fontSize: ScreenUtil().setSp(15)),),
                      width: ScreenUtil().setWidth(296),
                    ),

                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(186),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainButton(text: "Login",onTap: (){
                    Navigator.pushNamed(context, "/LoginPage");
                  },color: Colors.red,width: 300,textColor: Colors.white),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(26),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(33),
                    ),
                    Text("For Help:  ",
                      style: GoogleFonts.getFont("Poppins",
                          color: Color(0xffFFFFFF),
                          fontSize: ScreenUtil().setSp(12)),),
                    Text("    +254 7889 000 0000",
                      style: GoogleFonts.getFont("Poppins",
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(12)),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      /*_pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve:Curves.easeInOut,
      );*/
    });
  }

  void _skip()async{
    final timer=Timer(Duration(seconds:4 ), ()async{
      Navigator.pushNamedAndRemoveUntil(context, "/LoginPage", (route) => false);
    });
  }

  void checkInternet()async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        snackBar("You are currently connected to your internet");
      }
    } on SocketException catch (_) {
      print('not connected');
      snackBar("Connect to the interent to continue");
    }
  }

  void snackBar(String value){
    final snackBar = SnackBar(
      content: Text(value),
      duration: Duration(seconds: 1),
      backgroundColor: Color(0xff00215E),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}