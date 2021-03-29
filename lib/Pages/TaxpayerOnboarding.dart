import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:miliki_app/widgets/MainButton.dart';
import 'dart:async';
import 'package:miliki_app/Pages/AssignDevice.dart';
class TaxpayerOnboarding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaxpayerOnboarding();
  }
}

class _TaxpayerOnboarding extends State<TaxpayerOnboarding> {
  TextEditingController billerController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  var errorState=false;
  String errorValue;
  Map<String, dynamic> currentBiller;
  var _currentView = false;
  String PIN,phone,entityName,Email,physicalAddress,location,taxRegion;

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
                        "Taxpayer Onboarding",
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
        inAsyncCall: _currentView,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(30),
                        ),
                        Text("VAT Number",
                            style: GoogleFonts.getFont("Poppins",
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(14))),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
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
                                          attribute: "VAT",
                                          style: GoogleFonts.getFont("Poppins",
                                              color: Colors.black,
                                              fontSize: ScreenUtil().setSp(14)),
                                          validators: [
                                            FormBuilderValidators.required()
                                          ],
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
                                          final response = await getIt<AppModel>().getServiceDetails(
                                              _formKey.currentState.value["VAT"],
                                                  (){
                                                setState(() {
                                                  _currentView=false;
                                                  errorState=true;
                                                  PIN="";
                                                  phone="";
                                                  entityName="";
                                                  Email="";
                                                  physicalAddress="";
                                                  location="";
                                                  taxRegion="";
                                                  errorValue='Check the VAT Number and try again';
                                                });
                                                _skip();
                                              }, ()async{
                                            SharedPreferences prefs = await SharedPreferences.getInstance();

                                            setState(() {
                                              PIN=prefs.getString("PIN");
                                              phone=prefs.getString("phone");
                                              entityName=prefs.getString("entityName");
                                              Email=prefs.getString("Email");
                                              physicalAddress=prefs.getString("physicalAddress");
                                              location=prefs.getString("location");
                                              taxRegion=prefs.getString("taxRegion");
                                              errorState=true;
                                              _currentView=false;
                                            });
                                            _skip();
                                          });
                                          if(response!=null){
                                            setState(() {
                                              errorValue=response['message'];
                                            });
                                            _skip();
                                          }
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
                        )),
                    entityName!=null?Container(
                      child: Column(
                        children: [
                          /*Pin number*/
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("PIN Number",
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
                                      child:Text(PIN,
                                        style: GoogleFonts.getFont("Poppins",
                                            color: Colors.black,
                                            fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*taxpayer name*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Taxpayer Name",
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
                                      child:Text(entityName,style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*phone number*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
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
                                      child:Text(phone,style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*Email*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Email",
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
                                      child:Text(Email,style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*physical address*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Physical address",
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
                                      child:Text(physicalAddress,style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      color: Colors.grey.shade300,
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*location address*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Location",
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
                                      child:Text(location,style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*tax region*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Tax Region",
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
                                      child:Text(taxRegion,style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ):Container(
                      child: Column(
                        children: [
                          /*Pin number*/
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("PIN Number",
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
                                      child:Text("",
                                        style: GoogleFonts.getFont("Poppins",
                                            color: Colors.black,
                                            fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*taxpayer name*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Taxpayer Name",
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
                                      child:Text("",style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*phone number*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
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
                                      child:Text("",style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*Email*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Email",
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
                                      child:Text("",style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*physical address*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Physical address",
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
                                      child:Text("",style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      color: Colors.grey.shade300,
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*location address*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Location",
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
                                      child:Text("",style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          /*tax region*/
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(30),
                              ),
                              Text("Tax Region",
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
                                      child:Text("",style: GoogleFonts.getFont("Poppins",
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(14)),),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                      border: Border.all(
                                        color: Colors.grey.shade300, // red as border color
                                      ),
                                    ),
                                    width: ScreenUtil().setWidth(300),
                                    height: ScreenUtil().setHeight(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(
                        20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MainButton(
                          text: "Proceed",
                          onTap: () async {
                            if(_formKey.currentState.saveAndValidate()){
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>AssignDevice(taxpayerId: prefs.getString("id"),
                                        TaxpayerName: prefs.getString("entityName"),tin: prefs.getString("PIN"),
                                        vatNo: prefs.getString("PIN"),email: prefs.getString("Email"),
                                        phone: prefs.getString("phone"),physicalAddress: prefs.getString("physicalAddress"),
                                        location:prefs.getString("location"),taxRegion:prefs.getString("taxRegionID"),serialNo: prefs.getString("simCardNo"),
                                        simCard: prefs.getString("devicesSerialNumber"),)));
                            }
                          },
                          color: Color(0xffDA0000),
                          width: 300,
                          textColor: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
    );
  }
  void _skip()async{
    final timer=Timer(Duration(seconds:5 ), ()async{
      setState(() {
        errorState=false;
      });
    });
  }
}

