import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Extensions/HomePage.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import 'package:miliki_app/Widgets/WaveBackground.dart';

import '../main.dart';

class Dashboard extends StatefulWidget{
  final String name;

  const Dashboard({Key key, this.name}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _WalkThroughPageState();
  }

}

class _WalkThroughPageState extends State<Dashboard> {
  Future<Map> showBalanceResponse;

  String pageStatus="Home";
  var colorState=true;

  @override
  Widget build(BuildContext context) {
    /**this is the screenUtil lines that handle the screen ratios*/

    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context);
    //If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(context, width: 360, height: 750);
    return Scaffold(
      bottomNavigationBar: RotatedBox(quarterTurns: 90, child: Container(child: WaveBackground())),
      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomePage(name: widget.name,)

            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit,color: Colors.white,),
        backgroundColor: Color(0xff00215E),
        onPressed: (){
          Navigator.pushNamed(context, "/NewTaskPage");
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}