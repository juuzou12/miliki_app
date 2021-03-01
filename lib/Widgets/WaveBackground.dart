import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:miliki_app/Pages/QRScannerPage.dart';
import 'package:qrscan/qrscan.dart' as scanner;
class WaveBackground extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WaveBackgroundState();
  }
}

class _WaveBackgroundState extends State<WaveBackground> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: RotatedBox(
        quarterTurns: -90,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: ScreenUtil().setHeight(170),
          color: Color(0xffF1F5F8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: ScreenUtil().setHeight(30),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors
                                    .grey.shade200),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.help_outline,color: Color(0xff3598DC),),
                              Text("Support",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xff00215E),                                  fontSize: ScreenUtil().setSp(12)),),
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "/SupportPage");
                      },
                    ),
                    InkWell(
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors
                                    .grey.shade200),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.scanner,color: Color(0xff3598DC),),
                              Text("Scan",
                                style: GoogleFonts.getFont("Poppins",
                                    color: Color(0xff00215E),
                                    fontSize: ScreenUtil().setSp(12)),),
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        _ShowBottomSheet();
                      },
                    ),
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              color: Colors
                                  .grey.shade200),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.show_chart,color: Color(0xff3598DC),),
                            Text("Reports",
                              style: GoogleFonts.getFont("Poppins",
                                  color: Color(0xff00215E),
                                  fontSize: ScreenUtil().setSp(12)),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      Navigator.push<String>(context,
          MaterialPageRoute(builder: (context) => QRScannerPage()));
    }
  }
  void _ShowBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Color(0xff4D4D4D).withOpacity(0.9),
        context: context,
        builder: (context) =>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/Images/scan_whie.png",
                            height: ScreenUtil().setHeight(20),
                            width: ScreenUtil().setWidth(20),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15000),
                            color: Color(0xff3598DC)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Scan Certificate",
                            style: GoogleFonts.getFont(
                              "Poppins",
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(14),
                            )),
                      )
                    ],
                  ),
                ),
                onTap: _scan,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/Images/scan_whie.png",
                            height: ScreenUtil().setHeight(20),
                            width: ScreenUtil().setWidth(20),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15000),
                            color: Color(0xff3598DC)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Scan Device",
                            style: GoogleFonts.getFont(
                              "Poppins",
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(14),
                            )),
                      )
                    ],
                  ),
                ),
                onTap: _scan,
              ),

              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/Images/scan_whie.png",
                            height: ScreenUtil().setHeight(20),
                            width: ScreenUtil().setWidth(20),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15000),
                            color: Color(0xff3598DC)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Scan Receipt",
                            style: GoogleFonts.getFont(
                              "Poppins",
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(14),
                            )),
                      )
                    ],
                  ),
                ),
                onTap: _scan,
              ),
              SizedBox(height: ScreenUtil().setHeight(50),),

            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                  topRight:  Radius.circular(20))
          ),
        ));
  }
}
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height -40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}