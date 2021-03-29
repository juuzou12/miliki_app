import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/widgets/MainButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Dashboard.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SuccesfullPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SuccesfullPageState();
  }

}

class _SuccesfullPageState extends State<SuccesfullPage> {
  var _currentView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _currentView,
        child: Column(
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
                color: Colors.green,
                size: ScreenUtil().setWidth(100),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Successful",style:GoogleFonts.getFont("Poppins",
                  color: Color(0xff333333),
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
                child: Text("Your issue has been successfully received by our team. We will get back to you within 24 hours via your email.",
                  textAlign: TextAlign.center,style:GoogleFonts.getFont("Poppins",
                      color: Color(0xff333333),
                      fontSize: ScreenUtil().setSp(14)),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Thank You",style:GoogleFonts.getFont("Poppins",
                  color: Color(0xff333333),
                  fontSize: ScreenUtil().setSp(21)),),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(36,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MainButton(text: "OK",onTap: ()async{
                /*Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                    "/Dashboard",
                        (route) => false);*/
                setState(() {
                  _currentView=true;
                });
                getUserName();
              },color: Colors.red,width: 171,textColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
  void getUserName()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await getIt<AppModel>().userInfo((){
      setState(() {
        _currentView=false;
      });
      Navigator.push<String>(context,
          MaterialPageRoute(builder: (context) => Dashboard(name: prefs.getString("_entityName"),)));
    },(){
    });
  }
}