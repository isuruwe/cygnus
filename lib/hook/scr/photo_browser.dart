import 'package:cached_network_image/cached_network_image.dart';
import 'package:cygnus/util/CustomStack.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/hook/scr/selected_photo_indicator.dart';

import '../../util/constants.dart';

class PhotoBrowser extends StatefulWidget {
  final List<String> photoAssetPaths;
  final int visiblePhotoIndex;

  const PhotoBrowser({required this.photoAssetPaths, required this.visiblePhotoIndex});
  @override
  _PhotoBrowserState createState() => _PhotoBrowserState();
}

class _PhotoBrowserState extends State<PhotoBrowser> {
  int visiblePhotoIndex=0;
  int newcnt=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    visiblePhotoIndex = widget.visiblePhotoIndex;
    newcnt=widget.photoAssetPaths.length - 1;
  }

  @override
  void didUpdateWidget(PhotoBrowser oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.visiblePhotoIndex != oldWidget.visiblePhotoIndex) {
      setState(() {
        visiblePhotoIndex = widget.visiblePhotoIndex;
      });
    }
  }

  void _previousImage() {
    setState(() {
      visiblePhotoIndex = visiblePhotoIndex > 0 ? visiblePhotoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    if(newcnt==visiblePhotoIndex){
      setState(() {
        visiblePhotoIndex = visiblePhotoIndex > 0 ? visiblePhotoIndex - 1 : 0;
      });
      newcnt= newcnt-1;
    }

    else{
      setState(() {
        newcnt= widget.photoAssetPaths.length - 1 ;
        visiblePhotoIndex = visiblePhotoIndex < widget.photoAssetPaths.length - 1
            ? visiblePhotoIndex + 1
            : visiblePhotoIndex;
      });
        }
  }

  Widget _buildPhotoControls() {
    return Stack (
      fit: StackFit.expand,
      children: <Widget>[
        new GestureDetector(
          behavior: HitTestBehavior.translucent,

          onTap: () => {  _previousImage()},


          child: new FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        new GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => { _nextImage()},


          child: new FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        //photo

  new  CachedNetworkImage(
    imageUrl: imgpath+widget.photoAssetPaths[visiblePhotoIndex]),
        //photo indicator
        new Positioned(
            top: 0.0,
            right: 0.0,
            left: 0.0,
            child: new SelectedPhotoIndicator(
                photoCount: widget.photoAssetPaths.length,
                visiblePhotoIndex: visiblePhotoIndex)),

        //photo controls
        _buildPhotoControls()
      ],
    );
  }
}
