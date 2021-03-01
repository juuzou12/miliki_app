import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class VerificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VerificationPageState();
  }

}

class _VerificationPageState extends State<VerificationPage> {
  String title;
  @override
  Widget build(BuildContext context) {
    /**this is the screenUtil lines that handle the screen ratios*/

    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 360, height: 750);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                child: Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    color: Colors.grey.shade400),
                              ]
                          ),
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(50),
                          child: Icon(Icons.verified_user,
                            color: Color(0xff00225D),
                            size: 25,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      color: Colors.grey.shade400),
                                ]
                            ),
                            width: ScreenUtil().setWidth(250),
                            height: ScreenUtil().setHeight(50),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("PIN",style: TextStyle(
                                    color: Color(0xff00225D),
                                  ),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],),
                    Row(
                      children: [
                        SizedBox(width: 35,),
                        Container(
                          width: ScreenUtil().setWidth(2),
                          height: ScreenUtil().setHeight(40),
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
                onTap: (){
                  setState(() {
                    title="PIN";
                  });
                  confirmationBox("Verifying "+ title, "message");
                },
              ),
              InkWell(
                child: Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    color: Colors.grey.shade400),
                              ]
                          ),
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(50),
                          child: Icon(Icons.verified_user,
                            color: Color(0xff00225D),
                            size: 25,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      color: Colors.grey.shade400),
                                ]
                            ),
                            width: ScreenUtil().setWidth(250),
                            height: ScreenUtil().setHeight(50),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("VRN",style: TextStyle(
                                    color: Color(0xff00225D),
                                  ),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],),
                    Row(
                      children: [
                        SizedBox(width: 35,),
                        Container(
                          width: ScreenUtil().setWidth(2),
                          height: ScreenUtil().setHeight(40),
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
                onTap: (){
                  setState(() {
                    title="VRN";
                  });
                  confirmationBox("Verifying "+ title, "message");
                },
              ),
              InkWell(
                child: Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    color: Colors.grey.shade400),
                              ]
                          ),
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(50),
                          child: Icon(Icons.verified_user,
                            color: Color(0xff00225D),
                            size: 25,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      color: Colors.grey.shade400),
                                ]
                            ),
                            width: ScreenUtil().setWidth(250),
                            height: ScreenUtil().setHeight(50),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("EFD Serial",style: TextStyle(
                                    color: Color(0xff00225D),
                                  ),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],),
                    Row(
                      children: [
                        SizedBox(width: 35,),
                        Container(
                          width: ScreenUtil().setWidth(2),
                          height: ScreenUtil().setHeight(40),
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
                onTap: (){
                  setState(() {
                    title="EFD Serial";
                  });
                  confirmationBox("Verifying "+ title, "message");
                },
              ),
              InkWell(
                child: Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    color: Colors.grey.shade400),
                              ]
                          ),
                          width: ScreenUtil().setWidth(50),
                          height: ScreenUtil().setHeight(50),
                          child: Icon(Icons.verified_user,
                            color: Color(0xff00225D),
                            size: 25,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      color: Colors.grey.shade400),
                                ]
                            ),
                            width: ScreenUtil().setWidth(250),
                            height: ScreenUtil().setHeight(50),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("EFD Receipts",style: TextStyle(
                                    color: Color(0xff00225D),
                                  ),),
                                ],
                              ),
                            )
                        ),
                      ),
                    ],),
                    Row(
                      children: [
                        SizedBox(width: 35,),
                        Container(
                          width: ScreenUtil().setWidth(2),
                          height: ScreenUtil().setHeight(40),
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
                onTap: (){
                  setState(() {
                    title="EFD Receipt";
                  });
                  confirmationBox("Verifying "+ title, "message");
                },
              ),

            ],
          ),
        ),
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.red,
            actions: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Verification",
                      style: TextStyle(
                          color: Color(0xff00225D),
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ],
            // ...
          )),
    );
  }

  void confirmationBox(String title, String message,) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            children: [
              Icon(Icons.verified_user,
                color: Color(0xff00225D),),
              Text(title,style: TextStyle(
                color: Color(0xff00225D),
              ),),
            ],
          ),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(child: title=="Verifying EFD Receipt"?Text("User the numbers after the slash (/) from a receipt number section on the receipt. E.g 0023/1300, enter the 21300 as your receipt number",
                    style: TextStyle(
                        color: Color(0xff00225D)
                    ),):Text("Provide a valid input, the LRA system does not accept alphabetic letters or special charaters",
                    style: TextStyle(
                        color: Color(0xff00225D)
                    ),),
                    width: ScreenUtil().setWidth(234),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    FormBuilder(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FormBuilderTextField(
                                      attribute: "repassword",
                                      validators: [
                                        FormBuilderValidators.required()
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: title,
                                          hintStyle: TextStyle(
                                              color: Color(0xff00225F)
                                          )),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff00225D).withOpacity(0.4),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                            color: Colors.grey.shade200),
                                      ]
                                  ),
                                  width: ScreenUtil().setWidth(234)
                              ),
                            ),
                            title=="Verifying EFD Receipt"?Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FormBuilderTextField(
                                      attribute: "repassword",
                                      validators: [
                                        FormBuilderValidators.required()
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: title,
                                          hintStyle: TextStyle(
                                              color: Color(0xff00225F)
                                          )),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff00225D).withOpacity(0.4),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                            color: Colors.grey.shade200),
                                      ]
                                  ),
                                  width: ScreenUtil().setWidth(234)
                              ),
                            ):SizedBox(),

                          ],
                        )),
                  ),
                ],
              ),
            ),
            height: ScreenUtil().setHeight(170),
          ),
          actions: [
            FlatButton(
                onPressed: () => Navigator.pop(context),
                child: InkWell(
                  child: Text("Scan QR",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),),
                  onTap: (){
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/home", (route) => false);
                  },
                )),
            FlatButton(
                onPressed: () => Navigator.pop(context),
                child: InkWell(
                  child: Text("Verify",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),),
                  onTap: (){

                  },
                )),
          ],
        ));
  }

}