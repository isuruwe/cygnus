import 'dart:io';

import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/SettingsPage.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/ui/widgets/image_portrait.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class validation extends StatefulWidget {
  static const String id = 'validation';
  @override
  _validation createState() => _validation();
}

class _validation extends State<validation> {
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _textFieldController1 = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserProvider? _userProvider;
  String valueText = "";
  late LanguageChangeProvider appLanguage;
  String valueText1 = "";

  bool _isLoading = false;
  final picker = ImagePicker();
  String _imagePath = "";
  String _imagePath2 = "";

  String? uid;
  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of(context, listen: false);
    appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'NIC Validation',
          style: TextStyle(fontSize: 20, color: Colors.lightBlue),
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: CustomModalProgressHUD(
        inAsyncCall: _isLoading,
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              FutureBuilder(
                future: loadstatus(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.toString().isNotEmpty) {
                      return Text(
                        snapshot.data.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                      );
                    } else {
                      return Text(
                        'NIC Not Validated',
                        style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                      );
                    }
                  } else {
                    return Text(
                      'NIC Not Validated',
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    );
                  }
                },
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: kDefaultPadding,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'We use your national identity card only to verify your account informtion.These information will not be shared to any prty under any circumstances.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Text(
                          'NIC Front',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 25),
                              Container(
                                height: 150,
                                width: 150,
                                child: _imagePath == '' || _imagePath == null
                                    ? ImagePortrait(
                                        imageType: ImageType.ASSET_IMAGE,
                                        imagePath: 'assets/images/cma.png',
                                      )
                                    : ImagePortrait(
                                        imagePath: _imagePath,
                                        imageType: ImageType.FILE_IMAGE,
                                      ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: RoundedOutlinedButton(
                                          text: 'Gallery',
                                          onPressed: pickImageFromGallery)),
                                  SizedBox(width: 55),
                                  Expanded(
                                      child: RoundedOutlinedButton(
                                          text: 'Camera',
                                          onPressed: pickImageFromcam)),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'NIC Back',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Container(
                                height: 150,
                                width: 150,
                                child: _imagePath2 == '' || _imagePath2 == null
                                    ? ImagePortrait(
                                        imageType: ImageType.ASSET_IMAGE,
                                        imagePath: 'assets/images/cma.png',
                                      )
                                    : ImagePortrait(
                                        imagePath: _imagePath2,
                                        imageType: ImageType.FILE_IMAGE,
                                      ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: RoundedOutlinedButton(
                                          text: 'Gallery',
                                          onPressed: pickImageFromGallery2)),
                                  SizedBox(width: 55),
                                  Expanded(
                                      child: RoundedOutlinedButton(
                                          text: 'Camera',
                                          onPressed: pickImageFromcam2)),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                height: 60,
                                child: RoundedOutlinedButton(
                                    text: 'UPDATE', onPressed: fun2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // SizedBox(
              //   height: 50,
              // ),
              // Center(
              //   child: RoundedOutlinedButton(
              //
              //     onPressed: () {
              //       //Navigator.pushNamed(context, TopNavigationScreen.id);
              //       Navigator.pop(context);
              //     },
              //     text: 'BACK',
              //
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  static bool isPassMatch(String value, String value2) {
    return value.contains(value2);
  }

  Future pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  Future pickImageFromcam() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  Future pickImageFromGallery2() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath2 = pickedFile.path;
      });
    }
  }

  Future pickImageFromcam2() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath2 = pickedFile.path;
      });
    }
  }

  Future<void> fun2() async {
    _isLoading = true;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      if (_imagePath.isEmpty) {
        showSnackBar(context, 'Front of NIC Needed!');
      } else if (_imagePath2.isEmpty) {
        showSnackBar(context, 'Back of NIC Needed!');
      } else {
        uid = (arguments['name']);

        _uploadWithRetry(_imagePath);

        await _userProvider!
            .updatenic(uid, _imagePath, _imagePath2)
            .then((response) {
          if (response == 200) {
            showSnackBar(context, 'NIC Updated!');
            _isLoading = false;
            Navigator.pushNamed(context, TopNavigationScreen.id);
          }
        });
      }
    } else {
      showSnackBar(context, 'Please login again!');
    }
  }

  Future<void> _log(String log) async {
    print(log);
    await Future.delayed(Duration(seconds: 1));
  }

  final FTPConnect _ftpConnect = new FTPConnect("ftp.tunelk.com",
      user: "tunelk@tunelk.com", pass: "Tunelk@123", debug: true);

  Future<void> _uploadWithRetry(String path) async {
    try {
      File fileToUpload = File(path);
      await _log('Uploading ...');
      await _ftpConnect.connect();
      //await _ftpConnect.changeDirectory('upload');
      bool res =
          await _ftpConnect.uploadFileWithRetry(fileToUpload, pRetryCount: 12);
      await _log('file uploaded: ' + (res ? 'SUCCESSFULLY' : 'FAILED'));
      if (res) {
        _uploadWithRetry2(_imagePath2);
      }
      await _ftpConnect.disconnect();
    } catch (e) {
      await _log('Downloading FAILED: ${e.toString()}');
    }
  }

  Future<void> _uploadWithRetry2(String path) async {
    try {
      File fileToUpload = File(path);
      await _log('Uploading ...');
      await _ftpConnect.connect();
      //await _ftpConnect.changeDirectory('upload');
      bool res =
          await _ftpConnect.uploadFileWithRetry(fileToUpload, pRetryCount: 12);
      await _log('file uploaded: ' + (res ? 'SUCCESSFULLY' : 'FAILED'));
      await _ftpConnect.disconnect();
    } catch (e) {
      await _log('Downloading FAILED: ${e.toString()}');
    }
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BorderedTextField(
                      labelText: 'Old Password',
                      onChanged: (value) => {
                        setState(() {
                          var age = value;
                        }),
                      },
                      textCapitalization: TextCapitalization.words,
                    ),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountchgpw(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // password input
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          valueText1 = value;
                        });
                      },
                      controller: _textFieldController,
                      decoration: InputDecoration(
                        hintText: "Enter New Password",
                        hintStyle: TextStyle(color: Color(0xFF000000)),
                      ),
                    ),

                    // password input
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          valueText = value;
                        });
                      },
                      controller: _textFieldController1,
                      decoration: InputDecoration(
                        hintText: "Enter Confirm Password",
                        hintStyle: TextStyle(color: Color(0xFF000000)),
                      ),
                    ),

                    // submit button
                  ],
                ),
                actions: [
                  RoundedOutlinedButton(
                    text: 'Reset Password',

                    // add your on tap handler here
                    onPressed: () async {
                      if (!isPassMatch(valueText, valueText1)) {
                        showSnackBar(context, 'Password Not Match!');
                      } else if (valueText.isEmpty) {
                        showSnackBar(
                            context, 'Confirm Password field required!');
                      } else if (valueText1.isEmpty) {
                        showSnackBar(context, 'Password field required!');
                      } else {
                        _isLoading = true;
                        await _userProvider!
                            .uppass(valueText1, context)
                            .then((response) {
                          if (response.isEmpty) {
                            showSnackBar(context, 'Error!');
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                            _isLoading = false;
                          } else {
                            showSnackBar(
                                context, 'Password Changed Successfully!');
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                          }
                        });
                      }
                    },
                  ),
                  RoundedOutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: 'Close',
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Future<String> loadstatus() async {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      uid = (arguments['name']);
    }
    String res = "";
    await _userProvider!.getnicval(uid).then((response) {
      if (response == '1') {
        res = "NIC Validation Pending";
        return res;
      } else if (response == '2') {
        res = "NIC Validated";
        return res;
      } else {
        return res;
      }
    });
    return res;
  }
}
