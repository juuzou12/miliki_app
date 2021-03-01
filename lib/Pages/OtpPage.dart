import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:miliki_app/Widgets/MainButton.dart';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:async';

class OtpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _OtpPageState();
  }

}

class _OtpPageState extends State<OtpPage> {
  final pinLength = 4;
  String currentPIN = "";
  var _currentView = false;

  String errorValue;

  var errorState=false;
  @override
  Widget build(BuildContext context) {
    /**this is the screenUtil lines that handle the screen ratios*/

    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 360, height: 750);
    return Scaffold(
      backgroundColor: Color(0xff242424),
      bottomNavigationBar:  errorState==true?Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorValue,
                    style: GoogleFonts.getFont("Poppins",
                        color: Color(0xffFFFFFF),
                        fontSize: ScreenUtil().setSp(12)),
                  ),
                ),
                width: ScreenUtil().setWidth(330),
              ),
            )
          ],
        ),
        width: MediaQuery.of(context).size.width,
        color: Color(0xff00215E),
      ):Row(),
      body: ModalProgressHUD(
        inAsyncCall: _currentView,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.close,
                        color: Colors.white,
                        size: ScreenUtil().setWidth(30),),
                    ),
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context, "/LoginPage", (route) => false);
                    },
                  )
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(60,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(29),
                  ),
                  Text("Enter OTP",style:GoogleFonts.getFont("Poppins",
                      color: Color(0xffFFFFFF),
                      fontSize: ScreenUtil().setSp(21)),)
                ],),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(21),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Your OTP will expire in one Minute(1 min)",style:GoogleFonts.getFont("Poppins",
                        color: Color(0xffFFFFFF),
                        fontSize: ScreenUtil().setSp(14)),),
                  ),

                ],),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(37), bottom: ScreenUtil().setHeight(37),left: ScreenUtil().setWidth(37),right: ScreenUtil().setWidth(37)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(pinLength, (index) => Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:15.0, right: 13.0),
                        child: Container(
                          height: ScreenUtil().setHeight(29),
                          width: ScreenUtil().setHeight(39),
                          child: Center(
                            child: currentPIN.length > index ?Text(currentPIN[index]
                              ,style: GoogleFonts.getFont("Poppins",
                                  color: Color(0xff3598DC),
                                  fontWeight: FontWeight.w600,
                                  fontSize: ScreenUtil().setSp(22)),):Text(""
                              ,style: GoogleFonts.getFont("Poppins",
                                  color: Color(0xff3598DC),
                                  fontSize: ScreenUtil().setSp(22)),),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                //                    <--- top side
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                children: [
                  MainButton(text: "Verify",onTap: ()async{
                    onAccept();

                  },color: Colors.red,width: 300,textColor: Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DigitButton(
                              text: Text("1",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(1);
                              },
                            ),
                            DigitButton(
                              text: Text("2",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(2);
                              },
                            ),
                            DigitButton(
                              text: Text("3",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(3);
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DigitButton(
                              text: Text("4",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(4);
                              },
                            ),
                            DigitButton(
                              text: Text("5",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(5);
                              },
                            ),
                            DigitButton(
                              text: Text("6",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(6);
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DigitButton(
                              text: Text("7",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(7);
                              },
                            ),
                            DigitButton(
                              text: Text("8",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(8);
                              },
                            ),
                            DigitButton(
                              text: Text("9",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(9);
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DigitButton(
                              text: Text(""),
                              onTap: (){

                              },
                            ),
                            DigitButton(
                              text: Text("0",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontSize: ScreenUtil().setSp(19)),),
                              onTap: (){
                                onPressNumber(0);
                              },
                            ),
                            DigitButton(
                              text: Icon(Icons.close,color: Colors.white,),
                              onTap: (){
                                onBackSpace();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    width: ScreenUtil().setWidth(295),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(
                  3,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  void onPressNumber(int i) {
    if(currentPIN.length >= pinLength)
      return;
    setState(() {
      currentPIN = "$currentPIN$i";
    });

  }

  void onAccept() async{
    if(currentPIN!=null){
      if(currentPIN.length==4){
        setState(() {
          _currentView=true;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final response = await getIt<AppModel>().verifyOtp(prefs.getString("correlationId"), currentPIN,(){
          setState(() {
            _currentView=false;
          });
          Navigator.pushNamedAndRemoveUntil(context, "/ChangePassword", (route) => false);
          _skip();
        },(){
          setState(() {
            _currentView=false;
            currentPIN="";
            errorState=true;
            errorValue="Check the OTP you have provided";
          });
          _skip();
        },(){
          setState(() {
            _currentView=false;
            currentPIN="";
            errorState=true;
            errorValue="This is taking longer than usual. Check your connection to the internet";
          });
          _skip();
        },(){
          setState(() {
            _currentView=false;
            currentPIN="";
            errorState=true;
            errorValue="Check the OTP you have provided it is an invalid otp";
          });
          _skip();
        });

      }else{
        _skip();

      }
    }


  }
  void confirmationBox(String title, String message, {then}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
                onPressed: () => Navigator.pop(context),
                child: InkWell(
                  child: Text("OK"),
                  onTap: (){
                    setState(() {
                      currentPIN="";
                    });
                    Navigator.pop(context);
                  },
                ))
          ],
        ));
  }
  void onBackSpace() {
    setState(() {
      currentPIN = currentPIN.substring(0, currentPIN.length- 1);
    });
  }

  void _skip()async{
    final timer=Timer(Duration(seconds:3 ), ()async{
      setState(() {
        errorState=false;
      });
    });
  }
}
class DigitButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onTap;

  const DigitButton({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ScreenUtil().setHeight(83),
        width: ScreenUtil().setWidth(83),
        child: Center(child: text),
      ),
    );
  }
}
