import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cygnus/ui/widgets/rounded_icon_button.dart';
import 'package:cygnus/ui/widgets/image_portrait.dart';

class AddPhotoScreen extends StatefulWidget {
  final Function(String) onPhotoChanged;

  AddPhotoScreen({required this.onPhotoChanged});

  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  final picker = ImagePicker();
  String _imagePath="";

  Future pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }
  Future pickImageFromcam() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Container(height: 70,
      child:  Text(
            'Add photo',
            style: Theme.of(context).textTheme.headline3,
          ),
      ),
          Container(height: 370,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
