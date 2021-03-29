import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:miliki_app/Widgets/MainButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../main.dart';
import 'dart:async';
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  var _currentView = false;

  var _passwordVisible = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String isNotLogin = "true";

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
      key: _scaffoldKey,
      backgroundColor: Color(0xff242424),
      body: ModalProgressHUD(
          inAsyncCall: _currentView,
          child: SingleChildScrollView(
            child: Container(
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
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: ScreenUtil().setWidth(30),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/", (route) => false);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(
                      118,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(29),
                      ),
                      Text(
                        "Login to",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xffFFFFFF),
                            fontSize: ScreenUtil().setSp(21)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: ScreenUtil().setWidth(21),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "LRA Technician Application",
                          style: GoogleFonts.getFont("Poppins",
                              color: Color(0xffFFFFFF),
                              fontSize: ScreenUtil().setSp(14)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(
                      20,
                    ),
                  ),
                  FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 10.0, top: 5.0),
                                child: FormBuilderTextField(
                                  attribute: "username",
                                  style: GoogleFonts.getFont("Poppins",
                                      color: Color(0xffFFFFFF),
                                      fontSize: ScreenUtil().setSp(14)),
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "joe@gmail.com",
                                      hintStyle: GoogleFonts.getFont("Poppins",
                                          color: Color(0xffFFFFFF),
                                          fontSize: ScreenUtil().setSp(14))),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff5B5B5B),
                              ),
                              width: ScreenUtil().setWidth(327),
                              height: ScreenUtil().setHeight(55),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 10.0, top: 5.0),
                                child: FormBuilderTextField(
                                  attribute: "password",
                                  obscureText: _passwordVisible,
                                  style: GoogleFonts.getFont("Poppins",
                                      color: Color(0xffFFFFFF),
                                      fontSize: ScreenUtil().setSp(14)),
                                  validators: [
                                    FormBuilderValidators.required()
                                  ],
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      suffixIcon: _passwordVisible == true?InkWell(
                                        child: Icon(
                                          Icons.visibility,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          if (_passwordVisible == true) {
                                            setState(() {
                                              _passwordVisible = false;
                                            });
                                          } else {
                                            setState(() {
                                              _passwordVisible = true;
                                            });
                                          }
                                        },
                                      ):InkWell(
                                        child: Icon(
                                          Icons.visibility_off,
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          if (_passwordVisible == true) {
                                            setState(() {
                                              _passwordVisible = false;
                                            });
                                          } else {
                                            setState(() {
                                              _passwordVisible = true;
                                            });
                                          }
                                        },
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: GoogleFonts.getFont("Poppins",
                                          color: Color(0xffFFFFFF),
                                          fontSize: ScreenUtil().setSp(14))),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff5B5B5B),
                              ),
                              width: ScreenUtil().setWidth(327),
                              height: ScreenUtil().setHeight(55),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: ScreenUtil().setHeight(
                      20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: MainButton(
                              text: "Login",
                              onTap: () async {
                                if (_formKey.currentState.saveAndValidate()) {
                                  setState(() {
                                    _currentView = true;
                                  });
                                  final response = await getIt<AppModel>()
                                      .loginUser(
                                      _formKey
                                          .currentState.value["username"],
                                      _formKey.currentState
                                          .value["password"], () {
                                    setState(() {
                                      _currentView = false;
                                      isNotLogin = "false";
                                    });
                                    Navigator.pushNamed(context, "/OtpPage");
                                  }, () {
                                    setState(() {
                                      _currentView = false;
                                      isNotLogin = "false";
                                      errorState=true;

                                    });
                                    _skip();
                                  },(){
                                    setState(() {
                                      _currentView = false;
                                      isNotLogin = "false";
                                      errorState=true;

                                    });
                                    _skip();
                                  },(){
                                    setState(() {
                                      _currentView = false;
                                      isNotLogin = "false";
                                      errorState=true;
                                    });
                                    _skip();
                                  });
                                  setState(() {
                                    errorValue=response["message"];
                                  });
                                }
                              },
                              color: Color(0xffDA0000),
                              width: 170,
                              textColor: Colors.white),
                        ),
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Color(0xffDA0000), // red as border color
                              ),
                            ),
                            height: ScreenUtil().setHeight(50),
                          ),
                        ),
                        onTap: () async {
                          Navigator.pushNamed(context, '/ForgotPassword');
                        },
                      ),
                    ],
                  ),

                ],
              ),
              color: Color(0xff242424),
              height: MediaQuery.of(context).size.height,
            ),
          )),
      bottomNavigationBar: errorState==true?Container(
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
    );
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                ))
          ],
        ));
  }

  void _skip()async{
    final timer=Timer(Duration(seconds:5 ), ()async{
      setState(() {
        errorState=false;
      });
    });
  }
}
