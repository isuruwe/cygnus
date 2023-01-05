import 'package:flutter/material.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/ui/widgets/rounded_icon_button.dart';
import 'package:cygnus/util/constants.dart';

class SwipeCard extends StatefulWidget {
  final AppUser? person;

  SwipeCard({required this.person});

  @override
  _SwipeCardState createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.725,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child:
                Image.network(widget.person!.profilePhotoPath, fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            child: Column(
              children: [
                Padding(
                    padding: showInfo
                        ? EdgeInsets.symmetric(horizontal: 8, vertical: 4)
                        : EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: getUserContent(context)),
                showInfo ? getBottomInfo() : Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getUserContent(BuildContext context) {
    return
          Container(
            child:

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Column(mainAxisSize:MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              width: 220.0,
              child:
              Text(
                '${widget.person!.name}',
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.black)
              ),
            ),SizedBox(
              width: 120.0,
              child:
            Text(
                '${widget.person!.age}',
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold,color: Colors.black)
              ),

            ),
            // RichText(
            //     text: TextSpan(
            //   style: DefaultTextStyle.of(context).style,
            //   children: <TextSpan>[
            //     TextSpan(
            //       text: widget.person!.name,
            //       style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            //     ),
            //     TextSpan(text: '  ${widget.person!.age}', style: TextStyle(fontSize: 20)),
            //   ],
            // )),
          ],
        ),
        RoundedIconButton(
          onPressed: () {
            setState(() {
              showInfo = !showInfo;
            });
          },
          iconData: showInfo ? Icons.arrow_downward : Icons.person,
          iconSize: 16,
          buttonColor: kColorPrimaryVariant,
        ),
      ],),
    );
  }

  Widget getBottomInfo() {
    return Column(
      children: [
        Divider(
          color: kAccentColor,
          thickness: 1.5,
          height: 0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Colors.black.withOpacity(.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    widget.person!.bio?? "No bio.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
