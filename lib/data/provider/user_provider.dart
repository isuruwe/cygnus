import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/db/entity/chat.dart';
import 'package:cygnus/data/db/entity/fb.dart';
import 'package:cygnus/data/db/entity/message.dart';
//mport 'package:cygnus/data/db/remote/firebase_database_source.dart';
//import 'package:cygnus/data/db/remote/firebase_storage_source.dart';

import 'package:cygnus/data/model/chat_with_user.dart';
import 'package:cygnus/data/model/planets.dart';
import 'package:cygnus/data/model/user_registration.dart';
import 'package:cygnus/data/model/userdet.dart';
import 'package:cygnus/hook/scr/hookup.dart';
import 'package:cygnus/hook/scr/profiles.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/galview.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:cygnus/util/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../hook/scr/hookup.dart';
import '../model/maril.dart';
import '../model/rel.dart';

class UserProvider extends ChangeNotifier {
  //FirebaseAuthSource _authSource = FirebaseAuthSource();
  // FirebaseStorageSource _storageSource = FirebaseStorageSource();
  // FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();
  //var dio = dio.dio();
  // final dio = Retrydio(dio.dio());
  bool isLoading = false;
  AppUser? user;
  static const oneSec = Duration(seconds: 5);
  List<Chat> cht = [];
  //Response response;
  var dio = Dio();

  Future<List<Message>?> observeMessages(String? chatid) async {
    List<Message>? mmlist;
    var formData = FormData.fromMap({
      'uid': chatid,
    });

    var url = Uri.parse('https://www.tunelk.com/mobile/obsmsg.php');
   // var url = Uri.parse('https://www.tunelk.com/mobile/obsmsg.php');
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      if (response.data.isNotEmpty) {
        mmlist = parsemm(response.data);
      }
    } else {
      return mmlist;
    }

    return mmlist;
  }

  Future<List<Chat>?> observechat(String? chatid) async {
    List<Chat>? mmlist;
    var formData = FormData.fromMap({
      'uid': chatid,
    });
    var url = Uri.parse('https://www.tunelk.com/mobile/obschat.php');
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      if (response.data.isNotEmpty) {
        mmlist = parsecc(response.data);
      }
    } else {
      return mmlist;
    }

    return mmlist;
  }
//////////////////////////////////////////////////////////////////////
  Future<String?> getreqst(String? uid,String? mid) async {
    String? sty;
    var formData = FormData.fromMap({
      'uid': uid,
      'mid': mid,
    });
    var url = Uri.parse('https://www.tunelk.com/mobile/getreqst.php');
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      if (response.data.isNotEmpty) {
        sty = response.data;
      }
    } else {
      return sty;
    }

    return sty;
  }


  ////////////////////////////////////////////////////////////////////
  Future<String> loginUser(
      String email, String password, BuildContext errorScaffoldKey) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/login.php');
    var formData = FormData.fromMap({
      'uid': email,
      'pw': password,
    });

    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      if (response.data.isNotEmpty) {
        String id = response.data;
        SharedPreferencesUtil.setUserId(id);
       await getUser();
      }
    } else {
      showSnackBar(errorScaffoldKey, 'Incorrect Username or password!');
    }

    return response.data;
  }

  fb parsefb(String responsedata) {
    final parsed = jsonDecode(responsedata);

    return fb.fromJson(parsed);
  }

  List<Message> parsemm(String responsedata) {
    final parsed = jsonDecode(responsedata).cast<Map<String, dynamic>>();

    return parsed.map<Message>((json) => Message.fromJson(json)).toList();
  }

  List<Chat> parsecc(String responsedata) {
    final parsed = jsonDecode(responsedata).cast<Map<String, dynamic>>();

    return parsed.map<Chat>((json) => Chat.fromJson(json)).toList();
  }

  Future<String> loginUsergg(
      String email, BuildContext errorScaffoldKey) async {
    var formData = FormData.fromMap({
      'uid': email,
    });
    var url = Uri.parse('https://www.tunelk.com/mobile/loginfb.php');
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      if (response.data.isNotEmpty) {
        String id = response.data;
        SharedPreferencesUtil.setUserId(id);
     await   getUser();
      }
    } else {
      showSnackBar(errorScaffoldKey, 'Error You are not registered user!');
    }

    return response.data;
  }

  Future<String> loginUserfb(
      String email, BuildContext errorScaffoldKey) async {
    String id = "";
    var url1 = Uri.parse(
        "https://graph.facebook.com/v12.0/me?fields=email%2Cname&access_token=" +
            email);
    Response response1 = await dio.get(url1.toString());
    if (response1.statusCode.toString() == '200') {
      if (response1.data.isNotEmpty) {
        fb asd = parsefb(response1.data);

        var url = Uri.parse('https://www.tunelk.com/mobile/loginfb.php');
        var formData = FormData.fromMap({
          'uid': asd.email,
        });

        Response response = await dio.post(url.toString(), data: formData);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.data}');
        if (response.statusCode.toString() == '200') {
          if (response.data.isNotEmpty) {
            id = response.data;
            SharedPreferencesUtil.setUserId(id);
          await  getUser();
          }
        } else {
          showSnackBar(errorScaffoldKey, 'Error You are not registered user!');
        }
      }
    }

    return id;
  }

  Future<String> uppass(String pw, BuildContext errorScaffoldKey) async {
    String? id = await SharedPreferencesUtil.getUserId();
    var formData = FormData.fromMap({
      'uid': id,
      'pw': generateMd5(pw),
    });
    var url = Uri.parse('https://www.tunelk.com/mobile/updatepass.php');
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      if (response.data.isNotEmpty) {}
    } else {
      showSnackBar(errorScaffoldKey, 'Error !');
    }

    return response.data;
  }

  Future<fb?> signUserfb(
      String email, GlobalKey<ScaffoldState> errorScaffoldKey) async {
    String id = "";
    var url1 = Uri.parse(
        "https://graph.facebook.com/v12.0/me?fields=email%2Cname&access_token=" +
            email);
    Response response1 = await dio.get(url1.toString());
    if (response1.statusCode.toString() == '200') {
      if (response1.data.isNotEmpty) {
        fb asd = parsefb(response1.data);
        SharedPreferencesUtil.setEmail(asd.email);
        SharedPreferencesUtil.setname(asd.name);
        return asd;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future<String> registerUser(UserRegistration userRegistration,
      GlobalKey<ScaffoldState> errorScaffoldKey) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/newuser.php');
    var formData = FormData.fromMap({
      'fn': userRegistration.fn,
      'ln': userRegistration.ln,
      'em': userRegistration.email,
      'phone': userRegistration.phone,
      'pw': userRegistration.password,
      'hgt': userRegistration.height,
      'country': userRegistration.country,
      'state': userRegistration.state,
      'city': userRegistration.city,
      'qualify': userRegistration.qualify,
      'diet': userRegistration.diet,
      'weight': userRegistration.weight,
      'relid': userRegistration.religion,
      'forwhom': userRegistration.forwhom,
      'marital': userRegistration.marital,
      'sex': userRegistration.sex,
      'dob': userRegistration.dob,
      'about': userRegistration.about,
      'occup': userRegistration.occup,
      'company': userRegistration.company,
      'work': userRegistration.work,
      'income': userRegistration.income,
      'curr': userRegistration.curr,
      'br': userRegistration.br,
      'sis': userRegistration.sis,
      'dk': userRegistration.dk,
      'sk': userRegistration.sk,
      'langs': userRegistration.langs,
      'photo': userRegistration.localProfilePhotoPath
    });

    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      //startUpload(userRegistration);
      _uploadWithRetry(userRegistration);
      if (!response.data.toLowerCase().contains('error')) {
        SharedPreferencesUtil.setUserId(response.data);
        AppUser user = AppUser(
            id: response.data,
            name: userRegistration.ln,
            age: 1,
            profilePhotoPath: userRegistration.localProfilePhotoPath);
      await  getUser();
      }
    }

    return response.statusCode.toString();
  }

  /////////////////////////////
  Future<String> updateUser(UserRegistration userRegistration) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/updateuser.php');
    var formData = FormData.fromMap({
      'fn': userRegistration.fn,
      'ln': userRegistration.ln,
      'em': userRegistration.email,
      'phone': userRegistration.phone,
      'pw': generateMd5(userRegistration.password),
      'hgt': userRegistration.height,
      'country': userRegistration.country,
      'state': userRegistration.state,
      'city': userRegistration.city,
      'qualify': userRegistration.qualify,
      'diet': userRegistration.weight,
      'relid': userRegistration.religion,
      'forwhom': userRegistration.forwhom,
      'marital': userRegistration.marital,
      'sex': userRegistration.sex,
      'dob': userRegistration.dob,
      'about': userRegistration.about,
      'occup': userRegistration.occup,
      'company': userRegistration.curr,
      'work': userRegistration.work,
      'income': userRegistration.income,
      'photo': userRegistration.localProfilePhotoPath,
    'sk':userRegistration.sk,
    'dk':userRegistration.dk,
    'br':userRegistration.br,
    'sis':userRegistration.sis,
    'langs':userRegistration.langs,
      'cur':userRegistration.curr,
    });
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      //startUpload(userRegistration);

      if (!response.data.toLowerCase().contains('error')) {}
    }

    return response.statusCode.toString();
  }

  Future<String> updatepartner(UserRegistration userRegistration) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/updatepartner.php');
    var formData = FormData.fromMap({
      'fn': userRegistration.fn,
      'ln': userRegistration.ln,
      'em': userRegistration.email,
      'phone': userRegistration.phone,
      'pw': generateMd5(userRegistration.password),
      'hgt': userRegistration.height,
      'country': userRegistration.country,
      'state': userRegistration.state,
      'city': userRegistration.city,
      'qualify': userRegistration.qualify,
      'diet': userRegistration.diet,
      'relid': userRegistration.religion,
      'forwhom': userRegistration.forwhom,
      'marital': userRegistration.marital,
      'sex': userRegistration.sex,
      'dob': userRegistration.dob,
      'about': userRegistration.about,
      'occup': userRegistration.occup,
      'company': userRegistration.company,
      'work': userRegistration.work,
      'income': userRegistration.income,
      'photo': userRegistration.localProfilePhotoPath,
      'dkp': userRegistration.dkp,
      'skp': userRegistration.skp,
      'prefcur': userRegistration.prefcur,
      'langsp': userRegistration.langsp,
    });
    Response response = await dio.post(url.toString(), data: formData);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      //startUpload(userRegistration);

      if (!response.data.toLowerCase().contains('error')) {}
    }

    return response.statusCode.toString();
  }

  /////////////////////
  Future<userdet> getUserdet(String uid) async {
    List<userdet>? itemsList;
    userdet df=new userdet();
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserdet.php');
    var formData = FormData.fromMap({'uid': uid});

    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      if (!response.data.toLowerCase().contains('error')) {
        List<dynamic> parsedListJson = jsonDecode(response.data.toString());
        itemsList =
            List<userdet>.from(parsedListJson.map((i) => userdet.fromJson(i)));
        if(itemsList.length!=0){

        return itemsList.first;}
        else{

          return df;
        }
      } else {
        return itemsList!.first;
      }
    } else {
      return itemsList!.first;
    }
  }

  /////////////////////
  Future<userdet> getUserdet2(String uid,String mid) async {
    List<userdet>? itemsList;
    userdet df=new userdet();
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserdet2.php');
    var formData = FormData.fromMap({'uid': uid,'mid': mid});

    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      if (!response.data.toLowerCase().contains('error')) {
        List<dynamic> parsedListJson = jsonDecode(response.data.toString());
        itemsList =
        List<userdet>.from(parsedListJson.map((i) => userdet.fromJson(i)));
        if(itemsList.length!=0){

          return itemsList.first;}
        else{

          return df;
        }
      } else {
        return itemsList!.first;
      }
    } else {
      return itemsList!.first;
    }
  }
  /////////////////////
  Future<List> getUsermedia(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getusermedia.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var payloadList = payloadFromJson(response.data);
      return payloadList;
    } else {
      var payloadList = payloadFromJson(response.data);
      return payloadList;
    }
  }

  /////////////////////
  Future<List<Profile>> getuserlist(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserlist.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var payloadList1 = payloadFromJson1(response.data);
      return payloadList1;
    } else {
      var payloadList1 = payloadFromJson1(response.data);
      return payloadList1;
    }
  }

  /////////////////////
  Future<List<Planet>> getuserlisth(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserlist.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    } else {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    }
  }

  /////////////////////
  /////////////////////
  Future<String> getpay(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getpay.php');
    String rt="";
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
       rt= response.data.toString();

    } else {
      rt= response.data.toString();
    }
    return rt;
  }

  /////////////////////
  /////////////////////
  Future<List<Planet>> getuserlistf(String uid, String marit, String onbef, bool canUpload, String rel, String age,String? stateValue2,String? cityValue2,String countryValue2) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserlistf.php');
    var formData = FormData.fromMap({'uid': uid,'marit':marit,'onbef':onbef,'fp':canUpload,'rel':rel,'age':age,'stateValue2':stateValue2,'cityValue2':cityValue2,'countryValue2':countryValue2});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    } else {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    }
  }
  /////////////////////
  Future<List<maril>> getonbefs() async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getonbefs.php');
    var formData = FormData.fromMap({});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      onbefs = marilFromJson1(response.data);

      return onbefs;
    } else {
      onbefs = marilFromJson1(response.data);
      return onbefs;
    }
  }
////////////////////////////
  Future<List<maril>> getcur() async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getcurr.php');
    var formData = FormData.fromMap({});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      curry = marilFromJson1(response.data);

      return curry;
    } else {
      curry = marilFromJson1(response.data);
      return curry;
    }
  }
/////////////////////
  Future<List<maril>> getedul() async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getedu.php');
    var formData = FormData.fromMap({});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      edulis = marilFromJson1(response.data);

      return edulis;
    } else {
      edulis = marilFromJson1(response.data);
      return edulis;
    }
  }
/////////////////////////
  Future<List<maril>> getlangs() async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getlan.php');
    var formData = FormData.fromMap({});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      langs = marilFromJson1(response.data);

      return langs;
    } else {
      langs = marilFromJson1(response.data);
      return langs;
    }
  }
  //////////////////////
  Future<List<maril>> getmarit() async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getmarit.php');
    var formData = FormData.fromMap({});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      marils = marilFromJson1(response.data);

      return marils;
    } else {
      marils = marilFromJson1(response.data);
      return marils;
    }
  }
////////////////////////////
  /////////////////////
  Future<List<rel>> getrel() async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getrel.php');
    var formData = FormData.fromMap({});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      religions = relFromJson1(response.data);

      return religions;
    } else {
      religions = relFromJson1(response.data);
      return religions;
    }
  }
////////////////////////////

  Future<List<Planet>> getuserlist2(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserlist2.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    } else {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    }
  }
  /////////////////////


  /////////////////////
  Future<String?> getpartneradd(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getpartneradd.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {

      return response.data;
    } else {

      return response.data;
    }
  }
  /////////////////////
  /////////////////////
  Future<List<Planet>> getuserlistm(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserlistm.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    } else {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    }
  }
  /////////////////////
  /////////////////////
  Future<List<Planet>> getuserlistr(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserlistr.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    } else {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    }
  }
  ///////////////////// /////////////////////
    Future<List<Planet>> getuserlistbl(String uid) async {
      var url = Uri.parse('https://www.tunelk.com/mobile/getuserlistbl.php');
      var formData = FormData.fromMap({'uid': uid});
      Response response = await dio.post(url.toString(), data: formData);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');
      if (response.statusCode.toString() == '200') {
        var payloadList1 = PlanetFromJson1(response.data);
        return payloadList1;
      } else {
        var payloadList1 = PlanetFromJson1(response.data);
        return payloadList1;
      }
    }
  //   /////////////////////
  /////////////////////
  Future<List<Planet>> getuserlistb(String uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getuserlistb.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    } else {
      var payloadList1 = PlanetFromJson1(response.data);
      return payloadList1;
    }
  }
  /////////////////////


  Future<int?> updateuphoto(String? uid, String ph) async {
    List<userdet>? itemsList;
    var url = Uri.parse('https://www.tunelk.com/mobile/updatephoto.php');
    var formData = FormData.fromMap({'uid': uid, 'photo': ph});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////
  /////////////////////


  Future<int?> updateonline(String? uid, String? ph) async {
    List<userdet>? itemsList;
    var url = Uri.parse('https://www.tunelk.com/mobile/updateonline.php');
    var formData = FormData.fromMap({'uid': uid, 'msg': ph});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////
  Future<int?> addchat(String? uid, String? myid, String? oid) async {
    List<userdet>? itemsList;
    var url = Uri.parse('https://www.tunelk.com/mobile/addchat.php');
    var formData = FormData.fromMap({
      'uid': uid,
      'myid': myid,
      'oid': oid,
    });
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////

  /////////////////////
  Future<int?> updatechat(
      String? chatId, String? messageId, String? seen) async {
    List<userdet>? itemsList;
    var url = Uri.parse('https://www.tunelk.com/mobile/updatechat.php');
    var formData = FormData.fromMap({
      'chatId': chatId,
      'messageId': messageId,
      'seen': seen,
    });
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////

  /////////////////////
  Future<int?> addMessage(String? chatId, Message msg) async {
    List<userdet>? itemsList;
    var url = Uri.parse('https://www.tunelk.com/mobile/addmessage.php');
    var formData = FormData.fromMap({
      'chatId': chatId,
      'seen': msg.seen.toString(),
      'epochTimeMs': msg.epochTimeMs.toString(),
      'text': msg.text,
      'senderId': msg.senderId.toString(),
    });
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////
  Future<String?> setpay(PurchaseDetails purchaseDetails) async {
    //List<userdet> itemsList = null as List<userdet>;
   String? uid= (await SharedPreferencesUtil.getUserId());
    var url = Uri.parse('https://www.tunelk.com/mobile/insertpay.php');
    var formData = FormData.fromMap({'purchaseID': purchaseDetails.purchaseID, 'productID':  purchaseDetails.productID, 'verificationData':  purchaseDetails.verificationData.source, 'transactionDate': purchaseDetails.transactionDate, 'status': purchaseDetails.status, 'error': purchaseDetails.error, 'verilocal': purchaseDetails.verificationData.localVerificationData, 'veriserver': purchaseDetails.verificationData.serverVerificationData,'userid':uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.toString();
    } else {
      return response.toString();
    }
  }
  ///////////////////////
  Future<int?> inserttoken(String? uid, String? mid) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/inserttoken.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
  Future<int?> sendmsg(String? uid, String? mid) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/sendmsg.php');
    var formData = FormData.fromMap({'uid': uid, 'msg': mid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
  /////////////////////
  Future<int?> insertblock(String? uid, String? mid) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/insertblock.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
  ///////////////////////
  /////////////////////
  Future<int?> removeblock(String? uid, String? mid) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/removeblock.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
  ///////////////////////
  Future<int?> insertswip(String? uid, String? mid, String lik) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/insertswip.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid, 'lik': lik});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
//////////////////////
  Future<int?> rembk(String? uid, String? mid, String lik) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/removebook.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid, 'lik': lik});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////
  Future<int?> remswip(String? uid, String? mid, String lik) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/removeswip.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid, 'lik': lik});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  ///////////////////////
  Future<int?> insertreject(String? uid, String? mid, String? lik) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/insertreject.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid, 'lik': lik});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////
  ///////////////////////
  Future<int?> insertbook(String? uid, String? mid, String lik) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/insertbook.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid, 'lik': lik});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////
  /////////////////////
  Future<int?> insertmatch(String? uid, String? mid) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/insertmatch.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  /////////////////////
  /////////////////////
  Future<AppUser?> observeUser(String? uid) async {
    var url = Uri.parse('https://www.tunelk.com/mobile/getuser.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      var responseJson = json.decode(response.data);

      List<AppUser> asd = parsePhotos(response.data);

      user = asd.first;
      return user;
    } else {
      return user;
    }
  }

  /////////////////////
  /////////////////////
  Future<List<ChatWithUser>> getmatches(String? uid) async {
    List<ChatWithUser> chatWithUserList = [];
    var url = Uri.parse('https://www.tunelk.com/mobile/getmatches.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      //var responseJson = json.decode(response.data);

      cht = parsecc(response.data);
      cht.forEach((element1) {
        ChatWithUser chatWithUser = ChatWithUser(element1, element1.apu);
        chatWithUserList.add(chatWithUser);
        //  notifyListeners();
      });

      //user =asd.first  ;
      return chatWithUserList;
    } else {
      return chatWithUserList;
    }
  }

  /////////////////////
  Future<String> getlogin(String? uid,String em) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/api/customLogin');
    var formData = FormData.fromMap({'email':em,'password': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');

    // if (response.statusCode.toString() == '200') {
    //   return response.data;
    // } else {
    //   return response.data;
    // }
    return response.data.toString();
  }
  /////////////////////
  Future<String> getpass(String? uid) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/api/getpassword');
    var formData = FormData.fromMap({'password': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');

    if (response.statusCode.toString() == '200') {
      return response.data;
    } else {
      return response.data;
    }

  }

  /////////////////////
  /////////////////////
  Future<String> getswip(String? uid) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/getswipes.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.data;
    } else {
      return response.data;
    }
  }

  /////////////////////
  /////////////////////
  Future<String> getswipid(String? uid, String? mid) async {
    // List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/getswipesid.php');
    var formData = FormData.fromMap({'uid': uid, 'mid': mid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.data;
    } else {
      return response.data;
    }
  }

  /////////////////////
  Future<int?> updatenic(String? uid, String ph, String ph2) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/updatenic.php');
    var formData = FormData.fromMap({'uid': uid, 'photo': ph, 'photo2': ph2});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  ///////////////////////
  /////////////////////
  Future<String> getPersonsToMatchWith(
      int limit, List<String?> ignoreIds) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/getmatch.php');
    var stringList = ignoreIds.join(",");
    var formData = FormData.fromMap({'mid': stringList});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.data;
    } else {
      return response.data;
    }
  }

  ///////////////////////

  Future<String> getnicval(String? uid) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/getnicval.php');
    var formData = FormData.fromMap({'uid': uid});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.data;
    } else {
      return response.data;
    }
  }

  ///////////////////////
  ///////////////////////
  Future<int?> updatemedia(String? uid, String ph) async {
    //List<userdet> itemsList = null as List<userdet>;
    var url = Uri.parse('https://www.tunelk.com/mobile/updatemedia.php');
    var formData = FormData.fromMap({'uid': uid, 'photo': ph});
    Response response = await dio.post(url.toString(), data: formData);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.data}');
    if (response.statusCode.toString() == '200') {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  Future<void> _log(String log) async {
    print(log);
    await Future.delayed(Duration(seconds: 1));
  }

  final FTPConnect _ftpConnect = new FTPConnect("ftp.tunelk.com",
      user: "web@tunelk.com", pass: "Tunelk@123", debug: true);
  Future<void> _uploadWithRetry(UserRegistration userRegistration) async {
    try {
      File fileToUpload = File(userRegistration.localProfilePhotoPath);
      await _log('Uploading ...');
      await _ftpConnect.connect();
      await _ftpConnect.changeDirectory('upload');
      bool res =
          await _ftpConnect.uploadFileWithRetry(fileToUpload, pRetryCount: 2);
      await _log('file uploaded: ' + (res ? 'SUCCESSFULLY' : 'FAILED'));
      await _ftpConnect.disconnect();
    } catch (e) {
      await _log('Downloading FAILED: ${e.toString()}');
    }
  }

  Future<AppUser?> getUser() async {
    // if (user != null) {
    //   return user;
    // } else {
      String? id = await SharedPreferencesUtil.getUserId();
      String? singleline = id?.replaceAll("\n", "");
      var singleline2 = singleline?.replaceAll("\r", "");
      var formData = FormData.fromMap({'uid': singleline2});
      var url = Uri.parse('https://www.tunelk.com/mobile/getuser.php');
      Response response = await dio.post(url.toString(), data: formData);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');
      if (response.statusCode.toString() == '200') {
        var responseJson = json.decode(response.data);

        List<AppUser> asd = parsePhotos(response.data);

        SharedPreferences shared_User = await SharedPreferences.getInstance();

        shared_User.setString('user', response.data);
        //_user = AppUser.fromSnapshot(await _databaseSource.getUser(id));
        if (asd.isNotEmpty) {
          user = asd.first;
        }

        return user;
      } else {
        return user;
      }

  }

  List<AppUser> parsePhotos(String responsedata) {
    final parsed = jsonDecode(responsedata).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }

  void updateUserProfilePhoto(
      String localFilePath, BuildContext errorScaffoldKey) async {
    // isLoading = true;
    // notifyListeners();
    // Response<dynamic> response =
    // await _storageSource.uploadUserProfilePhoto(localFilePath, _user.id);
    // isLoading = false;
    // if (response is Success<String>) {
    //   _user.profilePhotoPath = response.value;
    //   _databaseSource.updateUser(_user);
    // } else if (response is Error) {
    //   showSnackBar(errorScaffoldKey, response.message);
    // }
    // notifyListeners();
  }

  void updateUserBio(String newBio) {
    // _user.bio = newBio;
    // _databaseSource.updateUser(_user);
    // notifyListeners();
  }

  Future<void> logoutUser() async {
    // _user = null as AppUser;
    // await SharedPreferencesUtil.removeUserId();
  }

  //  Future<List<ChatWithUser>> getChatsWithUser(String? userId) async {
  //
  //
  //      getmatches(userId).then((response) {
  //    cht=response!;
  //
  //    //
  //    // for (var task in cht) {
  //    //   // do something
  //    // }
  //    for (var i = 0; i < cht.length; i++) {
  //
  //
  //      String chatId = compareAndCombineIds(cht[i].id, userId);
  //      observechat(chatId)
  //          .then((response1) {
  //        response1!.forEach((element1)  {
  //
  //          ChatWithUser chatWithUser = ChatWithUser(element1, cht.elementAt(i));
  //          chatWithUserList.add(chatWithUser);
  //          notifyListeners();
  //
  //        });
  //       // notifyListeners();
  //    //    return chatWithUserList;
  //      });
  //      // Chat chat = Chat.fromSnapshot(await _databaseSource.getChat(chatId));
  //  //    return chatWithUserList;
  //
  //    }
  //    //notifyListeners();
  // //  return chatWithUserList;
  //
  //
  //     });
  //
  //    return chatWithUserList;
  //  }
}
