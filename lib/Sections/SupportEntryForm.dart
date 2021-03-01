import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/widgets/MainButton.dart';

class SupportEntryForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SupportEntryFormState();
  }

}

class _SupportEntryFormState extends State<SupportEntryForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(51),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Kindly Share your problem",
                  style: GoogleFonts.getFont("Poppins",
                      color: Color(0xff00215E),
                      fontSize: ScreenUtil().setSp(21)),
                ),
              ),

            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding:  EdgeInsets.only(top:ScreenUtil().setHeight(8)),
                        child: FormBuilderTextField(
                          attribute: "fullname",
                          style: GoogleFonts.getFont("Poppins",
                              color: Color(0xff00215E),
                              fontSize: ScreenUtil().setSp(12)),
                          keyboardType: TextInputType.emailAddress,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.all(
                                    Radius.circular(6.0))),
                            hintText: "Full Name",
                            hintStyle: GoogleFonts.getFont("Poppins",
                                color: Color(0xffAFAFAF),
                                fontSize: ScreenUtil().setSp(12)),
                          ),
                        ),
                      ),
                      width: ScreenUtil().setWidth(300),
                    ),
                    Container(
                      child: Padding(
                        padding:  EdgeInsets.only(top:ScreenUtil().setHeight(8)),
                        child: FormBuilderTextField(
                          attribute: "email",
                          style: GoogleFonts.getFont("Poppins",
                              color: Color(0xff00215E),
                              fontSize: ScreenUtil().setSp(12)),
                          keyboardType: TextInputType.emailAddress,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(errorText: "Provide a valid email")],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.all(
                                    Radius.circular(6.0))),
                            hintText: "joe@gmail.com",
                            hintStyle: GoogleFonts.getFont("Poppins",
                                color: Color(0xffAFAFAF),
                                fontSize: ScreenUtil().setSp(12)),
                          ),
                        ),
                      ),
                      width: ScreenUtil().setWidth(300),
                    ),
                    Container(
                      child: Padding(
                        padding:  EdgeInsets.only(top:ScreenUtil().setHeight(8)),
                        child: FormBuilderTextField(
                          attribute: "about",
                          style: GoogleFonts.getFont("Poppins",
                              color: Color(0xff00215E),
                              fontSize: ScreenUtil().setSp(12)),
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 5,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.all(
                                    Radius.circular(6.0))),
                            hintText: "Kindly describe your problem",
                            hintStyle: GoogleFonts.getFont("Poppins",
                                color: Color(0xffAFAFAF),
                                fontSize: ScreenUtil().setSp(12)),
                          ),
                        ),
                      ),
                      width: ScreenUtil().setWidth(300),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(76),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: MainButton(
                  text: "Send",
                  onTap: () async {
                    if (_formKey.currentState.saveAndValidate()) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                          "/SuccesfullPage",
                              (route) => false);
                    }
                  },
                  color: Color(0xffDA0000),
                  width: 300,
                  textColor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}