import 'package:cygnus/data/db/entity/fb.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class partnerq extends StatefulWidget {



  @override
  _partnerState createState() => _partnerState();
}

class _partnerState extends State<partnerq> {
  String countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String? address = "";
  double age = 100.0;
  List<String> maritems= ['Select Marital Status','Never Married','Divorced','Widowed','Awaiting Divorce','Annulled' ];
  String dropdownValue1 = 'Select Marital Status';
  List<String> diettems= ['Your Diet','Veg','Non-Veg','Occasionally Non-Veg','Eggetarian' ];
  String dropdownValue2= 'Your Diet';
  String? name = "";
  String? email = "";
  var _textEditingController = TextEditingController();
  @override
  void initState()  {

    super.initState();

    gett().then((data) {
      setState(() {
        this.email = data;
        _textEditingController.text=email!;

      });
    });

  }
  Future<String?> gett() async {


    name= (await SharedPreferencesUtil.getename());
    email= (await SharedPreferencesUtil.getemail())!;
    return email;
  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s Set up Your Account',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
        ),Center(
          child: BorderedTextField(
            textController: _textEditingController,

            labelText: 'E-mail',
            onChanged: (value) => {
              setState(() {
                var age = value;
              }),
              _textEditingController.text = value,
              _textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length)),

            },
            textCapitalization: TextCapitalization.words,
          ),
        ),Center(
          child: BorderedTextField(
            labelText: 'Password',
            obscureText: true,
            onChanged: (value) => {
              setState(() {
                var age = value;
              }),

            },
            textCapitalization: TextCapitalization.words,
          ),
        ),
        Center(
          child: BorderedTextField(
            labelText: 'Confirm Password',
            obscureText: true,
            onChanged: (value) => {
              setState(() {
                var age = value;
              }),

            },
            textCapitalization: TextCapitalization.words,
          ),
        ),
        SizedBox(height: 20),

        _buildDropButtonsms(maritems,dropdownValue1,'Marital Status *'),
        _buildDropButtonsdiet(diettems,dropdownValue2,'Select Diet *'),
        SizedBox(width: 55),
        Expanded(child:Text(
          'Your Height',
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        ),
        Expanded(child: htw())  ,

      ],
    );
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
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.white, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select Marital Status') {


        }
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

        }
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

  }

  inchesToCm() {
    int inchesTotal = (ft * 12) + inches;
    cm = (inchesTotal * 2.54).toStringAsPrecision(5);

    heightController.text = cm;
  }

  void checkHeightUnit() {
    if (selectedUnit == HeightUnit.ft) {
      setState(() {
        int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
        cmToInches(inchess);

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