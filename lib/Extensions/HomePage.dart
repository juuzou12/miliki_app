import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:miliki_app/Sections/HomepageMiddlePart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'dart:async';
import 'package:miliki_app/Widgets/PopupMenu.dart';
import 'package:dio/dio.dart';
class HomePage extends StatefulWidget {
  final String name;

  const HomePage({Key key, this.name}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var showOption = false;
  SharedPreferences sharedPreferences;
  String name;
  Future<Map> showBalanceResponse;
  final GlobalKey _menuKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: ScreenUtil().setHeight(175),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: ScreenUtil().setWidth(26),
                            ),
                            Image.asset(
                              "assets/Images/logo.png",
                              width: ScreenUtil().setWidth(96),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.account_circle),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 15,
                                color: Color(0xff3598DC),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(10),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            showOption=true;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(26),
                      ),
                      Text(
                        "Good afternoon!",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff3598DC),
                            fontWeight: FontWeight.w200,
                            fontSize: ScreenUtil().setSp(16)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(26),
                      ),
                      /*FutureBuilder<Map<String, dynamic>>(
                          future: showBalanceResponse,
                          builder: (BuildContext context,
                              AsyncSnapshot<Map<String, dynamic>> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                              case ConnectionState.active:
                                return Text("Getting your name........",
                                    style: GoogleFonts.getFont("Poppins",
                                        color: Color(0xff3598DC),
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenUtil().setSp(16)));
                              case ConnectionState.done:
                                return Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data['_entityName'].toString(),
                                        style: GoogleFonts.getFont("Poppins",
                                            color: Color(0xff3598DC),
                                            fontWeight: FontWeight.w500,
                                            fontSize: ScreenUtil().setSp(16)),
                                      ),
                                    ],
                                  ),
                                );
                            }
                            return null; //unreachable
                          })*/
                      widget.name!=null?Text(
                        widget.name,
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff3598DC),
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(16)),
                      ):InkWell(
                        child: Text(
                          "Having issues finding your name",
                          style: GoogleFonts.getFont("Poppins",
                              color: Color(0xff3598DC),
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(16)),
                        ),
                        onTap: (){
                          _skip();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HomepageMiddlePart(),
                ),
              ],
            )
          ],
        ),
        showOption==true?InkWell(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(70),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenu(),
                  ],
                )
              ],
            ),
          ),
          onTap: (){
            setState(() {
              showOption=false;
            });
          },
        ):SizedBox()
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _skip();

  }

  void persist(String value) {
    setState(() {
      name = value;
    });
  }

  void _skip()async{
    final timer=Timer(Duration(seconds:3 ), ()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString("_entityName")!=null){
        final response = await getIt<AppModel>().userInfo((){
          setState(() {
            name=prefs.getString("_entityName");
          });
        },(){
          setState(() {
            name="Error occured";
          });
        });
      }

    });
  }


}
