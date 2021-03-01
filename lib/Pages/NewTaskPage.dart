import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/screenutil.dart';

class NewTaskPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NewTaskPageState();
  }

}

class _NewTaskPageState extends State<NewTaskPage> {
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
                Navigator.pop(context);
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
                        "New Tasks",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff3598DC),
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(130),
                  )
                ],
              ),
            ],
            // ...
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().setHeight(273),),
            Row(
              mainAxisAlignment:MainAxisAlignment.center ,
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
                            child: Text("Taxpayer Onboarding",
                              textAlign:TextAlign.center,
                              style: GoogleFonts.getFont("Poppins",
                                  color: Color(0xff333333),
                                  fontSize: ScreenUtil().setSp(14)),),
                          ),
                            width: ScreenUtil().setWidth(150),),
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
                    Navigator.pushNamed(context, "/TaxpayerOnboarding");
                  },
                ),
                InkWell(
                  child: Container(
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
                            child: Text("Device Inspection",
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
                  onTap: (){
                    Navigator.pushNamed(context, "/DeviceInspection");
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start ,
                children: [
                  SizedBox(width: ScreenUtil().setWidth(31),),
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
                            child: Text("Repair at site",
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

                        right: BorderSide(
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
            ),
          ],
        ),
      ),
    );
  }
}