import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/widgets/MainButton.dart';
import 'package:miliki_app/Sections/SupportEntryForm.dart';

class SupportPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SupportPageState();
  }
}

class _SupportPageState extends State<SupportPage> {
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            backgroundColor: Color(0xffCCCCCC),
            leading: InkWell(
              child: Icon(
                Icons.keyboard_backspace,
                color: Color(0xff3598DC),
              ),
              onTap: () {
                if (isVisible == false) {
                  Navigator.pop(context);
                } else {
                  setState(() {
                    isVisible = false;
                  });
                }
              },
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        "Support",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff3598DC),
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(220),
                  )
                ],
              ),
            ],
            // ...
          )),
      body: isVisible == false
          ? SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: ScreenUtil().setHeight(36),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.help_outline,
                size: 121,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hi, there!",
                  style: GoogleFonts.getFont("Poppins",
                      color: Color(0xff333333),
                      fontSize: ScreenUtil().setSp(15)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "Welcome to our online support center. How do you want our team to help you?",
                    style: GoogleFonts.getFont("Poppins",
                        color: Color(0xff333333),
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                  width: ScreenUtil().setWidth(300),
                ),
              )
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(45),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Kindly Call us on:",
                  style: GoogleFonts.getFont("Poppins",
                      color: Color(0xff333333),
                      fontSize: ScreenUtil().setSp(15)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone,
                color: Color(0xff3598DC),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "+254 7000 222 222",
                  style: GoogleFonts.getFont("Poppins",
                      color: Color(0xff333333),
                      fontSize: ScreenUtil().setSp(15)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone,
                color: Color(0xff3598DC),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "+254 7000 222 222",
                  style: GoogleFonts.getFont("Poppins",
                      color: Color(0xff333333),
                      fontSize: ScreenUtil().setSp(15)),
                ),
              )
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(67),
          ),
          MainButton(
              text: "Leave a Message",
              onTap: () async {
                setState(() {
                  isVisible = true;
                });
              },
              color: Color(0xff333333),
              width: 300,
              textColor: Color(0xff333333)),
        ]),
      )
          : SupportEntryForm(),
    );
  }
}
