import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageMiddlePart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomepageMiddlePartState();
  }

}

class _HomepageMiddlePartState extends State<HomepageMiddlePart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.email_outlined,
                            color: Colors.white,
                            size: 30,),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xff3598DC)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("My Inbox",
                            textAlign:TextAlign.center,
                            style: GoogleFonts.getFont("Poppins",
                                color: Color(0xff333333),
                                fontSize: ScreenUtil().setSp(14)),),
                        ),
                          width: ScreenUtil().setWidth(100),),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Color(0xffE4E4E4),
                          width: ScreenUtil().setWidth(2)
                      ),
                    ),
                  ),
                  width: ScreenUtil().setWidth(143),
                ),
                onTap: (){
                  Navigator.pushNamed(context, "/InboxPage");
                },
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.assignment,
                          color: Colors.white,
                          size: 30,),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff4EC499)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("New Task",
                          textAlign:TextAlign.center,
                          style: GoogleFonts.getFont("Poppins",
                              color: Color(0xff333333),
                              fontSize: ScreenUtil().setSp(14)),),
                      ),
                        width: ScreenUtil().setWidth(100),),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      //                    <--- top side
                        color: Color(0xffE4E4E4),
                        width: ScreenUtil().setWidth(2)
                    ),
                    left: BorderSide(
                      //                    <--- top side
                        color: Color(0xffE4E4E4),
                        width: ScreenUtil().setWidth(2)
                    ),
                  ),
                ),
                width: ScreenUtil().setWidth(143),
              ),
            ],
          ),

        ],
      ),
    );
  }
}