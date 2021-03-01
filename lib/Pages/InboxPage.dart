import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliki_app/Functions/AppModel.dart';
import '../main.dart';
import 'package:miliki_app/Objects/Tasks.dart';
class InboxPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InboxPageState();
  }

}

class _InboxPageState extends State<InboxPage> {
  var colorChange=false;
  var ready=false;
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
                        "My Inbox",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff3598DC),
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(220),
                  )
                ],
              ),
            ],
            // ...
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getIt<AppModel>().getTasks(),
              builder: (context,AsyncSnapshot snapshot){
                // ignore: missing_return

                if(snapshot.data!= null){
                  print(".......this is snapshot,,,,,${snapshot.data}");
                   return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snapshot.data['body'][index]['name']),
                                    Container(
                                        child:
                                        Text(snapshot.data['body'][index]['createTime']),
                                    width: ScreenUtil().setWidth(100),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(snapshot.data['body'][index]['businessKey']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                //                    <--- top side
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data.length,

                  );
                }else{
                  return Center(
                    child: Text("Loading"),
                  );
                }

              },
            )
          // ignore: missing_required_param
          /*FutureBuilder<Map<String, dynamic>>(
            future: getIt<AppModel>().getTasks(),
            builder: (BuildContext context,
                AsyncSnapshot<dynamic> snapshot){
              switch (snapshot.connectionState){
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        Text('Awaiting result...'),
                      ],
                    ),
                  );
                case ConnectionState.done:
                  return Column(
                    children: [
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                            itemBuilder: (context, int index){
                          return ListTile(
                            title: Text(snapshot.data[index]['executionId']),
                          );
                        }),
                      ),
                    ],
                  );

              }
              return null;
            },

          )*/
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
            children: [
              InkWell(
                child: Container(
                  height: ScreenUtil().setHeight(45),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        Icon(Icons.list,color: Colors.white,),
                        Text("Tasks",
                          style: GoogleFonts.getFont("Poppins",
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(12)),),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff3598DC),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onTap: (){

                },
              ),
              Container(
                height: ScreenUtil().setHeight(45),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline
                      ,color: Color(0xff3598DC),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Completed",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff3598DC),
                            fontSize: ScreenUtil().setSp(12)),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF1F5F8),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(45),
                child: Row(
                  children: [
                    Icon(Icons.more
                      ,color: Color(0xff3598DC),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("In Progress",
                        style: GoogleFonts.getFont("Poppins",
                            color: Color(0xff3598DC),
                            fontSize: ScreenUtil().setSp(12)),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF1F5F8),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  // A function that will convert a response body into a List<Photo>
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}