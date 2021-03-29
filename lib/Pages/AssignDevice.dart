import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:miliki_app/widgets/MainButton.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:miliki_app/pages/SuccesfullPage.dart';
import '../main.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignDevice extends StatefulWidget{
  final String taxpayerId,TaxpayerName,vatNo,tin,phone,email,physicalAddress,location,taxRegion,serialNo,simCard;

  const AssignDevice({Key key, this.taxpayerId, this.TaxpayerName,
    this.vatNo, this.tin, this.phone, this.email,
    this.physicalAddress, this.location, this.taxRegion, this.serialNo, this.simCard,}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AssignDeviceState();
  }

}

class _AssignDeviceState extends State<AssignDevice> {
  final _formKey = GlobalKey<FormBuilderState>();
  var value=false;
  var contact=false;
  var _currentView = true;
  List<dynamic> dataFromServer = [];
  String errorValue;
  String answer;
  var currentFocus;
  var errorState=false;
  final availableServices = [
    {"mnoType": "Grand Cape Mount","value":"096c60bf-39a1-5d2e-a292-38051290fae2"},
    {"mnoType": "Monrovia","value":"98157393-f722-1a3b-a39a-554b04fa6e0e"},
    {"mnoType": "Grand Bassa","value":"0522dd31-cec5-b349-8626-7b5a770602fb"},
  ];

  var dialogBox=false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _currentView,
      child: Scaffold(
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
        appBar: PreferredSize
          (
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              backgroundColor: Color(0xffCCCCCC),
              leading: InkWell(
                child: Icon(
                  Icons.keyboard_backspace,
                  color: Color(0xff3598DC),
                ),
                onTap: () {
                  if(contact==false){
                    Navigator.pop(context);
                  }else{
                    setState(() {
                      contact=false;
                    });
                  }

                },
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    contact==false?Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "Assign Device",
                          style: GoogleFonts.getFont("Poppins",
                              color: Color(0xff3598DC),
                              fontSize: ScreenUtil().setSp(15)),
                        ),
                      ),
                    ):Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          "Add Contact person",
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
        body:  contact==false?SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(30),
                  ),
                  Text("Device Serial Number",
                      style: GoogleFonts.getFont("Poppins",
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(14))),
                ],
              ),
              FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(30),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 5.0),
                                  child: FormBuilderTextField(
                                    attribute: "devices_serial",
                                    style: GoogleFonts.getFont("Poppins",
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(14)),

                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "6589869586",
                                        hintStyle: GoogleFonts.getFont(
                                            "Poppins",
                                            color: Color(0xff707070),
                                            fontSize:
                                            ScreenUtil().setSp(14))),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6),),
                                  border: Border.all(
                                    color: Colors.grey, // red as border color
                                  ),
                                ),
                                width: ScreenUtil().setWidth(217),
                                height: ScreenUtil().setHeight(55),
                              ),
                              InkWell(
                                child: Container(
                                  width: ScreenUtil().setWidth(83),
                                  height: ScreenUtil().setHeight(55),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  decoration:
                                  BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight: Radius.circular(6),),
                                      color: Color(0xff3598DC)),
                                ),
                                onTap: ()async{
                                  if(_formKey.currentState.saveAndValidate()){

                                    setState(() {
                                      _currentView=true;
                                    });

                                    final response = await getIt<AppModel>().getDeviceSerialNo(_formKey.currentState.value['devices_serial'],(){
                                      setState(() {
                                        _currentView=false;
                                      });
                                    }, (){
                                      setState(() {
                                        _currentView=false;
                                      });
                                      Fluttertoast.showToast(
                                          msg: "A valid Device Serial Number",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.SNACKBAR,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    },"serialNumber",(){
                                      Fluttertoast.showToast(
                                          msg: "Device is already exists",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.SNACKBAR,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    });

                                  }
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(30),
                          ),
                          Text("Sim Card",
                              style: GoogleFonts.getFont("Poppins",
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(14))),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 5.0),
                                      child: FormBuilderTextField(
                                        attribute: "sim_card",
                                        style: GoogleFonts.getFont("Poppins",
                                            color: Colors.black,
                                            fontSize: ScreenUtil().setSp(14)),

                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "6589869586",
                                            hintStyle: GoogleFonts.getFont(
                                                "Poppins",
                                                color: Color(0xff707070),
                                                fontSize:
                                                ScreenUtil().setSp(14))),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(6),bottomLeft: Radius.circular(6),),
                                      border: Border.all(
                                        color: Colors.grey, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(217),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: ScreenUtil().setWidth(83),
                                      height: ScreenUtil().setHeight(55),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      decoration:
                                      BoxDecoration(
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight: Radius.circular(6),),
                                          color: Color(0xff3598DC)),
                                    ),
                                    onTap: ()async{
                                      if(_formKey.currentState.saveAndValidate()){
                                        currentFocus = FocusScope.of(context);
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }
                                        setState(() {
                                          _currentView=true;
                                        });

                                        final response = await getIt<AppModel>().getSimCards(_formKey.currentState.value['sim_card'],(){
                                          setState(() {
                                            _currentView=false;
                                          });
                                          _skip();
                                        }, (){
                                          setState(() {
                                            _currentView=false;
                                            errorState=false;
                                          });
                                          _skip();
                                          Fluttertoast.showToast(
                                              msg: "A valid Sim Card Number",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.SNACKBAR,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          prefs.setString('simCardID', null);
                                        },"imsi");
                                      }
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: Text("New Tax Region?",style: GoogleFonts.getFont("Poppins",
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(15)),),
                          activeColor: Color(0xff707070),
                          value: value,
                          onChanged: (newValue) async{
                            setState(() {
                              value=newValue;
                            });

                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ),
                      value==true?Row(
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(30),
                          ),
                          Text("New Tax Region",
                              style: GoogleFonts.getFont("Poppins",
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(14))),
                        ],
                      ):Row(),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Row(
                                children: [
                                  value==true?Container(
                                    child: FormBuilderDropdown(
                                      attribute: "region",
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            const BorderRadius.all(
                                                Radius.circular(6.0))),
                                      ),
                                      // initialValue: 'Male',
                                      hint: Text('Select a region',style: GoogleFonts.getFont("Poppins",
                                          color: Colors.grey,
                                          fontSize: ScreenUtil().setSp(15)),),
                                      validators: [FormBuilderValidators.required()],

                                      items:availableServices
                                          .map((e) => DropdownMenuItem(
                                        value: e['value'],
                                        child: Text(e['mnoType']
                                          ,style: GoogleFonts.getFont("Poppins",
                                              color: Colors.black,
                                              fontSize: ScreenUtil().setSp(15)),),
                                      )).toList(),
                                      onChanged: (_){
                                       setState(() {
                                         answer = _formKey.currentState.value["region"];
                                       });
                                      },
                                    ),
                                    width: ScreenUtil().setWidth(300),

                                  ):Container(),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                        ],
                      ),
                    ],
                  )),
              value==true?SizedBox(
                height: ScreenUtil().setHeight(30),
              ):Row(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MainButton(
                          text: "Proceed",
                          onTap: () async {
                            if(_formKey.currentState.saveAndValidate()){
                              setState(() {
                                contact=true;
                              });
                            }
                          },
                          color: Color(0xffDA0000),
                          width: 300,
                          textColor: Colors.white),
                    ),
                  ],),
              )

            ],
          ),
        ):
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(35),
              ),
              FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                Text("Full Name",
                                    style: GoogleFonts.getFont("Poppins",
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(14))),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),

                                Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 5.0),
                                        child: FormBuilderTextField(
                                          attribute: "fullname",
                                          style: GoogleFonts.getFont("Poppins",
                                              color: Colors.black,
                                              fontSize: ScreenUtil().setSp(14)),
                                          validators: [
                                            FormBuilderValidators.required(errorText: 'This field is required')
                                          ],
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Joe Doe",
                                              hintStyle: GoogleFonts.getFont(
                                                  "Poppins",
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                  ScreenUtil().setSp(14))),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Colors.grey, // red as border color
                                        ),
                                      ),
                                      width: ScreenUtil().setWidth(300),
                                      height: ScreenUtil().setHeight(55),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                Text("Phone Number",
                                    style: GoogleFonts.getFont("Poppins",
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(14))),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),

                                Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 5.0),
                                        child: FormBuilderTextField(
                                          attribute: "phonenumber",
                                          style: GoogleFonts.getFont("Poppins",
                                              color: Colors.black,
                                              fontSize: ScreenUtil().setSp(14)),

                                          keyboardType: TextInputType.phone,
                                          maxLength: 10,
                                          validators: [
                                          FormBuilderValidators.required(errorText: 'This field is required')
                                          ],
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "0700155686",
                                              hintStyle: GoogleFonts.getFont(
                                                  "Poppins",
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                  ScreenUtil().setSp(14))),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),                                   border: Border.all(
                                        color: Colors.grey, // red as border color
                                      ),
                                      ),
                                      width: ScreenUtil().setWidth(300),
                                      height: ScreenUtil().setHeight(55),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),
                                Text("Email Address",
                                    style: GoogleFonts.getFont("Poppins",
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(14))),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: ScreenUtil().setWidth(30),
                                ),

                                Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 5.0),
                                        child: FormBuilderTextField(
                                          attribute: "address",
                                          style: GoogleFonts.getFont("Poppins",
                                              color: Colors.black,
                                              fontSize: ScreenUtil().setSp(14)),
                                          validators: [
                                            FormBuilderValidators.email(errorText: "Invalid email"),
                                            FormBuilderValidators.required(errorText: 'This field is required')
                                          ],
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "joedoe@gmail.com",
                                              hintStyle: GoogleFonts.getFont(
                                                  "Poppins",
                                                  color: Color(0xff707070),
                                                  fontSize:
                                                  ScreenUtil().setSp(14))),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Colors.grey, // red as border color
                                        ),
                                      ),
                                      width: ScreenUtil().setWidth(300),
                                      height: ScreenUtil().setHeight(55),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: ScreenUtil().setHeight(96),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MainButton(
                          text: "Back",
                          onTap: () async {
                            Navigator.pushNamed(context, "/AssignDevice");
                          },
                          color: Color(0xffCACACA),
                          width: 136,
                          textColor: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MainButton(
                          text: "Submit",
                          onTap: () async {
                             /*confirmationBox("","Are you sure you want to submit this taxpayer?");*/
                            if(_formKey.currentState.saveAndValidate()){
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              setState(() {
                                _currentView=true;
                              });
                              final response = await getIt<AppModel>().onboardTaxpayer(widget.taxpayerId,widget.tin,widget.vatNo,
                                  widget.TaxpayerName,widget.phone,widget.email,"website",widget.physicalAddress,
                                  widget.location,widget.taxRegion,'fullname',
                                  'fullname','fullname',prefs.getString("taxRegionID"),
                                      (){
                                    setState(() {
                                      _currentView=false;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SuccesfullPage()));

                                  },(){
                                    setState(() {
                                      _currentView=false;
                                      errorState=true;
                                      errorValue="This is taking longer than usual.Check your internet connection(Timeout error)";
                                    });
                                    _skip();
                                  },(){
                                    setState(() {
                                      _currentView=false;
                                      errorState=true;
                                      errorValue="(Conflict)....Device or Sim card is allocated already";
                                      contact=false;
                                    });
                                    _skip();
                                  });
                            }
                          },
                          color: Color(0xffDA0000),
                          width: 136,
                          textColor: Colors.white),
                    ),
                  ],),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppModel appModel=new AppModel();
    appModel.getTaxRegion((){
      setState(() {
        _currentView=false;
      });
    },(){
      setState(() {
        _currentView=false;
      });
      redo();

    },then: (sampleList){
      print("........."+sampleList);
      setState(() {
        dataFromServer=sampleList;
      });
    });
  }

  void confirmationBox(String title, String message, {then}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.info_outline,
                    color: Colors.red,
                    size: ScreenUtil().setWidth(50),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(child: Text(message,
                    textAlign: TextAlign.center,style:
                    GoogleFonts.getFont("Poppins",
                      color: Colors.black,),),
                    width: ScreenUtil().setWidth(260),),
                ),
              ],
            ),
            height: ScreenUtil().setHeight(200),
          ),
          actions: [
            Row(
              children: [
                MainButton(text: "Cancel",width: 120,color: Color(0xffCACACA),textColor: Color(0xff00215E),onTap: (){
                  Navigator.pop(context);
                },),
                SizedBox(width: ScreenUtil().setWidth(20),),
                MainButton(text: "Submit",width: 120,color: Colors.red,textColor: Colors.white,onTap: ()async{
                  if(_formKey.currentState.saveAndValidate()){
                    setState(() {
                      _currentView=true;
                    });
                    Navigator.pop(context);


                  }
                },),
              ],
            )
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
  void redo()async{
    final timer=Timer(Duration(seconds:3 ), ()async{

      setState(() {
        _currentView=true;
      });

      AppModel appModel=new AppModel();
      appModel.getTaxRegion((){
        setState(() {
          _currentView=false;
        });
      },(){
        setState(() {
          _currentView=false;
        });


      },then: (sampleList){
        print("........."+sampleList);
        setState(() {
          dataFromServer=sampleList;
        });
      });
    });
  }
}