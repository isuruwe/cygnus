import 'package:country_code_picker/country_code_picker.dart';
import 'package:cygnus/ui/widgets/BorderedTextField2.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:multiselect/multiselect.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:csc_picker/csc_picker.dart';

import '../../../data/model/planets.dart';


class aboutinfo extends StatefulWidget {
  final Function(String) onChangedab;
  final Function(String) onChangedpn;
  final Function(String) onChangedlan;
  final Function(String) onChangedsk;
  final Function(String) onChangeddk;
  final Function(String) onChangedbr;
  final Function(String) onChangedsis;

  aboutinfo({required this.onChangedab,required this.onChangedpn, required this.onChangedlan, required this.onChangedsk, required this.onChangeddk, required this.onChangedbr, required this.onChangedsis,});

  @override
  _aboutinfoState createState() => _aboutinfoState();
}

class _aboutinfoState extends State<aboutinfo> {
  String phone="";
  List<String> lanlist = [];
  String ctcode="";
  List<String> cityNames =[];
  var _textEditingController5 = TextEditingController();
  String textcode="";
  List<String> dritems= ['Select*','No','Occasionally','Special Moments','Yes' ];
  String drval= 'Select*';
  List<String> sisitems= ['Select*','No','1','2 ','3','4','5','6' ];
  String sisval= 'Select*';
  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    return SingleChildScrollView(child:
     Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You are almost Done',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),

        DropDownMultiSelect(
          onChanged: (List<String> x) {
            setState(() {
              lanlist =x;
              widget.onChangedlan(x.toString());
            });
          },
          options: langst,
          selectedValues: lanlist,
          whenEmpty: 'Select Language',
        ),
        _buildDropButtonsdk(dritems,drval,'Drink*'),
        _buildDropButtonssk(dritems,drval,'Smoke*'),
        _buildDropButtonsbr(sisitems,sisval,'Brothers*'),
        _buildDropButtonssis(sisitems,sisval,'Sisters*'),
        SizedBox(height: 10,),
        Center(
          child:  TextFormField(
            minLines: 5,
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            style:  TextStyle(
    color: Colors.white
    ),
            onChanged: (value) => {
              setState(() {
                var age = value;
              }),
              widget.onChangedab(value)
            },
            decoration: InputDecoration(

              hintText: 'About Your self',
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        // Center(
        //   child: BorderedTextField(
        //     labelText: 'Phone Number with country Code*',
        //
        //     onChanged: (value) => {
        //       setState(() {
        //         var age = value;
        //       }),
        //       widget.onChangedpn(value)
        //     },
        //     textCapitalization: TextCapitalization.words,
        //   ),
        // ),
        Container(height: 70,
          child:  Row(
              children:[
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:  Colors.white,
                    ),
                    color: Colors.transparent,
                  ),
                  child: CountryCodePicker(
                    onChanged: (e) => {
                      setState(() {
                        ctcode = e.dialCode.toString();
                        textcode=e.code.toString();
                      }),
                      //widget.onChangedpn(value)
                    },
                    initialSelection: '',
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: false,
                    favorite: ['+94', 'LK'],
                  ),
                ),
                Container(
                  width: 170,

                  height: 60,
                  child:  BorderedTextField2(
                    keyboardType: TextInputType.number,
                    labelText: 'Phone Number',
                    textController: _textEditingController5,
                    onChanged: (value) => {
                      setState(() {
                        phone = value;
                        widget.onChangedpn(value);
                      }),
                      _textEditingController5.text =value.contains(ctcode)?value: ctcode+value,
                      _textEditingController5.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController5.text.length)),
                      //_textEditingController5.selection=TextSelection(baseOffset: value.length, extentOffset: value.length),
                      //widget.onChangedpn(value)
                    },
                    textCapitalization: TextCapitalization.words,
                  ),
                ),
              ]
          ),

        ),

        // Expanded(
        //   child: Center(
        //     child: Container(
        //       child: DecimalNumberPicker(
        //           decimalPlaces: 1,
        //           decimalDecoration: BoxDecoration(
        //             border: Border.all(color: Colors.white, width: 2),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           value: age,
        //           minValue: 100,
        //           maxValue: 300,
        //           onChanged: (value) => {
        //                 setState(() {
        //                   age = value;
        //                 }),
        //                 widget.onChanged(value)
        //               }),
        //     ),
        //   ),
        // ),
      ],
    ),);
  }

  Widget _buildDropButtonssk(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        labelText: hintt,
      ),
      dropdownColor: Colors.transparent,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.white, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          widget.onChangedsk(value!);}
      },
    );


  }
  Widget _buildDropButtonsdk(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        labelText: hintt,
      ),
      dropdownColor: Colors.transparent,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.white, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          widget.onChangeddk(value!);}
      },
    );


  }
  Widget _buildDropButtonssis(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        labelText: hintt,
      ),
      dropdownColor: Colors.transparent,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.white, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          widget.onChangedsis(value!);}
      },
    );


  }
  Widget _buildDropButtonsbr(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        labelText: hintt,
      ),
      dropdownColor: Colors.transparent,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.white, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          widget.onChangedbr(value!);}
      },
    );


  }




}
