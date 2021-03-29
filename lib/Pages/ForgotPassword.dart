import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Widgets/MainButton.dart';
import '../main.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miliki_app/Pages/LoginPage.dart';
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
  var _currentView = false;
  @override
  Widget build(BuildContext context) {
    /**this is the screenUtil lines that handle the screen ratios*/

    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 360, height: 750);
    return Scaffold(
      backgroundColor:  Color(0xff242424),
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
                      Navigator.pop(context);
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
                    child: Text("Enter your email",style:GoogleFonts.getFont("Poppins",
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
                                  hintText: "joe@example.com",
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
                child: MainButton(text: "Verify User",onTap: ()async{
                  if(_formKey.currentState.saveAndValidate()){
                    setState(() {
                      _currentView=true;
                    });
                    final response = await getIt<AppModel>()
                        .ForgotPassword(_formKey.currentState.value['username'], (){
                          setState(() {
                            _currentView=false;
                          });
                          Fluttertoast.showToast(
                              msg: "An email with new password has been sent.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              LoginPage()), (Route<dynamic> route) => false);
                        }, (){
                      setState(() {
                        _currentView=false;
                      });
                      Fluttertoast.showToast(
                          msg: "Unable to send your email.Try again later (Timeout)",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                        },(){
                      Fluttertoast.showToast(
                          msg: "Can't send your email at the moment(404 error)",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      setState(() {
                        _currentView=false;
                      });
                    });
                  }
                },color: Colors.red,width: 327,textColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}