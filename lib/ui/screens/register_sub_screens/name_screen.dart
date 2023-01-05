import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';

import '../../../data/model/maril.dart';
import '../../../data/model/planets.dart';
import '../../../data/model/rel.dart';
class NameScreen extends StatefulWidget {
  final Function(String) onChangedfn;
  final Function(String) onChangedln;
  final Function(String) onChangedfor;
  final Function(String) onChangedsex;
  final Function(String) onChangedrel;
  final Function(String) onChangeddt;
  const NameScreen({required this.onChangedfn,required this.onChangedln,required this.onChangedfor,required this.onChangedsex,required this.onChangedrel,required this.onChangeddt});


  @override
  State<NameScreen> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState  extends State<NameScreen> {
  String? name = "";
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
  String dropdownValue = 'Profile For *';
  String dropdownValue1 = 'Select Gender*';
  String dropdownValue2 = 'Select Religion*';
  List<String> foritems= ['Select Profile For*','Self', 'Son', 'Daughter', 'Brother','Sister','Friend','Relative'];
  // _MyStatefulWidgetState({required this.onChanged,required this.onChanged1});
  List<String> genitems= ['Select Gender*','Male', 'Female', 'Not Applicable', ];
  List<String> relitems= ['Select Religion*','Buddhist', 'Christian', 'Hindu', 'Muslim',];
  String? fname = "";
  String? lname = "";
  var _textEditingController = TextEditingController();
  var _textEditingController2 = TextEditingController();
  @override
  void initState()  {

    super.initState();

    gett().then((data) {
      setState(() {
        this.name = data;
        int idx =0;
        if(name!=null){
           idx = name!.indexOf(" ");
           fname=name!.substring(0,idx).trim();
           lname=name!.substring(idx+1).trim();
           _textEditingController.text=lname!;
           _textEditingController2.text=fname!;
           widget.onChangedln(lname!);
           widget.onChangedfn(fname!);
        }


      });
    });

  }
  Future<String?> gett() async {


    name= (await SharedPreferencesUtil.getename());

    return name;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: [
              Text(
                'Let\'s Set up Your Account',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),

            ],
          ),
        ),
        SizedBox(height: 25),_buildDropButtonsfor(foritems,dropdownValue,'Profile For *'),
        Center(
          child: BorderedTextField(
            labelText: 'First Name*',
            textController: _textEditingController2,
            onChanged: (value) => {
              setState(() {
                var age = value;
              }),
              _textEditingController2.text = value,
              _textEditingController2.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController2.text.length)),
              fname=value,
              widget.onChangedfn(value)
            },
            textCapitalization: TextCapitalization.words,
          ),
        ),Center(
          child: BorderedTextField(
            labelText: 'Last Name*',
            textController: _textEditingController,

            onChanged: (value1) => {
              setState(() {
                var age = value1;

              }),
    _textEditingController.text = value1,
    _textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length)),
              widget.onChangedln(value1)
            },
            textCapitalization: TextCapitalization.words,
          ),
        ),
    GestureDetector(
    onTap: () => _selectDate(context),
    child: AbsorbPointer(
    child: TextFormField(style:TextStyle(color: Colors.white, fontSize: 20.0) ,
    controller: _date,
    keyboardType: TextInputType.datetime,
    decoration: InputDecoration(enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white)) ,labelText: 'Date of Birth *',
    hintText:'Date of Birth',
    suffixIcon: Icon(
    Icons.dialpad,
    color: Colors.white,
    ),
    ),
    ),
    ),
    ),
        _buildDropButtonssex(genitems,dropdownValue1,'Gender *'),
        _buildDropButtonsrel(relitems,dropdownValue2,'Religion *'),

      ],
    ), );
  }
  Widget _buildDropButtons() {
  return DropdownButtonFormField<String>(

  decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white)),
  labelText: 'Profile For *',
  ),
dropdownColor: Colors.transparent,
  icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
  value: dropdownValue,
  items: ['Self', 'Son', 'Daughter', 'Brother','Sister','Friend','Relative']
      .map((label) => DropdownMenuItem(
  child: Text(label,style: TextStyle(color: Colors.white, fontSize: 20.0)),
  value: label,
  ))
      .toList(),
  onChanged: (value) {
  setState(() => dropdownValue = value!);
  },
  );


}
  Widget _buildDropButtonsfor(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        labelText: hintt,
      ),
      dropdownColor: Colors.transparent,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
      value: value,

        items: onbefs.map((maril map) {
                 return new DropdownMenuItem<String>(
                   value: map.name.toString(),
                   child:
                   Text(map.name??'',style: TextStyle(color: Colors.white, fontSize: 20.0)),

                 );
               }).toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Profile For *'){
        widget.onChangedfor(value!);}
      },
    );


  }
  Widget _buildDropButtonssex(List<String> items,String? value,String? hintt) {
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
        if(value!='Select Gender'){
          widget.onChangedsex(value!);
        }

      },
    );


  }
  Widget _buildDropButtonsrel(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)),
        labelText: hintt,
      ),
      dropdownColor: Colors.transparent,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.white),
      value: value,
      items: religions.map((rel map) {
        return new DropdownMenuItem<String>(
          value: map.name.toString(),
          child: Text(map.name??'',style: TextStyle(color: Colors.white, fontSize: 20.0)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select Religion*'){
          widget.onChangedrel(value!);
        }

      },
    );


  }
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        widget.onChangeddt(picked.toString());
        _date.value = TextEditingValue(text:"${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}");
      });
  }

}
