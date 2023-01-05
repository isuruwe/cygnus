

import 'dart:io';

import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cygnus/ui/widgets/rounded_icon_button.dart';
import 'package:cygnus/ui/widgets/image_portrait.dart';
import 'package:provider/provider.dart';

import 'SettingsPage.dart';

class UpdatePhoto extends StatefulWidget {
  static const String id = 'UpdatePhoto';




  @override
  _UpdatePhoto createState() => _UpdatePhoto();


}

class _UpdatePhoto extends State<UpdatePhoto> {
  final picker = ImagePicker();
  String _imagePath="";
  UserProvider? _userProvider ;
  var _isLoading=false;
  String uid="";


  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of(context, listen: false);


    //appLanguage = Provider.of<LanguageChangeProvider>(context, listen: false);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
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
        body:
        CustomModalProgressHUD(
          color: Colors.white,
        inAsyncCall: _isLoading,
        child:
        Padding(
        padding: kDefaultPadding,

        child:
      DecoratedBox(
        decoration: const BoxDecoration(
        color: Colors.white,

    ),
    child:
      Container(height: MediaQuery.of(context).size.height,
        color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Add photo',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.black),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(


                  child: _imagePath == '' ||_imagePath == null
                      ? ImagePortrait(imageType: ImageType.ASSET_IMAGE, imagePath: 'assets/images/cma.png',)
                      : ImagePortrait(
                    imagePath: _imagePath,
                    imageType: ImageType.FILE_IMAGE,
                  ),
                ),


                Row(
                  children:  <Widget>[

                    Expanded(
                        child: RoundedOutlinedButton(
                            text: 'Gallery',
                            onPressed:pickImageFromGallery )
                    ),
                    SizedBox(width: 55),


                    Expanded(
                        child:  RoundedOutlinedButton(
                            text: 'Camera',
                            onPressed:pickImageFromcam )
                    ),

                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Container(height: 60,
                  child:
                  RoundedOutlinedButton(
                      text: 'UPDATE PHOTO',
                      onPressed:fun2 ),),
              ],
            ),
          ),
        ],
      ),
    ),  ),
        ),
      ),
      );
  }

  Future<void> fun2() async{
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null){
      uid=(arguments['name']);
    }
    _uploadWithRetry(_imagePath);
    await _userProvider!
        .updateuphoto(uid,_imagePath)
        .then((response) {
      if(response==200){
        showSnackBar(context, 'Photo Updated!');
        Navigator.pushNamed(context, TopNavigationScreen.id);
      }
      });
  }
  final FTPConnect _ftpConnect = new FTPConnect("ftp.tunelk.com",
      user: "tunelk@tunelk.com", pass: "Tunelk@123", debug: true);
  Future<void> _log(String log) async {
    print(log);
    await Future.delayed(Duration(seconds: 1));
  }
  Future<void> _uploadWithRetry(String path) async {
    try {
      File fileToUpload = File(path);
      await _log('Uploading ...');
      await _ftpConnect.connect();
      await _ftpConnect.changeDirectory('upload');
      bool res =
      await _ftpConnect.uploadFileWithRetry(fileToUpload, pRetryCount: 12);
      await _log('file uploaded: ' + (res ? 'SUCCESSFULLY' : 'FAILED'));
      await _ftpConnect.disconnect();
    } catch (e) {
      await _log('Downloading FAILED: ${e.toString()}');
    }
  }
}
