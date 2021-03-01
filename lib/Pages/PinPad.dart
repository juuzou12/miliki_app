import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/screenutil.dart';
class PinPad  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PinPadState();
  }

}

class _PinPadState extends State<PinPad> {
  final pinLength = 4;
  var _isLoggingIn = false;
  String currentPIN = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
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
                    child: Icon(Icons.lock,
                      color: Color(0xff00225D),
                      size: 25,),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(16)),
                child: Column(
                  children: [
                    Text(
                      "Enter your PIN",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00225D),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Text("To change your password you must provide your pin in the LRA system."
                          "If you don't have this information. Contact the LRA support team.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey
                        ),),
                        width: ScreenUtil().setWidth(280),),
                    ),
                    Text(
                      "Contact for LRA",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00225D),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(37),
                    bottom: ScreenUtil().setHeight(37)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      pinLength,
                          (index) => Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          height: ScreenUtil().setHeight(8),
                          width: ScreenUtil().setHeight(8),
                          decoration: BoxDecoration(
                              color: currentPIN.length > index
                                  ? Color(0xff00225D)
                                  : Color(0xff00225D).withOpacity(0.2),
                              shape: BoxShape.circle),
                        ),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("1"),
                        onTap: () {
                          onPressNumber(1);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("2"),
                        onTap: () {
                          onPressNumber(2);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("3"),
                        onTap: () {
                          onPressNumber(3);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("4"),
                        onTap: () {
                          onPressNumber(4);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("5"),
                        onTap: () {
                          onPressNumber(5);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("6"),
                        onTap: () {
                          onPressNumber(6);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("7"),
                        onTap: () {
                          onPressNumber(7);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("8"),
                        onTap: () {
                          onPressNumber(8);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("9"),
                        onTap: () {
                          onPressNumber(9);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DigitButton(
                    text: Icon(Icons.backspace,
                        color: Color(0xffDA0000)),
                    onTap: () {
                      onBackSpace();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: DigitButton(
                        text: Text("0"),
                        onTap: () {
                          onPressNumber(0);
                        },
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                color: Colors.grey.shade200),
                          ]
                      ),
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                    ),
                  ),
                  DigitButton(
                    text: Icon(Icons.navigate_next,
                      color: Color(0xff00225B),),
                    onTap: () {
                      onAccept();
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  void onPressNumber(int i) {
    if (currentPIN.length >= pinLength) return;
    setState(() {
      currentPIN = "$currentPIN$i";
    });
  }

  void onBackSpace() {
    setState(() {
      currentPIN = currentPIN.substring(0, currentPIN.length - 1);
    });
  }

  _showErrorDialog(String title, String message, BuildContext context,
      function) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
                onPressed: () => Navigator.pop(context),
                child: InkWell(
                  child: Text("OK"),
                  onTap: () async {
                    print(
                        ">>>>>>>>>>Current pin Length ${currentPIN.length}");
                    if(currentPIN!=null){
                      setState(() {
                        currentPIN = "";
                      });
                      Navigator.pop(context);
                    }


                  },
                ))
          ],
        ));
  }

  void onAccept() async {
    print("On Accept was called");
    Navigator.pushNamed(context, "/ForgotPassword");
  }

}

class DigitButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onTap;

  const DigitButton({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ScreenUtil().setHeight(83),
        width: ScreenUtil().setWidth(83),
        child: Center(child: text),
      ),
    );
  }
}

class PinLockIcon extends StatelessWidget {
  const PinLockIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(86),
      width: ScreenUtil().setHeight(86),
      child: Stack(
        children: [
          Container(
            decoration:
            BoxDecoration(color: Color(0xff7C51A1), shape: BoxShape.circle),
          ),
          Center(
              child: Image.asset(
                "assets/images/security_icon.png",
                height: ScreenUtil().setHeight(36.49),
              )),
        ],
      ),
    );
  }
}