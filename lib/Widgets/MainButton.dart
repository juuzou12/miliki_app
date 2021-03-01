import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatelessWidget {

  final String text;
  final onTap;
  final Color color,textColor;
  final int width;

  MainButton({
    Key key,@required this.text, this.onTap, this.color, this.width, this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**this is the screenUtil lines that handle the screen ratios*/

    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 360, height: 750);

    return InkWell(
      onTap: (){
        print("on tap called");
        onTap();
      },
      child: Container(
        child: Text(
            text,
            style: GoogleFonts.getFont("Poppins",
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(17))
        ),
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(55),
        width: ScreenUtil().setWidth(width),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6.0)
        ),
      ),
    );
  }
}