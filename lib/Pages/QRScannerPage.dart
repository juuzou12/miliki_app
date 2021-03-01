import 'dart:typed_data';
import 'package:miliki_app/widgets/MainButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/screenutil.dart';
class QRScannerPage extends StatefulWidget{
  final String SerialNumber,deviceType,Model,simCard,qrCode,Supplier,Manufacture;

  const QRScannerPage({Key key, this.SerialNumber, this.deviceType, this.Model, this.simCard, this.qrCode, this.Supplier, this.Manufacture}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
   return _QRScannerPagetate();
  }

}

class _QRScannerPagetate extends State<QRScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize
        (
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            backgroundColor: Color(0xffCCCCCC),
            actions: <Widget>[
            ],
            // ...
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Device Details",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff00215E),
                            fontSize: ScreenUtil().setSp(21)),),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Serial Number:",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.SerialNumber,
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff707070),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Device Type:",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.deviceType,
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff707070),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Model:",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.Model,
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff707070),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("SIM Card:",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.simCard,
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff707070),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("QR Code:",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.qrCode,
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff707070),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Supplier:",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.Supplier,
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff707070),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Manufacture:",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff000000),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.Manufacture,
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff707070),
                            fontSize: ScreenUtil().setSp(14)),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainButton(text: 'Ok',width: 171,
                    color: Colors.red,textColor: Colors.white,
                  onTap: (){

                  },),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}