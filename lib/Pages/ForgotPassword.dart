import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Widgets/MainButton.dart';

class ForgotPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordState();
  }

}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormBuilderState>();
  String isSeen="true";
  String allGood="true";
  @override
  Widget build(BuildContext context) {
    /**this is the screenUtil lines that handle the screen ratios*/

    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 360, height: 750);
    return allGood=="true"?Scaffold(
      backgroundColor:  Color(0xff242424),
      body: isSeen=="true"?SingleChildScrollView(
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
              height: ScreenUtil().setHeight(118,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(29),
                ),
                Text("Forgot Password",style:GoogleFonts.getFont("Poppins",
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
                  child: Text("Enter Email or Phone Number",style:GoogleFonts.getFont("Poppins",
                      color: Color(0xffFFFFFF),
                      fontSize: ScreenUtil().setSp(14)),),
                ),

              ],),
            SizedBox(
              height: ScreenUtil().setHeight(36,
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
                          padding: const EdgeInsets.only(left:8.0,top: 5.0),
                          child: FormBuilderTextField(
                            attribute: "username",
                            style:  GoogleFonts.getFont("Poppins",
                                color: Color(0xffFFFFFF),
                                fontSize: ScreenUtil().setSp(14)),
                            validators: [
                              FormBuilderValidators.required()
                            ],
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "joe@gmail.com or +254 7889 000 000",
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
              child: MainButton(text: "Verify User",onTap: (){
                setState(() {
                  isSeen="false";
                });
              },color: Colors.red,width: 327,textColor: Colors.white),
            ),
          ],
        ),
      )
          :SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isSeen=="true"?InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close,
                      color: Colors.white,
                      size: ScreenUtil().setWidth(30),),
                  ),
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, "/LoginPage", (route) => false);
                  },
                ):InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close,
                      color: Colors.white,
                      size: ScreenUtil().setWidth(30),),
                  ),
                  onTap: (){
                    setState(() {
                      isSeen="true";
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(118,
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
                            decoration: InputDecoration(
                                border: InputBorder.none,
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
                            decoration: InputDecoration(
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
                            style:  GoogleFonts.getFont("Poppins",
                                color: Color(0xffFFFFFF),
                                fontSize: ScreenUtil().setSp(14)),
                            validators: [
                              FormBuilderValidators.required()
                            ],
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
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
                setState(() {
                  allGood="false";
                });
              },color: Colors.red,width: 327,textColor: Colors.white),
            ),
          ],
        ),
      ),
    ):
    Scaffold(
      backgroundColor:  Color(0xff242424),
      body: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          Row (
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(118,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.check_circle_outline,
              color: Colors.white,
              size: ScreenUtil().setWidth(100),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Successful",style:GoogleFonts.getFont("Poppins",
                color: Color(0xffFFFFFF),
                fontSize: ScreenUtil().setSp(21)),),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: ScreenUtil().setWidth(292),
              child: Text("Your password has been successfully changed.",
                textAlign: TextAlign.center,style:GoogleFonts.getFont("Poppins",
                    color: Color(0xffFFFFFF),
                    fontSize: ScreenUtil().setSp(14)),),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(36,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MainButton(text: "Ok",onTap: (){
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(
                  "/LoginPage",
                      (route) => false);
            },color: Colors.red,width: 171,textColor: Colors.white),
          ),
        ],
      ),
    );
  }
}