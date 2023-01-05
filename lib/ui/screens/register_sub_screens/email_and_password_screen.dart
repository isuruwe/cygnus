import 'package:cygnus/ui/widgets/BorderedTextFieldnum.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';

import '../../../data/model/maril.dart';
import '../../../data/model/planets.dart';

class EmailAndPasswordScreen extends StatefulWidget {
  final Function(String?) emailOnChanged;
  final Function(String?) passwordOnChanged;
  final Function(String?) OnChangedquli;
  final Function(String?) OnChangedwork;
  final Function(String?) OnChangedocc;

  EmailAndPasswordScreen(
      {required this.emailOnChanged, required this.passwordOnChanged, required this.OnChangedquli, required this.OnChangedwork, required this.OnChangedocc});
  @override
  _epScreenState createState() => _epScreenState();
}

class _epScreenState extends State<EmailAndPasswordScreen> {
  List<String> qitems= ['Your Education level*','Less than high school','High school','8 Pass','Up to O/L','Up to A/L','Diploma','Graduate','Ph.d','Master' ,'Bachelor'  ,'MBA','BBM','BBA','IT Diploma','B.IT'     ];
  String dropdownValue1 = 'Your Education level*';
  List<String> wkitems= ['You work with*','Government','Private','Self Employed','Not Working' ];
  String dropdownValue2 = 'You work with*';
  List<String> occitems= ['Occupation*','CEO','Manager','Doctor','Engineer','Teacher','Forces','Nurse','Businessmen','Banker','Accountant','Self Employee','Clark','House-Wife','Labour','Secretary','Administration & HR','Actor','Event Manager','Media Professional','Agriculture','Farming','Air Hostess','Designer','Artist','Web Designer','Beauty','Fashion','Jewellery','Beautician','Civil Service','Police','Army','Lecturer','Professor','Chef','Hotel','IT & Software','Legal','Lawyer','Sales & Marketing','Politician','Writer','Not Working','Other' ];
  String dropdownValue3 = 'Occupation*';
  List<String> incitems= ['Monthly income*','Below 500 USD','Above 1000 USD','Above 1500 USD','Above 3000 USD','Above 4500 USD','Above 6000 USD','Above 9000 USD','Above 12000 USD' ];
  String dropdownValue4 = 'Monthly income*';
  List<String> curitems= ['Currency*','USD','LKR','INR' ];
  String dropdownValue5 = 'USD';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:

      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Center( child: Text(
          'Just a few more steps',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
        )),
    Center( child: Text(
          'Please add your education & career details',
      style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),),
        SizedBox(height: 25),
        _buildDropButtonquli(qitems,dropdownValue1,'Your Education level *'),
        _buildDropButtonwk(wkitems,dropdownValue2,'You work with *'),
        _buildDropButtonocc(occitems,dropdownValue3,'Occupation *'),
        BorderedTextField(
          labelText: 'Monthly income*',
          onChanged: widget.emailOnChanged,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 5),
        _buildDropButtoninc(curitems,dropdownValue5,'Currency*'),
        // BorderedTextFieldnum(
        //   labelText: 'Annual Income*',
        //   onChanged: widget.passwordOnChanged,
        //
        // ),
       // _buildDropButtoninc(occitems,dropdownValue3,'Occupation *'),
      ],
    ),);
  }

  Widget _buildDropButtonquli(List<String> items,String? value,String? hintt) {
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
        if(value!='Your Education level*'){
          widget.OnChangedquli(value);}
      },
    );


  }
  Widget _buildDropButtonwk(List<String> items,String? value,String? hintt) {
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
        if(value!='You work with'){
          widget.OnChangedwork(value);}
      },
    );


  }
  Widget _buildDropButtonocc(List<String> items,String? value,String? hintt) {
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
        if(value!='Occupation'){
          widget.OnChangedocc(value);}
      },
    );


  }
  Widget _buildDropButtoninc(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        labelText: hintt,
      ),
      dropdownColor: Colors.transparent,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
      value: value,
      items:curry.map((maril map) {
        return new DropdownMenuItem<String>(
          value: map.name.toString(),
          child:
          Text(map.name??'',style: TextStyle(color: Colors.white, fontSize: 20.0)),

        );
      }).toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Currency*'){
          widget.passwordOnChanged(value);}
      },
    );


  }
}
