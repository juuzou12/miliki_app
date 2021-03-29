import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:miliki_app/Objects/TaxRegion.dart';
import 'package:miliki_app/Objects/Data.dart';
import 'package:miliki_app/Objects/DeviceSerialNo.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppModel {
  final String baseUrl = "https://backend-dev-miliki.k8s.tracom.co.ke:2020/app/rest/v2";
  /*final String baseUrl = "http://41.215.130.247:31001/app/rest/v2/";*/
  /*final String baseUrl = "http://192.168.254.83:8080/app/rest/v2/";*/


  /*final String baseUrl = "http://a094b5a03e78.ngrok.io/app/rest/v2/";*/
  String token;
  String basicAuth;

  // ignore: non_constant_identifier_names
  String BeareaToke;

  Dio dio;

  AppModel() {
    // ignore: non_constant_identifier_names
    String Username = "miliki-Xw5tZBmm";
    // ignore: non_constant_identifier_names
    String Password = "9706ece7ece6f629003dc2eb54e9f546b668e07d39b8cec952f91f74fda46744";

    basicAuth = 'Basic ' + base64Encode(utf8.encode('$Username:$Password'));

    /*basicAuth='$Username:$Password';*/

    print(basicAuth);

    Map<String, String> headers = new Map();

    headers.putIfAbsent(
        Headers.acceptHeader, () => ContentType.json.toString());

    dio = Dio(
      BaseOptions(
          connectTimeout: 1000,
          baseUrl: baseUrl,
          responseType: ResponseType.json,
          headers: headers,

          contentType: ContentType.json.toString(),
          validateStatus: (v) => true),
    );
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.contentType = Headers.jsonContentType;
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => "backend-dev-miliki.k8s.tracom.co.ke"==host;
      return client;
    };

    dio.interceptors.add(
      InterceptorsWrapper(onResponse: (Response response) {
        //print(response.data);
        //response.data["code"] = 200;
        return response;
      }, onRequest: (RequestOptions options) {
        /* options.headers.putIfAbsent("Host", () => baseUrl)*/
        /*options.headers.putIfAbsent("Content-Length", () => options.data.length);*/

        print("ONREQUEST 2222`");
        print(options.headers.toString());
        print("ONREQUEST 111111`");
        print(options.data.toString());
        print("ONREQUEST Interceptor ended`");
        return options;
      }),
    );
  }

  Future<Map> loginUser(String username, String password, function, function2,
      function3,noAccessFunction) async {
    print("THIS IS THE LOGIN FUNCTION START POINT");

    try {
      String uri = "/oauth/send-token";
      var dataSent = {
        "username": username,
        "password": password,
        "scope": "supplier"
      };

      print("This is the data sent.................." + dataSent.toString());

      Response response = await dio.post(uri, data: dataSent,
          options: Options(headers: {'Authorization': "$basicAuth",},));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(response.statusCode);
      if(response.statusCode!=400){
        if (response.statusCode == 202) {
          function();
        }
        if (response.data['message'] ==
            "No user found with provided username") {
          function2();
        }
        else if (response.data['message'] == "Wrong password") {
          function2();
        }
        else {
          prefs.setString(
              "correlationId", response.data["correlationId"].toString());
          print("................" + prefs.getString("correlationId"));
          function();
        }

        print(response.data.toString());
      }else{
       noAccessFunction();
      }

      return response.data;
    } catch (exception) {
      print(exception);
      function3();
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }
  }

  Future<Map> verifyOtp(String correlationId, String otpCode, function,
      function2, function3,function400,changePasswordfunction) async {
    print("THIS IS THE OTP VERIFICATION FUNCTION START POINT");

    try {
      String uri = "/oauth/verify-token";

      var dataSent = {
        "correlationId": correlationId,
        "otpCode": otpCode,
      };
      print("This is the data sent.................." + dataSent.toString());

      Response response = await dio.post(uri, data: dataSent,
          options: Options(headers: {'Authorization': "$basicAuth",},));
      SharedPreferences prefs = await SharedPreferences.getInstance();

      print(response.statusCode);

      if (response.statusCode == 200) {

        function();
        print(response.toString());
      }
      if(response.statusCode==410){
        changePasswordfunction();
        print(response.toString());
      }
      if(response.statusCode==400){
        function400();
      }
      print(response.toString());
      prefs.setString("access_token", response.data["access_token"]);
    } catch (exception) {
      function3();
      print(exception);
    }
  }

  Future<Map<String, dynamic>> userInfo(Succesfulfunction,failedFunction) async {
    print("THIS IS THE USER INFO FUNCTION START POINT");

    try {
      String uri = "/services/miliki_UserParentService/getUserInfo";
      var dataSent = {
        "type": "supplier"
      };
      print("This is the data sent.................." + dataSent.toString());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String beareaToke = prefs.getString("access_token");
      Response response = await dio.post(uri, data: dataSent,
          options: Options(
            headers: {'Authorization': " Bearer $beareaToke",},));
      if (response.statusCode == 200) {
        prefs.setString("_entityName", response.data["supplier"]['name']);
        Succesfulfunction();
        print("............" + prefs.getString("_entityName"));

        print(response.toString());
      }
    } catch (exception) {
      failedFunction();
      print(".............." + exception.toString());
    }
  }

  /*Get the service id and service name */
  Future<Map<String, dynamic>> getServiceDetails(String query, function,
      Succesfulfunction) async {
    try {
      String uri = "/services/miliki_TraderService/getTraderByTin?vatNo=$query" ;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));
      print(resp.statusCode);
      print(resp.statusMessage);
      if (resp.statusCode == 200) {

        print("IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"+resp.data.toString());

        prefs.setString("PIN", resp.data['data']["vatNo"]);
        print("THIS IS THE PIN......." + prefs.getString("PIN"));

        prefs.setString("phone", resp.data['data']["phone"]);
        print("THIS IS THE VAT......." + prefs.getString("phone"));

        prefs.setString("id", resp.data['data']["id"]);
        print("THIS IS THE VAT......." + prefs.getString("id"));

        prefs.setString("entityName", resp.data['data']["_entityName"]);
        print("THIS IS THE VAT......." + prefs.getString("entityName"));

        prefs.setString("Email", resp.data['data']["email"]);
        print("THIS IS THE VAT......." + prefs.getString("Email"));

        prefs.setString(
            "physicalAddress", resp.data['data']["physicalAddress"]);
        print("THIS IS THE VAT......." + prefs.getString("physicalAddress"));

        prefs.setString("location", resp.data['data']["location"]);
        print("THIS IS THE VAT......." + prefs.getString("location"));

        prefs.setString("taxRegion", resp.data['data']["taxRegion"]["name"]);
        prefs.setString("taxRegionID", resp.data['data']["taxRegion"]["id"]);

        print("THIS IS THE taxRegion......." + prefs.getString("taxRegionID"));

        Succesfulfunction();
      }

      /* print(resp.data);*/
      return resp.data;
    } catch (exception) {
      function();
      print("..............."+exception.toString());
      if(exception.toString()=="Invalid argument(s)"){
        return {
          'message':
          'An error occur, please check your VAT number and try again'
        };
      }else{
        return {
          'code': 500,
          'message':
          'An error occur, please check your internet connection and try again'
        };
      }
    }
  }

  Future<Map<String, dynamic>> onboardTaxpayer(String id, String tin,
      String vatNo, String name, String phone,
      String email, String websiteUrl, String physicalAddress, String location,
      String taxRegion,
      String firstName, String lastName, String taxId,String valueFromDrop,Succesfulfunction,failedFunction,conflictFunction,) async {
    print("THIS IS THE USER INFO FUNCTION START POINT");

    try {
      String uri = "/services/miliki_FrontendBprocService/startProcessByKey";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> data = {
        "trader": {
          "id": id,
          "name": name,
          "tin": tin,
          "vatNo": vatNo,
          "email": email,
          "phone": phone,
          "websiteUrl": websiteUrl,
          "physicalAddress": physicalAddress,
          "location": location,
          "taxRegion": {
            "id": taxRegion
          },
          "contactPersons": [
            {
              "firstName": firstName,
              "lastName": lastName,
              "email": email
            }
          ]
        },
        "device": {
          "id": prefs.getString('devicesID')
        },
        "simCard": {
          "id": prefs.getString('SimCardID')
        },
        "taxRegion": {
          "id": valueFromDrop
        }
      };

      var convertedData = jsonEncode(data);
      print(".................." + convertedData);


      var dataSent = {
        "processKey": "new-trader-onboarding",
        "incomingVariables": {
          "json": convertedData
        }
      };
      print("This is the data sent.................." + jsonEncode(dataSent));


      String beareaToke = prefs.getString("access_token");
      Response response = await dio.post(uri, data: jsonEncode(dataSent),
          options: Options(
            headers: {'Authorization': " Bearer $beareaToke",},));
      print(response.statusCode);
      print(response.statusMessage);
      if (response.statusCode == 200) {
        print(".....................................teee"+response.toString());
        Succesfulfunction();

      }

      if(response.statusCode==409){
        conflictFunction();
      }

    } catch (exception) {
      failedFunction();
      print(".............." + exception.toString());
    }
  }

  Future<Map<String, dynamic>> getTaxRegion(function,failedFunction,{then}) async {
    print("THIS IS THE USER INFO FUNCTION START POINT");

    try {
      String uri = "/entities/miliki_TaxRegion";


      SharedPreferences prefs = await SharedPreferences.getInstance();
      String beareaToke = prefs.getString("access_token");
      Response response = await dio.get(uri,
          options: Options(
            headers: {'Authorization': " Bearer $beareaToke",},));

      print(response.statusCode);
      if(response.statusCode==200){
        if(then != null)
          then(response.toString());
        var results=response.data;
        DeviceSerialNo deviceSerialNo=DeviceSerialNo.fromJson(results[0]);
        print(deviceSerialNo.serialNumber);
        function();
      }



    } catch (exception) {
      print( exception);
      failedFunction();
    }
  }

  Future<Map<String, dynamic>> getDeviceSerialNo(String value, function,
      Succesfulfunction,String property,inactiveFun) async {
    try {
      Map<String,dynamic>data={
        "conditions": [
          {
            "property":property,
            "operator": "=",
            "value": value
          }
        ]
      };
      String paramName = 'filter';
      var encodeQueryComponent = paramName+'='+Uri.encodeComponent(json.encode(data));
      print(encodeQueryComponent.toString());

      String uri = "/entities/miliki_Device/search?$encodeQueryComponent";

      print(uri);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));



      print(resp.statusCode);
      print(resp.statusMessage);
      if (resp.statusCode == 200) {

        print(resp.data);

        print(resp.data is String);

        var results=resp.data;
        //var list=json.decode(results);
        //print(list);
        Data data= Data.fromJson(results[0]);
        if(data.status=="INACTIVE"){
          prefs.setString("devicesID", data.id);
          print(data.id);

          Succesfulfunction();
        }else{
          inactiveFun();
        }


      }
      if(resp.statusCode==409){
        function();
      }
      return resp.data;
    } catch (exception) {
      function();
      print("..............."+exception.toString());
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }
  }

  Future<Map<String, dynamic>> getSimCards(String value, function,
      Succesfulfunction,String property) async {
    try{
      Map<String,dynamic>dataSent={
        "conditions":[{
          "property":property,
          "operator":"=",
          "value":value
        }]
      };
      String paramName = 'filter';
      var encodeQueryComponent = paramName+'='+Uri.encodeComponent(json.encode(dataSent));
      print(encodeQueryComponent.toString());

      String uri = "/entities/miliki_SimCard/search?$encodeQueryComponent";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));

      print(resp.statusCode);
      print(resp.statusMessage);

      if (resp.statusCode == 200) {

        print(resp.data);

        print(resp.data is String);

        var results=resp.data;
        //var list=json.decode(results);
        //print(list);
        Data data= Data.fromJson(results[0]);
        prefs.setString("SimCardID", data.id);
        print(data.id);
        print("THisi ====is from the sharepref "+prefs.getString('SimCardID'));

        Succesfulfunction();
      }
      if(resp.statusCode==409){
        function();
      }
      return resp.data;

    }catch(exception){
      function();
      print("This is the exception of this request$exception");
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }

  }

  Future<Map<String, dynamic>> getDeviceState(String value, function,
      Succesfulfunction,String property) async {
    try{
      Map<String,dynamic>dataSent={
        "conditions":[{
          "property":"status",
          "operator": "=",
          "value": "INACTIVE"
        }]
      };
      String paramName = 'filter';
      var encodeQueryComponent = paramName+'='+Uri.encodeComponent(json.encode(dataSent));
      print(encodeQueryComponent.toString());

      String uri = "/entities/miliki_Device/search?$encodeQueryComponent";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));

      print(resp.statusCode);
      print(resp.statusMessage);

      if (resp.statusCode == 200) {

        print(resp.data);
        /*getDeviceSerialNo(value,function,Succesfulfunction,property);*/
        print(resp.data is String);

        var results=resp.data;
        //var list=json.decode(results);
        //print(list);
        Data data= Data.fromJson(results[0]);
        prefs.setString("simCardID", data.id);
        print(data.id);

        Succesfulfunction();
      }
      if(resp.statusCode==409){
        function();
      }
      return resp.data;

    }catch(exception){
      function();
      print("This is the exception of this request$exception");
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }

  }

  Future<Map<String, dynamic>> getSimCardState(String value, function,
      Succesfulfunction,String property) async {
    try{
      Map<String,dynamic>dataSent={
        "conditions":[{
          "property":"status",
          "operator": "=",
          "value": "INACTIVE"
        }]
      };
      String paramName = 'filter';
      var encodeQueryComponent = paramName+'='+Uri.encodeComponent(json.encode(dataSent));
      print(encodeQueryComponent.toString());

      String uri = "/entities/miliki_SimCard/search?$encodeQueryComponent";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));

      print(resp.statusCode);
      print(resp.statusMessage);

      if (resp.statusCode == 200&&resp.data[0]!=null) {
          print(resp.data);
          getSimCards(value,function,Succesfulfunction,property);
          print(resp.data is String);

          var results=resp.data;
          //var list=json.decode(results);
          //print(list);
          Data data= Data.fromJson(results[0]);
          prefs.setString("simCardID", data.id);
          print(data.id+"HIII IN IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
          Succesfulfunction();
      }
      if(resp.statusCode==409){
        function();
      }
      return resp.data;

    }catch(exception){
      function();
      print("This is the exception of this request$exception");
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }

  }

  Future<Map<String, dynamic>> getTrader(String value, function,
      Succesfulfunction,String property) async {
    try{
      Map<String,dynamic>dataSent={
        "conditions":[
          {
            "property": property,
            "operator":"=",
            "value": value
          }
        ]
      };
      String paramName = 'filter';
      var encodeQueryComponent = paramName+'='+Uri.encodeComponent(json.encode(dataSent));
      print(encodeQueryComponent.toString());

      String uri = "/entities/miliki_Trader/search?$encodeQueryComponent";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));

      print(resp.statusCode);
      print(resp.statusMessage);

      if (resp.statusCode == 200) {

        print(resp.data);
        getSimCards(value,function,Succesfulfunction,property);
        print(resp.data is String);

        var results=resp.data;
        //var list=json.decode(results);
        //print(list);
        Data data= Data.fromJson(results[0]);
        prefs.setString("traderID", data.id);



        print(data.id);

        Succesfulfunction();
      }
      if(resp.statusCode==409){
        function();
      }
      return resp.data;

    }catch(exception){
      function();
      print("This is the exception of this request$exception");
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }

  }

  Future<Map<String, dynamic>> getDeviceFilter(String value, function,
      Succesfulfunction,String property,{then}) async {
    try{
      Map<String,dynamic>dataSent={
        "conditions":[
          {
            "property": "fiscalized.id",
            "operator":"=",
            "value": value
          }
        ]
      };
      String paramName = 'filter';
      var encodeQueryComponent = paramName+'='+Uri.encodeComponent(json.encode(dataSent));
      print(encodeQueryComponent.toString());

      String uri = "/entities/miliki_Device/search?$encodeQueryComponent";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));

      print(resp.statusCode);
      print(resp.statusMessage);

      if (resp.statusCode == 200) {
        if(resp.data!=null){
          print(resp.data);
          getSimCards(value,function,Succesfulfunction,property);
          print(resp.data is String);

          var results=resp.data;
          //var list=json.decode(results);
          //print(list);
          Data data= Data.fromJson(results[0]);
          prefs.setString("devicesMilikiID", data.id);
          print(data.id);

          Succesfulfunction();

          if(then != null)
            then(resp.data);

        }else{
          function();
        }
      }
      return resp.data;

    }catch(exception){
      function();
      print("This is the exception of this request$exception");
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }

  }

  Future<Map<String, dynamic>> getHelpType(
      Succesfulfunction,{then}) async {
    try{
      String uri = "/entities/miliki_TicketCategory";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));

      print(resp.statusCode);
      print(resp.statusMessage);

      if (resp.statusCode == 200) {
        if(resp.data!=null){
          Succesfulfunction();

          if(then != null)
            then(resp.data);

        }else{

        }
      }
      return resp.data;

    }catch(exception){

      print("This is the exception of this request$exception");
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }

  }

  Future<Map<String, dynamic>> getSubject(
      Succesfulfunction,{then}) async {
    try{
      String uri = "/entities/miliki_TicketSubCategory";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      Response resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));

      print(resp.statusCode);
      print(resp.statusMessage);

      if (resp.statusCode == 200) {
        if(resp.data!=null){
          Succesfulfunction();

          if(then != null)
            then(resp.data);

        }else{

        }
      }
      return resp.data;

    }catch(exception){

      print("This is the exception of this request$exception");
      return {
        'code': 500,
        'message':
        'An error occured when performing your request, please try again'
      };
    }

  }

  Future<Map<String, dynamic>> DeviceInspection(String description, String subCategory,
      String trader, String device,Succesfulfunction,conflictFunction,failedFunction) async {
    print("THIS IS THE USER INFO FUNCTION START POINT");

    try {
      String uri = "/services/miliki_FrontendBprocService/startProcessByKey";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> data =
        {
          "description": description,
          "subCategory": {
            "id": subCategory
          },
          "trader": {
            "id": trader
          },
          "device": {
            "id":device
          }
      };

      var convertedData = jsonEncode(data);
      print(".................." + convertedData);


      var dataSent = {
        "processKey": "new-ticket-logging",
        "incomingVariables": {
          "json": convertedData
        }
      };
      print("This is the data sent.................." + jsonEncode(dataSent));


      String beareaToke = prefs.getString("access_token");
      Response response = await dio.post(uri, data: jsonEncode(dataSent),
          options: Options(
            headers: {'Authorization': " Bearer $beareaToke",},));
      print(response.statusCode);
      print(response.statusMessage);
      if (response.statusCode == 200) {
        print(".....................................teee"+response.toString());
        Succesfulfunction();

      }

      if(response.statusCode==409){
        conflictFunction();
      }

    } catch (exception) {
      failedFunction();
      print(".............." + exception.toString());
    }
  }


  Future<Map<String, dynamic>> getTasks() async {
    try{
      String uri = "/services/miliki_UserTasksService/getUserTasks";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      var resp = await dio.get(uri, options: Options(
        headers: {'Authorization': " Bearer $BeareaToke",},));
      print(resp.statusCode);
      print(resp.statusMessage);

      if (resp.statusCode == 200) {
        return {
          'code': 200,
          'body':resp.data,
          'message':
          'An error occured when performing your request, please try again'
        };
      }
      throw new Exception();




    }catch(exception){
      print("This is the exception of this request$exception");

    } return {
      'code': 500,
      'message':
      'An error occured when performing your request, please try again'
    };

  }

  Future<Map> changePassword(String oldPassword, String newPassword, function,
      function2, function3,function400) async {
    print("THIS IS THE OTP VERIFICATION FUNCTION START POINT");

    try {
      String uri = "/services/miliki_ChangePasswordService/changePassword";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      var dataSent =  {
        "changePasswordWrapper": {
          "oldPass": oldPassword,
          "newPassword": newPassword
        }
      };
      print("This is the data sent.................." + dataSent.toString());

      Response response = await dio.post(uri, data: dataSent,
          options: Options(
            headers: {'Authorization': " Bearer $BeareaToke",},));

      if (response.statusCode == 200) {
        function();
        print(response.toString());
      }
      if(response.statusCode==400){
        function400();
      }
      print(response.toString());
    } catch (exception) {
      function3();
      print(exception);
    }
  }

  Future<Map> ForgotPassword(String email,function,
      function3,function400) async {
    print("THIS IS THE FORGOT PASSWORD FUNCTION START POINT");

    try {
      String uri = "/forgot/password";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BeareaToke = prefs.getString("access_token");
      var dataSent = {
        "username": email
      }
      ;
      print("This is the data sent.................." + dataSent.toString());

      Response response = await dio.post(uri, data: dataSent);

      print(response.statusCode);
      print(response.statusMessage);
      if (response.statusCode == 200) {
        function();
        print(response.toString());
      }else if (response.statusCode == 404) {
        function400();
        print(response.toString());
      }
      print(response.toString());
    } catch (exception) {
      function3();
      print(exception);
    }
  }
}