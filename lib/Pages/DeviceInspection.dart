import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Widgets/MainButton.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../main.dart';
import 'package:miliki_app/Pages/Dashboard.dart';
class DeviceInspection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DeviceInspectionState();
  }

}

class _DeviceInspectionState extends State<DeviceInspection> {
  final _formKey = GlobalKey<FormBuilderState>();
  var loadin=false;
  var findTrader =false;
  List<dynamic> availableServices = [];
  List<dynamic> helpType = [];
  List<dynamic> getSubject = [];

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
                        "Device Inspection",
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
      body: ModalProgressHUD(
        inAsyncCall: loadin,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(36),
              ),
              FormBuilder(child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenUtil().setWidth(30),
                            ),
                            Text("Trader Name",
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
                                      attribute: "tradernames",
                                      style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),

                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Joe Doh",
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
                  findTrader==true?Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: ScreenUtil().setWidth(30),
                                  ),
                                  Text("Device serial number",
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
                                        child: FormBuilderDropdown(
                                          attribute: "deviceserialnumber",
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6.0))),
                                          ),
                                          // initialValue: 'Male',
                                          hint: Text('Device serial number',style: GoogleFonts.getFont("Poppins",
                                              color: Colors.grey,
                                              fontSize: ScreenUtil().setSp(15)),),
                                          validators: [FormBuilderValidators.required()],

                                          items:availableServices
                                              .map((e) => DropdownMenuItem(
                                            value: e['id'],
                                            child: Text(e['serialNumber']
                                              ,style: GoogleFonts.getFont("Poppins",
                                                  color: Colors.black,
                                                  fontSize: ScreenUtil().setSp(15)),),
                                          )).toList(),
                                          onChanged: (_){
                                            setState(() {
                                            });
                                          },
                                        ),
                                        width: ScreenUtil().setWidth(300),

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
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: ScreenUtil().setWidth(30),
                                  ),
                                  Text("Select help type",
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
                                        child: FormBuilderDropdown(
                                          attribute: "selecthelp",
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6.0))),
                                          ),
                                          // initialValue: 'Male',
                                          hint: Text('Select help type',style: GoogleFonts.getFont("Poppins",
                                              color: Colors.grey,
                                              fontSize: ScreenUtil().setSp(15)),),
                                          validators: [FormBuilderValidators.required()],

                                          items:helpType
                                              .map((e) => DropdownMenuItem(
                                            value: e['id'],
                                            child: Text(e['_instanceName']
                                              ,style: GoogleFonts.getFont("Poppins",
                                                  color: Colors.black,
                                                  fontSize: ScreenUtil().setSp(15)),),
                                          )).toList(),
                                          onChanged: (_){
                                            setState(() {
                                            });
                                          },
                                        ),
                                        width: ScreenUtil().setWidth(300),

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
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: ScreenUtil().setWidth(30),
                                  ),
                                  Text("Select subject",
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
                                        child: FormBuilderDropdown(
                                          attribute: "subject",
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6.0))),
                                          ),
                                          // initialValue: 'Male',
                                          hint: Text('Select a subject',style: GoogleFonts.getFont("Poppins",
                                              color: Colors.grey,
                                              fontSize: ScreenUtil().setSp(15)),),
                                          validators: [FormBuilderValidators.required()],

                                          items:getSubject
                                              .map((e) => DropdownMenuItem(
                                            value: e['id'],
                                            child: Text(e['_instanceName']
                                              ,style: GoogleFonts.getFont("Poppins",
                                                  color: Colors.black,
                                                  fontSize: ScreenUtil().setSp(15)),),
                                          )).toList(),
                                          onChanged: (_){
                                            setState(() {
                                            });
                                          },
                                        ),
                                        width: ScreenUtil().setWidth(300),

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
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: ScreenUtil().setWidth(30),
                                  ),
                                  Text("Leave a message or comment",
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
                                            attribute: "aabourt",
                                            style: GoogleFonts.getFont("Poppins",
                                                color: Colors.black,
                                                fontSize: ScreenUtil().setSp(14)),
                                            maxLines: 5,
                                            keyboardType: TextInputType.multiline,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "My device losses network connection after an hour",
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
                    ),
                  ):Container(),
                ],
              ),
              key: _formKey,),
              findTrader==true?Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MainButton(
                          text: "Submit",
                          onTap: () async {
                            if(_formKey.currentState.saveAndValidate()){
                              setState(() {
                                loadin=true;
                              });
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              AppModel appModel=AppModel();
                              appModel.DeviceInspection(_formKey.currentState.value['aabourt'],
                                  _formKey.currentState.value['subject'],
                                  prefs.getString('traderID'),
                                  _formKey.currentState.value['deviceserialnumber'],
                                  (){
                                setState(() {
                                  loadin=false;
                                });
                                getUserName();
                                Fluttertoast.showToast(
                                    msg: "Device inspection was successful",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                  },
                                  (){
                                    setState(() {
                                      loadin=false;
                                    });
                                    Fluttertoast.showToast(
                                        msg: "Check the information sent and try again",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  (){
                                    setState(() {
                                      loadin=false;
                                    });
                                    Fluttertoast.showToast(
                                        msg: "A timeout error.Check your internet connection",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  });
                            }

                          },
                          color: Color(0xffDA0000),
                          width: 300,
                          textColor: Colors.white),
                    ),
                  ],),
              ):Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MainButton(
                          text: "Find Trader",
                          onTap: () async {
                            if(_formKey.currentState.saveAndValidate()){
                              setState(() {
                                loadin=true;
                              });
                              AppModel appModel=AppModel();
                              appModel.getTrader(_formKey.currentState.value['tradernames'], (){
                                setState(() {
                                  loadin=false;
                                });
                              }, (){
                                setState(() {
                                  findTrader=true;
                                  loadin=false;
                                  getID();
                                  getHelpType();
                                  getSubCategory();
                                });
                              }, 'name');
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
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

  }

  void getID()async{
    AppModel appModel=AppModel();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appModel.getDeviceFilter(prefs.getString('traderID'), (){

    }, (){

    }, 'property',then: (sampleList){
      print(sampleList);
      setState(() {
        availableServices=sampleList;
      });
    });

  }
  void getHelpType()async{
    AppModel appModel=AppModel();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appModel.getHelpType(() {
      setState(() {
        loadin=false;
      });
    },then: (sampleList){
        print(sampleList);
        setState(() {
          helpType=sampleList;
        });
    });

  }
  void getSubCategory()async{
    AppModel appModel=AppModel();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appModel.getSubject(() {
      setState(() {
        loadin=false;
      });
    },then: (sampleList){
        print(sampleList);
        setState(() {
          getSubject=sampleList;
        });
    });

  }
  void getUserName()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await getIt<AppModel>().userInfo((){
      Navigator.push<String>(context,
          MaterialPageRoute(builder: (context) => Dashboard(name: prefs.getString("_entityName"),)));
    },(){
    });
  }
}