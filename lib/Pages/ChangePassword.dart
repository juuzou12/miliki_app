import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:miliki_app/Widgets/MainButton.dart';
import 'dart:async';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Dashboard.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordState();
  }
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormBuilderState>();
  String errorValue;

  var errorState=false;
  var _currentView = false;
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242424),
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
        height: ScreenUtil().setHeight(50),
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
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: ScreenUtil().setWidth(30),
                      ),
                    ),
                    onTap: () {
                     Navigator.pop(context);
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
                  Text("Change Password",style:GoogleFonts.getFont("Poppins",
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
                    child: Container(
                      child: Text(
                        "Kindly change your password to what you like",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xffFFFFFF),
                            fontSize: ScreenUtil().setSp(14)),
                      ),
                      width: ScreenUtil().setWidth(264),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(16,
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
                            padding: const EdgeInsets.only(left:10.0,top: 5.0),
                            child: FormBuilderTextField(
                              attribute: "old",
                              style:  GoogleFonts.getFont("Poppins",
                                  color: Color(0xffFFFFFF),
                                  fontSize: ScreenUtil().setSp(14)),
                              validators: [
                                FormBuilderValidators.required()
                              ],
                              keyboardType: TextInputType.text,
                                obscureText:obscureText,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: obscureText==true?IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: (){
                                      setState(() {
                                        obscureText=false;
                                      });
                                    },
                                  ):IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: (){
                                      setState(() {
                                        obscureText=true;
                                      });
                                    },
                                  ),
                                  hintText: "Enter Old Password",
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
                            padding: const EdgeInsets.only(left:10.0,top: 5.0),
                            child: FormBuilderTextField(
                              attribute: "new",
                              style:  GoogleFonts.getFont("Poppins",
                                  color: Color(0xffFFFFFF),
                                  fontSize: ScreenUtil().setSp(14)),
                              validators: [
                                FormBuilderValidators.required()
                              ],
                              keyboardType: TextInputType.text,
                                obscureText:obscureText,
                              decoration: InputDecoration(
                                  suffixIcon: obscureText==true?IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: (){
                                      setState(() {
                                        obscureText=false;
                                      });
                                    },
                                  ):IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: (){
                                      setState(() {
                                        obscureText=true;
                                      });
                                    },
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Enter New Password",
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
                            padding: const EdgeInsets.only(left:10.0,top: 5.0),
                            child: FormBuilderTextField(
                              attribute: "confirm",
                              obscureText: obscureText,
                              style:  GoogleFonts.getFont("Poppins",
                                  color: Color(0xffFFFFFF),
                                  fontSize: ScreenUtil().setSp(14)),
                              validators: [
                                FormBuilderValidators.required()
                              ],
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  suffixIcon: obscureText==true?IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: (){
                                      setState(() {
                                        obscureText=false;
                                      });
                                    },
                                  ):IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: (){
                                      setState(() {
                                        obscureText=true;
                                      });
                                    },
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Confirm New Password",
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
                height: ScreenUtil().setHeight(20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainButton(text: "Change",onTap: (){
                  if(_formKey.currentState.saveAndValidate()){
                    if(_formKey.currentState.value['new']==_formKey.currentState.value['confirm']){
                      getUserName();
                    }else{
                      Fluttertoast.showToast(
                          msg: "Make sure both new and confirm password match",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }

                  }

                },color: Colors.red,width: 327,textColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _skip()async{
    final timer=Timer(Duration(seconds:3 ), ()async{
      setState(() {
        errorState=false;
      });
    });
  }

  void getUserName()async{

    setState(() {
      _currentView=true;
    });
    final resp= await getIt<AppModel>().changePassword(_formKey.currentState.value['old'],_formKey.currentState.value['new'],(){
      changePassword();

    },(){
      setState(() {
        _currentView=false;
      });
    },(){
      Fluttertoast.showToast(
          msg: "Try again an error occured (Timeout)",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        _currentView=false;
      });
    },(){
      Fluttertoast.showToast(
          msg: "Wrong Old password, re-check and try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        _currentView=false;
      });
    });

  }
  void changePassword()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await getIt<AppModel>().userInfo((){
      setState(() {
        _currentView=false;
      });
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Dashboard(name: prefs.getString("_entityName"))), (Route<dynamic> route) => false);
    },(){
      setState(() {
        _currentView=false;
      });
      Fluttertoast.showToast(
          msg: "Try again an error occured (Timeout)",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

    });
  }
}
