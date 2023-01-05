import 'package:cygnus/data/db/entity/fb.dart';
import 'package:cygnus/data/model/maril.dart';
import 'package:cygnus/data/model/planets.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AgeScreen extends StatefulWidget {
  final Function(String) onChangedht;
  final Function(String) onChangedem;
  final Function(String) onChangedpw;
  final Function(String) onChangedcpw;
  final Function(String) onChangedcn;
  final Function(String?) onChangedstate;
  final Function(String?) onChangedcity;
  final Function(String) onChangedmarit;
  final Function(String) onChangeddiet;
  final Function(String) onChangedweight;
  AgeScreen({required this.onChangedht,required this.onChangedem,required this.onChangedpw,required this.onChangedcpw,required this.onChangedcn,required this.onChangedstate,required this.onChangedcity,required this.onChangedmarit,required this.onChangeddiet,required this.onChangedweight});

  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String? address = "";
  int age = 50;
  int _currentValue = 0;
  List<String> maritems= ['Select Marital Status*','Unmarried','Widow/Widower','Divorced','Separated','Limited to Signature' ];
  String dropdownValue1 = 'Select Marital Status*';
  List<String> diettems= ['Your Diet*','Veg','Non-Veg','Occasionally Non-Veg','Eggetarian' ];
  String dropdownValue2= 'Your Diet*';
  String? name = "";
  String? email = "";
  bool _isObscure = true;
  var _textEditingController = TextEditingController();
  @override
  void initState()  {

    super.initState();

    gett().then((data) {
      setState(() {
        this.email = data;
        if( email!=null){
          _textEditingController.text=email.toString();
          widget.onChangedem(data?.toString()??"");
        }

      });
    });


  }
  Future<String?> gett() async {


    name= (await SharedPreferencesUtil.getename());
    email= (await SharedPreferencesUtil.getemail());
    return email;
  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    return SingleChildScrollView(child:

      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
      Container(height: 70,
      child:
              Text(
                'Let\'s Set up Your Account',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
        //     ],
        //   ),
         ),
        Container(height: 70,
          child:
          BorderedTextField(
            textController: _textEditingController,

            labelText: 'E-mail*',
            onChanged: (value) => {
              setState(() {
                var age = value;
              }),
              _textEditingController.text = value,
              _textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length)),
              widget.onChangedem(value)
            },
            textCapitalization: TextCapitalization.words,
          ),
       ),
    // Expanded(
    //       child:
          // BorderedTextField(
          //   labelText: 'Password',
          //   obscureText: true,
          //   onChanged: (value) => {
          //     setState(() {
          //       var age = value;
          //     }),
          //     widget.onChangedpw(value)
          //   },
          //   textCapitalization: TextCapitalization.words,
          // ),
        Container(height: 70,
    child:
          TextField(
            obscureText: _isObscure,style: TextStyle(color: Colors.white),
            textCapitalization: TextCapitalization.words,
            onChanged: (value) => {
                setState(() {
                  var age = value;
                }),
            widget.onChangedpw(value)
               },
            decoration: InputDecoration(
              labelText: 'Password*',
              labelStyle: TextStyle(color: kSecondaryColor.withOpacity(0.5)),
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kSecondaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kSecondaryColor),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
          ),



        ),
        Container(height: 70,
    child:
          BorderedTextField(
            labelText: 'Confirm Password*',
            obscureText: _isObscure,
            onChanged: (value) => {
              setState(() {
                var age = value;
              }),
              widget.onChangedcpw(value)
            },
            textCapitalization: TextCapitalization.words,
          ),
        ),
      SizedBox(height: 5),
        Container(height: 140,
    child: CSCPicker(
          ///Enable disable state dropdown [OPTIONAL PARAMETER]
          showStates: true,

          /// Enable disable city drop down [OPTIONAL PARAMETER]
          showCities: true,

          ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
          flagState: CountryFlag.DISABLE,

          ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
          dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border:
              Border.all(color: Colors.grey.shade300, width: 1)),

          ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
          disabledDropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade300,
              border:
              Border.all(color: Colors.grey.shade300, width: 1)),

          ///placeholders for dropdown search field
          countrySearchPlaceholder: "Country*",
          stateSearchPlaceholder: "State*",
          citySearchPlaceholder: "City*",

          ///labels for dropdown
          countryDropdownLabel: "*Country",
          stateDropdownLabel: "*State",
          cityDropdownLabel: "*City",

          ///Default Country
          defaultCountry:DefaultCountry.Sri_Lanka,

          ///Disable country dropdown (Note: use it with default country)
          //disableCountry: true,

          ///selected item style [OPTIONAL PARAMETER]
          selectedItemStyle: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),

          ///DropdownDialog Heading style [OPTIONAL PARAMETER]
          dropdownHeadingStyle: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold),

          ///DropdownDialog Item style [OPTIONAL PARAMETER]
          dropdownItemStyle: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),

          ///Dialog box radius [OPTIONAL PARAMETER]
          dropdownDialogRadius: 10.0,

          ///Search bar radius [OPTIONAL PARAMETER]
          searchBarRadius: 10.0,

          ///triggers once country selected in dropdown
          onCountryChanged: (value) {
            setState(() {
              ///store value in country variable
              countryValue = value;
              if(value!='*Country'){
                widget.onChangedcn(value);}
            });
          },

          ///triggers once state selected in dropdown
          onStateChanged: (value) {
            setState(() {
              ///store value in state variable
              stateValue = value;
              if(value!='*State'){
                widget.onChangedstate(value);}
            });
          },

          ///triggers once city selected in dropdown
          onCityChanged: (value) {
            setState(() {
              ///store value in city variable
              cityValue = value;
              if(value!='*State'){
                widget.onChangedcity(value);}
            });
          },
        ),
    ),
        Container(height: 70,
            child: _buildDropButtonsms(maritems,dropdownValue1,'Marital Status *'),
        ),
        Container(height: 70,
          child:
          BorderedTextField(
            labelText: 'Number of Children*',
            keyboardType: TextInputType.number,
            onChanged: (value) => {
              setState(() {
                var age = value;
              }),
              widget.onChangeddiet(value)
            },
            textCapitalization: TextCapitalization.words,
          ),
       ),

       // _buildDropButtonsdiet(diettems,dropdownValue2,'Select Diet *'),
          SizedBox(height: 5),
        Container(height: 70,
          child:
      Text(
        'Your Height',
        style: TextStyle(color: Colors.white, fontSize: 15.0),
      ),
     ),
        Container(height: 70,child: htw())  ,
        Container(height: 70,

          child:
        // NumberPicker(
        //   value: _currentValue,
        //   minValue: 0,
        //   maxValue: 200,
        //   onChanged: (value) => setState(() => _currentValue = value),
        // ),
          Row(
            children: <Widget>[
              NumberPicker(
                itemHeight :25,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:  Colors.white,
                  ),
                  color: Colors.transparent,
                ),

                value: _currentValue,
                minValue: 0,
                maxValue: 200,
               // onChanged: (value) => setState(() =>  widget.onChangedweight(value.toString()),
            onChanged: (value) => {
              setState(() {
                _currentValue = value;
              }),
              widget.onChangedweight(value.toString())
            },

                //),
              ),
              SizedBox(width: 30,),
              Text('Your Weight: $_currentValue',style: TextStyle(color: Colors.white),),

            ],
          ),
        ),
      ],
    ),);
  }

  Widget _buildDropButtonsms(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        labelText: hintt,
      ),
      dropdownColor: Colors.transparent,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
      value: value,
      items: marils.map((maril map) {
        return new DropdownMenuItem<String>(
          value: map.name.toString(),
          child: Text(map.name??'',style: TextStyle(color: Colors.white, fontSize: 20.0)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select Marital Status*'){
          widget.onChangedmarit(value!);}
      },
    );


  }

  Widget _buildDropButtonsdiet(List<String> items,String? value,String? hintt) {
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
        if(value!='Your Diet'){
          widget.onChangeddiet(value!);}
      },
    );


  }



  Widget htw() {
    return Scaffold(
        body: Center(
            child: Row(
              children: [
                Container(
                  width: 168,
                  child: TextFormField(
                    onTap: selectedUnit == HeightUnit.ft
                        ? () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CupertinoPicker(
                                      itemExtent: 32.0,
                                      onSelectedItemChanged: (int index) {
                                        print(index + 1);
                                        setState(() {
                                          ft = (index + 1);
                                          heightController.text =
                                          "$ft' $inches\"";
                                          widget.onChangedht(heightController.text);
                                        });
                                      },
                                      children: List.generate(12, (index) {
                                        return Center(
                                          child: Text('${index + 1}'),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                          child: Text('ft',
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 16,
                                                color: Colors.black,
                                              )))),
                                  Expanded(
                                    child: CupertinoPicker(
                                      itemExtent: 32.0,
                                      onSelectedItemChanged: (int index) {
                                        print(index);
                                        setState(() {
                                          inches = (index);
                                          heightController.text =
                                          "$ft' $inches\"";
                                        });
                                      },
                                      children: List.generate(12, (index) {
                                        return Center(
                                          child: Text('$index'),
                                        );
                                      }),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                        child: Text('inches',
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 16,
                                              color: Colors.black,
                                            ))),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                        : null,
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style:TextStyle(color: Colors.white) ,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        hintText: selectedUnit == HeightUnit.ft ? "__' __\"" : '__',
                        hintStyle: TextStyle(color: Color(0xFFF5F5F5)),

                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                    ],
                  ),
                ),
                SizedBox(width: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (heightController.text.isEmpty) {
                          selectedUnit = HeightUnit.ft;
                        } else {
                          selectedUnit = HeightUnit.ft;
                          checkHeightUnit();
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedUnit == HeightUnit.ft
                              ? Color(0xFFFF7401)
                              : Colors.transparent,
                        ),
                        color: Colors.transparent,
                      ),
                      width: 31,
                      height: 31,
                      child: Center(child: Text('ft', style: TextStyle(fontSize: 16,color: Colors.white))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (heightController.text.isEmpty) {
                          selectedUnit = HeightUnit.cm;
                        } else {
                          selectedUnit = HeightUnit.cm;
                          checkHeightUnit();
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedUnit == HeightUnit.cm
                              ? Color(0xFFFF7401)
                              : Colors.transparent,
                        ),
                        color: Colors.transparent,
                      ),
                      width: 31,
                      height: 31,
                      child: Center(child: Text('cm', style: TextStyle(fontSize: 16,color: Colors.white))),
                    ),
                  ),
                ),
              ],
            )));
  }
  HeightUnit selectedUnit = HeightUnit.ft;
  TextEditingController heightController = TextEditingController();
  int ft = 0;
  int inches = 0;
  String cm="";

  cmToInches(inchess) {
    ft = inchess ~/ 12;
    inches = inchess % 12;
    print('$ft feet and $inches inches');
    widget.onChangedht(heightController.text);
  }

  inchesToCm() {
    int inchesTotal = (ft * 12) + inches;
    cm = (inchesTotal * 2.54).toStringAsPrecision(5);
    widget.onChangedht(heightController.text);
    heightController.text = cm;
  }

  void checkHeightUnit() {
    if (selectedUnit == HeightUnit.ft) {
      setState(() {
        int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
        cmToInches(inchess);
        widget.onChangedht(heightController.text);
        heightController.text = '$ft\' $inches"';
      });
    } else if (selectedUnit == HeightUnit.cm) {
      setState(() {
        print(heightController.text);
        inchesToCm();
      });
    }
  }

}
enum HeightUnit { ft, cm }