import 'dart:convert';
//import 'dart:html';

import 'package:csc_picker/csc_picker.dart';
import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/model/user_registration.dart';
import 'package:cygnus/data/model/userdet.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/register_sub_screens/add_photo_screen.dart';
import 'package:cygnus/ui/widgets/BorderedTextField2.dart';
import 'package:cygnus/ui/widgets/BorderedTextFieldnum.dart';
import 'package:cygnus/ui/widgets/bordered_text_field.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/shared_preferences_utils.dart';
import 'package:cygnus/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/model/maril.dart';
import '../../../data/model/planets.dart';
import '../../../data/model/rel.dart';
import '../top_navigation_screen.dart';
import 'SettingsPage.dart';
import 'SettingsTab.dart';
import 'package:http/http.dart' as http;

import 'UpdatePhoto.dart';



class EditProfilePage extends StatefulWidget {
  static const String id = 'EditProfilePage';
  int selectedPage;
  String tti;
  EditProfilePage(this.selectedPage,this.tti);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> with AutomaticKeepAliveClientMixin<EditProfilePage>{
  bool showPassword = false;
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();
  String dropdownValue = 'Select Profile For';
  String dropdownValue1 = 'Select Gender';
  String dropdownValue2 = 'Select Religion*';
  List<String> foritems= ['Select Profile For','Self', 'Son', 'Daughter', 'Brother','Sister','Friend','Relative'];
  // _MyStatefulWidgetState({required this.onChanged,required this.onChanged1});
  List<String> genitems= ['Select Gender','Male', 'Female', 'Not Applicable', ];
  List<String> relitems= ['Select Religion','Buddhist', 'Christian', 'Hindu', 'Muslim',];
  List<String> relitemsp= ['Partner Religion','Neglected','Buddhist', 'Christian', 'Hindu', 'Muslim',];
  String dropdownValue10 = 'Select Religion*';
  String? fname = "";
  String? lname = "";
  List<String> qitems= ['Your Education level*','Less than high school','High school','8 Pass','Up to O/L','Up to A/L','Diploma','Graduate','Ph.d','Master','Bachelor','MBA','BBM','BBA','IT Diploma','B.IT'  ];
  List<String> qitemsp= ['Partner Education level*','Neglected','Less than high school','High school','8 Pass','Up to O/L','Up to A/L','Diploma','Graduate','Ph.d','Master' ,'Bachelor','MBA','BBM','BBA','IT Diploma','B.IT'  ];
  String dropdownValue3 = 'Your Education level*';
  String dropdownValue11 = 'Partner Education level*';
  List<String> wkitems= ['You work with','Government','Private','Self Employed','Not Working' ];
  String dropdownValue4 = 'You work with';
  List<String> occitems= ['Occupation*','CEO','Manager','Doctor','Engineer','Teacher','Forces','Nurse','Businessmen','Banker','Accountant','Self Employee','Clark','House-Wife','Labour','Secretary','Administration & HR','Actor','Event Manager','Media Professional','Agriculture','Farming','Air Hostess','Designer','Artist','Web Designer','Beauty','Fashion','Jewellery','Beautician','Civil Service','Police','Army','Lecturer','Professor','Chef','Hotel','IT & Software','Legal','Lawyer','Sales & Marketing','Politician','Writer','Not Working','Other' ];
  List<String> occitemsp= ['Partner Occupation*','Neglected','CEO','Manager','Doctor','Engineer','Teacher','Forces','Nurse','Businessmen','Banker','Accountant','Self Employee','Clark','House-Wife','Labour','Secretary','Administration & HR','Actor','Event Manager','Media Professional','Agriculture','Farming','Air Hostess','Designer','Artist','Web Designer','Beauty','Fashion','Jewellery','Beautician','Civil Service','Police','Army','Lecturer','Professor','Chef','Hotel','IT & Software','Legal','Lawyer','Sales & Marketing','Politician','Writer','Not Working','Other' ];
  String dropdownValue12 = 'Partner Occupation*';
  String dropdownValue5 = 'Occupation*';
  List<String> incitems= ['Income','Below 500 USD','Above 1000 USD','Above 1500 USD','Above 3000 USD','Above 4500 USD','Above 6000 USD','Above 9000 USD','Above 12000 USD' ];
  List<String> incitemsp= ['Preferred Income','Neglected','Below 500 USD','Above 1000 USD','Above 1500 USD','Above 3000 USD','Above 4500 USD','Above 6000 USD','Above 9000 USD','Above 12000 USD' ];
  String dropdownValue13= 'Preferred Income';
  String dropdownValue6 = 'Income';
  List<String> maritems= ['Select Marital Status','Unmarried','Widow/Widower','Divorced','Separated','Limited to Signature' ];
  List<String> maritemsp= ['Partner Marital Status','Neglected','Unmarried','Widow/Widower','Divorced','Separated','Limited to Signature' ];
  String dropdownValue14 = 'Partner Marital Status';
  String dropdownValue7 = 'Select Marital Status';
  List<String> diettems= ['Your Diet','Veg','Non-Veg','Occasionally Non-Veg','Eggetarian' ];
  List<String> diettemsp= ['Partner Diet','Neglected','Veg','Non-Veg','Occasionally Non-Veg','Eggetarian' ];
  String dropdownValue15= 'Partner Diet';
  String dropdownValue8= 'USD';
  List<String> cigitems= ['Select','No','Occasionally','Special Moments','Yes' ];
  List<String> cigitemsp= ['Select','No','Occasionally','Special Moments','Yes' ];
  String dropdownValue16= 'Partner Cigarette and Alcohol Use';
  String dropdownValue17= 'Your Cigarette and Alcohol Use';
  List<String> curitems= ['Currency','USD','LKR','INR' ];
  String dropdownValue18 = 'USD';
  List<String> dritems= ['Select*','No','Occasionally','Special Moments','Yes' ];
  List<String> sisitems= ['Select*','No','1','2 ','3','4','5','6' ];
  String drval= 'Select*';
   String sisval= 'Select*';
  String brval= 'Select*';
  String skval= 'Select*';
  String drvalp= 'Select*';
  String sisvalp= 'Select*';
  String brvalp= 'Select*';
  String skvalp= 'Select*';
  PhoneNumberUtil plugin =new PhoneNumberUtil();
  var _textEditingController = TextEditingController();
  var _textEditingController2 = TextEditingController();
  var _textEditingController3 = TextEditingController();
  var _textEditingController4 = TextEditingController();
  var _textEditingController5 = TextEditingController();
  var _textEditingController13 = TextEditingController();
  var incomecotr = TextEditingController();
  final UserRegistration _userRegistration = UserRegistration();
  String countryValue="";

  String? cityValue="";

  String? stateValue="";
  String countryValue2="";

  String? cityValue2="";

  String? stateValue2="";

  String phone="";

  String ctcode="";

  String textcode="";
  UserProvider? _userProvider;

  String? uid="";
  userdet? userdet1;
  AppUser? user;
  bool _isLoading=false;
  List<String> lanlist = [];
  List<String> lanlistp = [];
  RangeValues _currentRangeValues = const RangeValues(16, 60);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState()  {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    gett2().then((data) {
      setState(() {


        gett(data).then((data2) {
          setState(() {
            if(userdet1!=null){

              _textEditingController.text=userdet1!.lastName!;
              _textEditingController2.text=userdet1!.firstName!;
              var dateTime = DateTime.parse(userdet1!.birthday!);
              var formate2 = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
              _date.value = TextEditingValue(text:"${formate2}");
              if(userdet1!.gender=='1'){
                dropdownValue1='Male';

              }else{
                dropdownValue1='Female';
              }
              if(userdet1!.sk.toString().isNotEmpty){
                skval=userdet1?.sk??'Select*';
              }

              if(userdet1!.dk.toString().isNotEmpty){
                drval=userdet1?.dk??'Select*';
              }
              if(userdet1!.skp.toString().isNotEmpty){
                skvalp=userdet1?.skp??'Select*';
              }
              if(userdet1!.dkp.toString().isNotEmpty){
                drvalp=userdet1?.dkp??'Select*';
              }
              if(userdet1!.br.toString().isNotEmpty){
                brval=userdet1?.br??'Select*';
              }
              if(userdet1!.sis.toString().isNotEmpty){
                sisval=userdet1?.sis??'Select*';
              }
              if(userdet1!.prefcur.toString().isNotEmpty){
                dropdownValue18=userdet1?.prefcur??'USD';
              }
              if(userdet1!.cityp.toString().isNotEmpty){
                cityValue2=userdet1?.cityp??'';
              }
              if(userdet1!.lans.toString().isNotEmpty){
                String lll=  userdet1?.lans??'';

                String lll1= lll.replaceAll('[', '');
                String lll2=  lll1.replaceAll(']', '');
                lanlist=lll2.split(',');
              }
              if(userdet1!.lansp.toString().isNotEmpty){
                String lll=  userdet1?.lansp??'';

                String lll1= lll.replaceAll('[', '');
                String lll2=  lll1.replaceAll(']', '');
                lanlistp=lll2.split(',');
              }

              dropdownValue2=userdet1?.religion??'Select Religion';
              dropdownValue3=userdet1?.degree??'Your Education level*';
              dropdownValue4=userdet1?.sector??'You work with';
              dropdownValue5=userdet1?.designation??'Occupation*';
              _textEditingController13.text=userdet1?.income??'';
              dropdownValue7=userdet1?.marital??'Select Marital Status*';

              if(userdet1!.curr!=null&&userdet1!.curr!=""){
                dropdownValue8= userdet1?.curr??"USD";
              }
              _textEditingController3.text=userdet1?.weight??'';
              countryValue=userdet1?.country??'';
              if(userdet1!.height!=null){
                heightController.text=userdet1?.height??'';
              }

              _textEditingController4.text=userdet1?.introduction??'';
              _textEditingController5.text=userdet1?.phone??'';
              //CSCPicker(currentCountry:userdet1.country!);
cityValue=userdet1?.city??'';
stateValue=userdet1?.state??'';
if(userdet1!.prefcntry!=null){
  countryValue2=userdet1?.prefcntry??'';
}


              if(userdet1!.prefst!=null){
                stateValue2=userdet1?.prefst??'';
              }
              if(userdet1!.prefrel!=null){
                dropdownValue10=userdet1?.prefrel??'';
              }
              if(userdet1!.prefedu!=null&&userdet1!.prefedu!.isNotEmpty) {
                dropdownValue11=userdet1?.prefedu??'';
              }
              if(userdet1!.profession!=null&&userdet1!.profession!.isNotEmpty) {
                dropdownValue12=userdet1?.profession??'';
              }


              if(userdet1!.prefincome!=null&&userdet1!.prefincome!.isNotEmpty) {
                incomecotr.text = userdet1?.prefincome??'';
              }
              if(userdet1!.prefms!=null&&userdet1!.prefms!.isNotEmpty) {
                dropdownValue14=userdet1?.prefms??'';
              }

              if(userdet1!.prefdiet!=null&&userdet1!.prefdiet!.isNotEmpty) {
                dropdownValue15=userdet1?.prefdiet??'';
              }
              if(userdet1!.agemin!=null&&userdet1!.agemax!=null) {
                _currentRangeValues=new RangeValues(double.parse(userdet1!.agemin as String), double.parse(userdet1?.agemax??'' as String));

              }


            }





          });
        });



      });
    });

  }
  Future<String?> gett2() async {


    uid= (await SharedPreferencesUtil.getUserId());
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    user= parsePhotos(shared_User.getString('user').toString()).first;
    return uid;
  }
  Future<userdet?> gett(String? mid) async {

      await _userProvider!
        .getUserdet(mid!)
        .then((response) {
        userdet1=response;
      return response;
    });


  }


  List<AppUser> parsePhotos(String? responseBody) {
    final parsed = jsonDecode(responseBody.toString()).cast<Map<String, dynamic>>();

    return parsed.map<AppUser>((json) => AppUser.fromJson(json)).toList();
  }


  @override
  Widget build(BuildContext context) {
    if(userdet1!=null){
    return DefaultTabController(animationDuration: Duration.zero,
      initialIndex:widget.selectedPage,
      length: 2,
      child:
       DecoratedBox(
    decoration: const BoxDecoration(
    color: Colors.white,

    ),
    child:
        Padding(
        padding: kDefaultPadding,
        child: Scaffold(
        appBar: AppBar(
          title:  Text(
            widget.tti,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),
          ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            if(widget.tti=='Add your Partner Preference'){
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => TopNavigationScreen(1,0,0)));
            }
            else{
              Navigator.pop(context);
            }

          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => SettingsPage()));
              Navigator.pushNamed(context, SettingsPage.id,arguments: {"name" :
              user!.id});
            },
          ),
        ],
      ),
        body:

       // SingleChildScrollView(
          // scrollDirection:  Axis.vertical,
          //color: Colors.white,
         // child:

        Column(
          children: <Widget>[
            // construct the profile details widget here
            SizedBox(height: 10),

        SizedBox(
          height: 15,
        ),
        Center(
          child: Stack(
            children: [

              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(user!.profilePhotoPath
                        ))),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child:
                  GestureDetector(
                    onTap: () =>Navigator.pushNamed(context, UpdatePhoto.id,arguments: {"name" :
                    uid})


                    ,
                    child:
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Colors.green,
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
              ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 35,
        ),

            // the tab bar with two items

            SizedBox(
              height: 80,
              child: AppBar(backgroundColor: Colors.green,
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Profile',
                      icon: Icon(Icons.person),
                    ),
                    Tab( text: 'Partner',
                      icon: Icon(
                        Icons.people_outlined,
                      ),
                    ),
                  ],
                ),
              ),

          ),
            // create widgets for each tab bar here
          Expanded(
              child: TabBarView(

                children: [
                  SingleChildScrollView(child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:[
                   // first tab bar view widget
                   BorderedTextField2(
                     labelText: 'First Name',
                     textController: _textEditingController2,
                     onChanged: (value) => {
                       setState(() {
                         var age = value;
                       }),
                       _textEditingController2.text = value,
                       _textEditingController2.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController2.text.length)),
                       fname=value,

                     },
                     textCapitalization: TextCapitalization.words,
                   ),
                   BorderedTextField2(
                     labelText: 'Last Name',
                     textController: _textEditingController,

                     onChanged: (value1) => {
                       setState(() {
                         var age = value1;

                       }),
                       _textEditingController.text = value1,
                       _textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController.text.length)),

                     },
                     textCapitalization: TextCapitalization.words,
                   ),
                   GestureDetector(
                     onTap: () => _selectDate(context),
                     child: AbsorbPointer(
                       child: TextFormField(style:TextStyle(color: Colors.black, fontSize: 20.0) ,
                         controller: _date,
                         keyboardType: TextInputType.datetime,
                         decoration: InputDecoration(enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.black)) ,labelText: 'Date of Birth ',labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                           hintText:'Date of Birth',hintStyle:TextStyle(color: Colors.black, fontSize: 20.0),
                           suffixIcon: Icon(
                             Icons.dialpad,
                             color: Colors.black,
                           ),
                         ),
                       ),
                     ),
                   ),
                   _buildDropButtonssex(genitems,dropdownValue1,'Gender'),
                   _buildDropButtonsrel(relitems,dropdownValue2,'Religion'),
                    Container(
                      
                      child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('Languages'),
                        DropDownMultiSelect(

                        onChanged: (List<String> x) {
                          setState(() {
                            lanlist =x;

                          });
                        },
                        options: langst,
                        selectedValues: lanlist,
                        whenEmpty: 'Select Language',
                      ),])  ),

                      _buildDropButtonsdk(dritems,drval,'Drink*'),
                      _buildDropButtonssk(dritems,skval,'Smoke*'),
                      _buildDropButtonsbr(sisitems,brval,'Brothers*'),
                      _buildDropButtonssis(sisitems,sisval,'Sisters*'),

                   _buildDropButtonquli(qitems,dropdownValue3,'Your Education level*'),
                   _buildDropButtonwk(wkitems,dropdownValue4,'You work with'),
                   _buildDropButtonocc(occitems,dropdownValue5,'Occupation'),

                      BorderedTextField2 (
                     labelText: 'Your weight',
                     textController: _textEditingController3,
keyboardType: TextInputType.number,
                     onChanged: (value1) => {
                       setState(() {
                         var age = value1;

                       }),
                        _textEditingController3.text = value1,
                        _textEditingController3.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController3.text.length)),

                     },
                     textCapitalization: TextCapitalization.words,
                   ),
                      BorderedTextField2(
                        labelText: 'Monthly Income',
                        textController: _textEditingController13,
                        keyboardType: TextInputType.number,


                        onChanged: (value1) => {
                          setState(() {
                            var age = value1;

                          }),
                          _textEditingController13.text = value1,
                          _textEditingController13.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController13.text.length)),

                        },
                        textCapitalization: TextCapitalization.words,
                      ),
                      _buildDropButtonincr(curitems,dropdownValue8,'Currency'),
                     // _buildDropButtonsdiet(curitems,dropdownValue8,'Currency'),
                  // _buildDropButtoninc(incitems,dropdownValue6,'Monthly Income USD'),
                       _buildDropButtonsms(maritems,dropdownValue7,'Marital Status'),

                      SizedBox(height: 10),
                       cntryp(),
                      SizedBox(height: 10),
                      Container(height: 30,
                        child:Text(
                        'Your Height',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      ),

                      Container(height: 30,
                        child:htw(),
                      ),
                      SizedBox(height: 20),
                      Container(height: 60,
                        child:  TextFormField(
controller:_textEditingController4 ,
                          minLines: 5,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          style:  TextStyle(
                              color: Colors.black
                          ),
                          onChanged: (value) => {
                            setState(() {
                              var age = value;
                            }),
                            _textEditingController4.text = value,
                            _textEditingController4.selection = TextSelection.fromPosition(TextPosition(offset: _textEditingController4.text.length)),

                            //widget.onChangedab(value)
                          },
                          decoration: InputDecoration(

                            hintText: 'About Your self*',
                            hintStyle: TextStyle(
                                color: Colors.black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                Container(height: 70,
                   child:  Row(
                        children:[
                          Container(
                            decoration: new BoxDecoration(
                              color:Colors.transparent,
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(8.0),
                              border: Border.all(),
                              // boxShadow: <BoxShadow>[
                              //   new BoxShadow(
                              //     color: Colors.black12,
                              //     blurRadius: 10.0,
                              //     offset: new Offset(0.0, 10.0),
                              //   ),
                              // ],
                            ),

width: 100,
                            height: 60,
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
                          SizedBox(width: 10,),
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
                      SizedBox(height: 10),
                      Container(height: 60,
                        child:
                      RoundedOutlinedButton(
                          text: 'UPDATE',
                          onPressed:fun2 ),),
                ],
                  ),),
                  // second tab bar viiew widget
                  SingleChildScrollView(child:Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:[
                      // first tab bar view widget


                      _buildDropButtonsrelp(relitemsp,dropdownValue10,'Religion should be'),
                      _buildDropButtonqulip(qitemsp,dropdownValue11,'Education should be'),

                      _buildDropButtonoccp(occitemsp,dropdownValue12,'Job Status should be'),
                      Container(

                          child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text('Languages'),
                                DropDownMultiSelect(

                                  onChanged: (List<String> x) {
                                    setState(() {
                             if(!lanlistp.contains(x)){

                               lanlistp =x;
                             }


                                    });
                                  },
                                  options: langst,
                                  selectedValues: lanlistp,
                                  whenEmpty: 'Select Language',
                                ),])  ),

                      _buildDropButtonsdkp(dritems,drvalp,'Drink*'),
                      _buildDropButtonsskp(dritems,skvalp,'Smoke*'),


                      BorderedTextField2(
                        labelText: 'Income should be',
                        textController: incomecotr,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => {
                          setState(() {
                            var age = value;
                          }),
                          incomecotr.text = value,
                          incomecotr.selection = TextSelection.fromPosition(TextPosition(offset: incomecotr.text.length)),
                          dropdownValue13=value,

                        },
                        textCapitalization: TextCapitalization.words,
                      ),
                      _buildDropButtonincrp(incitemsp,dropdownValue18,'Currency'),
                    //  _buildDropButtonincp(incitemsp,dropdownValue13,'Income should be'),
                      _buildDropButtonsmsp(maritemsp,dropdownValue14,'Marital Status should be'),
                      //_buildDropButtonsdietp(diettemsp,dropdownValue15,'Diet should be'),
                      SizedBox(height: 10),
                      Container(height: 30,
                          child:Text('Country and District should be')),
                      cntryp2(),
                      SizedBox(height: 10),
                      // Container(height: 30,
                      //   child:Text(
                      //     'Height should be',
                      //     style: TextStyle(color: Colors.black, fontSize: 15.0),
                      //   ),
                      // ),

                      // Container(height: 30,
                      //   child:htw2(),
                      // ),
                    SizedBox(height: 10),

                      Container(height: 30,
                          child:Text('Age should be')
                      ),
                      Container(height: 30,
                          child:Text(_currentRangeValues.start.round().toString()+' to '+_currentRangeValues.end.round().toString())
                      ),
                      ageselect(),

                      SizedBox(height: 10),
                      Container(height: 60,
                        child:
                        RoundedOutlinedButton(
                            text: 'SAVE',
                            onPressed:fun3 ),),
                    ],
                  ),),
                ],
              ),
            ),
          ],
        ),
     // ),
      ),
        ),
       ),
    );
    }
    else{
      return CustomModalProgressHUD(
        inAsyncCall: true,
        child:
       DefaultTabController(animationDuration: Duration.zero,
      length: 2,
      child:
      DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,

        ),
        child:
        Padding(
          padding: kDefaultPadding,
          child: Scaffold(
            appBar: AppBar(
              title:  Text(
                widget.tti,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.black),
              ),
              backgroundColor: Colors.white,
              elevation: 1,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.green,
                ),
                onPressed: () {
                  if(widget.tti=='Add your Partner Preference'){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => TopNavigationScreen(1,0,0)));
                  }
                  else{
                    Navigator.pop(context);
                  }
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => SettingsPage()));
                    Navigator.pushNamed(context, SettingsPage.id,arguments: {"name" :
                    user!.id});
                  },
                ),
              ],
            ),
            body:

            Container(

              color: Colors.white,
              child:

              Column(
                children: <Widget>[
                  // construct the profile details widget here


                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [

                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imgpath+'profile.png',
                                  )

                              )),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),

                  // the tab bar with two items

                  SizedBox(
                    height: 80,
                    child: AppBar(backgroundColor: Colors.green,
                      bottom: TabBar(
                        isScrollable: true,
                        tabs: [
                          Tab(text: 'Profile',
                            icon: Icon(Icons.person),
                          ),
                          Tab( text: 'Partner',
                            icon: Icon(
                              Icons.people_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                  // create widgets for each tab bar here
                  Expanded(
                    child: TabBarView(
                      children: [
                      //  SingleChildScrollView(

                        //  child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children:[
                              // first tab bar view widget
                             Container(),
                            ],
                          ),
                        //),
                        // second tab bar viiew widget
                        Container(
                          color: Colors.pink,
                          child: Center(
                            child: Text(
                              'Car',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );}
  }
  Future<void> fun2() async {



    _userRegistration.state=stateValue;
    _userRegistration.city=cityValue;
    _userRegistration.country=countryValue;
    _userRegistration.phone=_textEditingController5.text;
    _userRegistration.height=heightController.text;
    _userRegistration.company=_textEditingController3.text;
    _userRegistration.curr=dropdownValue8;
    _userRegistration.marital=dropdownValue7;
    _userRegistration.income=_textEditingController13.text;
    _userRegistration.religion=dropdownValue2;
    _userRegistration.dob=_date.text;
    _userRegistration.work=dropdownValue4;
    _userRegistration.occup=dropdownValue5;
    _userRegistration.about=_textEditingController4.text;
    _userRegistration.sex=dropdownValue1;
    _userRegistration.qualify=dropdownValue3;
    _userRegistration.fn=_textEditingController2.text;
    _userRegistration.ln=_textEditingController.text;
    _userRegistration.email=uid!;
    _userRegistration.sk=skval;
    _userRegistration.dk=drval;
    _userRegistration.br=brval;
    _userRegistration.sis=sisval;
    _userRegistration.langs=lanlist.toString();
    _userRegistration.weight=_textEditingController3.text;
    updateUser();
  //  bool isValid = await plugin.validate(ctcode+phone,textcode);
    //print(isValid);
  }
  Future<void> fun3() async {


    _userRegistration.email=uid!;
    _userRegistration.state=stateValue2;
   // _userRegistration.city=cityValue;
    _userRegistration.country=countryValue2;
   // _userRegistration.phone=_textEditingController5.text;
   // _userRegistration.height=heightController2.text;
   // _userRegistration.company=_textEditingController3.text;
    _userRegistration.diet=dropdownValue15;
    _userRegistration.marital=dropdownValue14;
    _userRegistration.income=incomecotr.text;
    _userRegistration.religion=dropdownValue10;
   // _userRegistration.dob=_date.text;
   _userRegistration.prefcur=dropdownValue18;
    _userRegistration.occup=dropdownValue12;
  //  _userRegistration.about=_textEditingController4.text;
    _userRegistration.city=cityValue2;
    _userRegistration.qualify=dropdownValue11;
    _userRegistration.fn=_currentRangeValues.start.round().toString();
    _userRegistration.ln=_currentRangeValues.end.round().toString();
   // _userRegistration.email=uid!;
    _userRegistration.skp=skvalp;
    _userRegistration.dkp=drvalp;
    _userRegistration.langsp=lanlistp.toString();
    if(_userRegistration.qualify=='Partner highest qualification'||_userRegistration.occup=='Partner Occupation'||  _userRegistration.religion=='Partner Religion'||_userRegistration.income=='Preferred Income'||_userRegistration.marital=='Partner Marital Status'||_userRegistration.email.isEmpty|| _userRegistration.state=='Select State'|| _userRegistration.country=='Select Country'){

      showSnackBar(
          context, 'Please fill all fields!');
    }else{

      updatepartner();
    }


   
    //  bool isValid = await plugin.validate(ctcode+phone,textcode);
    //print(isValid);
  }
  updateUser() async {





      setState(() {
        _isLoading = true;
      });

      await _userProvider!
          .updateUser(_userRegistration)
          .then((response) {
        if (response=='200') {
          Navigator.pop(context);
          Navigator.pushNamed(context, TopNavigationScreen.id);
        }else{
          showSnackBar(
              context, 'Check Your Network!');
          _userProvider!
              .updateUser(_userRegistration)
              .then((response) {
            if (response=='200') {
               Navigator.pop(context);
              // Navigator.pushNamed(context, SettingsTab.id);
              showSnackBar(
                  context, 'Updated!');
            }else{
              showSnackBar(
                  context, 'Network Error Please Try Again Later!');

            }
          });

        }
      });

      setState(() {
        _isLoading = false;
      });
  }
  updatepartner() async {





    setState(() {
      _isLoading = true;
    });

    await _userProvider!
        .updatepartner(_userRegistration)
        .then((response) {
      if (response=='200') {
        Navigator.pop(context);
        Navigator.pushNamed(context, TopNavigationScreen.id);
      }else{
        showSnackBar(
            context, 'Check Your Network!');
        _userProvider!
            .updatepartner(_userRegistration)
            .then((response) {
          if (response=='200') {
            Navigator.pop(context);
            // Navigator.pushNamed(context, SettingsTab.id);
            showSnackBar(
                context, 'Updated!');
          }else{
            showSnackBar(
                context, 'Network Error Please Try Again Later!');

          }
        });

      }
    });

    setState(() {
      _isLoading = false;
    });
  }
Widget ageselect(){
  return RangeSlider(
    values: _currentRangeValues,
    min: 16,
    max: 60,
    divisions: 54,
    labels: RangeLabels(
      _currentRangeValues.start.round().toString(),
      _currentRangeValues.end.round().toString(),
    ),
    onChanged: (RangeValues values) {
      setState(() {
        _currentRangeValues = values;

      });
    },
  );
}

  Widget _buildDropButtonincr(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: dropdownValue8,
      items:curry.map((maril map) {
        return new DropdownMenuItem<String>(
          value: map.name.toString(),
          child:
          Text(map.name??'',style: TextStyle(color: Colors.black, fontSize: 17.0)),

        );
      }).toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Currency*'){
          dropdownValue8=value??'';}
      },
    );


  }
  Widget _buildDropButtonincrp(List<String> items,String? value,String? hintt) {


    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: dropdownValue18,
      items:curry.map((maril map) {
      return new DropdownMenuItem<String>(
        value: map.name.toString(),
        child:
        Text(map.name??'',style: TextStyle(color: Colors.black, fontSize: 17.0)),

      );
    }).toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Currency*'){
          dropdownValue18=value??'';}

      },
    );

  }
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }


  Widget _buildDropButtonssex(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
        labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select Gender'){
          dropdownValue1=value!;
        }

      },
    );


  }
  Widget _buildDropButtonsrel(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
        labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: religions.map((rel map) {
        return new DropdownMenuItem<String>(
          value: map.name.toString(),
          child: Text(map.name??'',style: TextStyle(color: Colors.black, fontSize: 17.0)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select Religion*'){
          dropdownValue2=value!;
        }

      },
    );


  }
  Widget _buildDropButtonsrelp(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: religions.map((rel map) {
        return new DropdownMenuItem<String>(
          value: map.name.toString(),
          child: Text(map.name??'',style: TextStyle(color: Colors.black, fontSize: 17.0)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select Religion*'){
          dropdownValue10=value!;
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
       // widget.onChangeddt(picked.toString());
        _date.value = TextEditingValue(text:"${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}");
      });
  }
  Widget _buildDropButtonquli(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
        labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Your highest qualification'){
          dropdownValue3=value!;
        }
      },
    );


  }
  Widget _buildDropButtonqulip(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Partner highest qualification'){
          dropdownValue11=value!;
        }
      },
    );


  }
  Widget _buildDropButtonwk(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
        labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='You work with'){
          dropdownValue4=value!;

        }
      },
    );


  }
  Widget _buildDropButtonocc(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
        labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Occupation*'){
          dropdownValue5=value!;
         // widget.OnChangedocc(value);

        }
      },
    );


  }
  Widget _buildDropButtonoccp(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Partner Occupation'){
          dropdownValue12=value!;
          // widget.OnChangedocc(value);

        }
      },
    );


  }
  Widget _buildDropButtoninc(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
        labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Income'){
          dropdownValue6=value!;
          //widget.passwordOnChanged(value);
    }
      },
    );


  }
  Widget _buildDropButtonincp(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Preferred Income'){
          dropdownValue13=value!;
          //widget.passwordOnChanged(value);
        }
      },
    );


  }
  Widget _buildDropButtonsms(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
        labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select Marital Status'){
          //widget.onChangedmarit(value!);
          dropdownValue7=value!;
        }
      },
    );


  }
  Widget _buildDropButtonsmsp(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 18.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Partner Marital Status'){
          //widget.onChangedmarit(value!);
          dropdownValue14=value!;
        }
      },
    );


  }
  Widget _buildDropButtonsdiet(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
        labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 17.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Your Diet'){
          //widget.onChangeddiet(value!);
          dropdownValue8=value!;
        }
      },
    );


  }
  Widget _buildDropButtonsdietp(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Partner Diet'){
          //widget.onChangeddiet(value!);
          dropdownValue15=value!;
        }
      },
    );


  }
  Widget _buildDropButtonscig(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 20.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select'){
          //widget.onChangeddiet(value!);
        }
      },
    );


  }
Widget cntryp(){
  return CSCPicker(
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
    countrySearchPlaceholder: "Country",
    stateSearchPlaceholder: "State",
    citySearchPlaceholder: "City",

    ///labels for dropdown
    countryDropdownLabel: "*Country",
    stateDropdownLabel: "*State",
    cityDropdownLabel: "*City",

    ///Default Country
    defaultCountry:null,
    currentCountry: countryValue,
    currentCity: cityValue,
    currentState: stateValue,

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
        currentCountry: countryValue;
        countryValue = value;
        if(value!='*Country'){
         // widget.onChangedcn(value);
        }
      });
    },

    ///triggers once state selected in dropdown
    onStateChanged: (value) {
      setState(() {
        ///store value in state variable
        stateValue = value;
        if(value!='*State'){
         // widget.onChangedstate(value);
        }
      });
    },

    ///triggers once city selected in dropdown
    onCityChanged: (value) {
      setState(() {
        ///store value in city variable
        cityValue = value;
        if(value!='*State'){
          //widget.onChangedcity(value);
        }
      });
    },
  );
}
  Widget cntryp2(){
    return CSCPicker(
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
      countrySearchPlaceholder: "Country",
      stateSearchPlaceholder: "State",
      citySearchPlaceholder: "City",

      ///labels for dropdown
      countryDropdownLabel: "*Country",
      stateDropdownLabel: "*State",
      cityDropdownLabel: "*City",

      ///Default Country
      defaultCountry:DefaultCountry.Sri_Lanka,
      currentCountry: countryValue2,
      currentCity: cityValue2,
      currentState: stateValue2,

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
          currentCountry: countryValue2;
          countryValue2 = value;
          if(value!='*Country'){
            // widget.onChangedcn(value);
          }
        });
      },

      ///triggers once state selected in dropdown
      onStateChanged: (value) {
        setState(() {
          ///store value in state variable
          stateValue2 = value;
          if(value!='*State'){
            // widget.onChangedstate(value);
          }
        });
      },

      ///triggers once city selected in dropdown
      onCityChanged: (value) {
        setState(() {
          ///store value in city variable
          cityValue2 = value;
          if(value!='*State'){
            //widget.onChangedcity(value);
          }
        });
      },
    );
  }
  Widget htw() {
    return Scaffold(
        body: Center(
            child: Row(
              children: [
                Container(
                  height: 100,
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
                                          //widget.onChangedht('$ft\' $inches"');
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
                    style:TextStyle(color: Colors.black) ,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: selectedUnit == HeightUnit.ft ? "__' __\"" : '__',
                        hintStyle: TextStyle(color: Color(0xFF1C1919)),

                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
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
                      child: Center(child: Text('ft', style: TextStyle(fontSize: 16,color: Colors.black))),
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
                      child: Center(child: Text('cm', style: TextStyle(fontSize: 16,color: Colors.black))),
                    ),
                  ),
                ),
              ],
            )));
  }
  Widget _buildDropButtonsskp(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 18.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          skvalp=value.toString();
        }
      },
    );


  }
  Widget _buildDropButtonsdkp(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 18.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          drvalp=value.toString();}
      },
    );


  }

  Widget _buildDropButtonssk(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 18.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          skval=value.toString();
        }
      },
    );


  }
  Widget _buildDropButtonsdk(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 18.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
         drval=value.toString();}
      },
    );


  }
  Widget _buildDropButtonssis(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 18.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          sisval=value.toString();}
      },
    );


  }
  Widget _buildDropButtonsbr(List<String> items,String? value,String? hintt) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration( enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: hintt,labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)
      ),
      dropdownColor: Colors.white,
      icon:   const Icon(Icons.arrow_drop_down_circle,color: Colors.black),
      value: value,
      items: items
          .map((label) => DropdownMenuItem(
        child: Text(label,style: TextStyle(color: Colors.black, fontSize: 18.0)),
        value: label,
      ))
          .toList(),
      onChanged: (value) {
        setState(() => value = value!);
        if(value!='Select*'){
          brval=value.toString();}
      },
    );


  }

  Widget htw2() {
    return Scaffold(
        body: Center(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 168,
                  child: TextFormField(
                    onTap: selectedUnit2 == HeightUnit.ft
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
                                          ft2 = (index + 1);
                                          heightController2.text =
                                          "$ft2' $inches2\"";
                                          //widget.onChangedht('$ft\' $inches"');
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
                                          inches2 = (index);
                                          heightController2.text =
                                          "$ft2' $inches2\"";
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
                    controller: heightController2,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style:TextStyle(color: Colors.black) ,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: selectedUnit2 == HeightUnit.ft ? "__' __\"" : '__',
                        hintStyle: TextStyle(color: Color(0xFF1C1919)),

                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
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
                        if (heightController2.text.isEmpty) {
                          selectedUnit2 = HeightUnit.ft;
                        } else {
                          selectedUnit2 = HeightUnit.ft;
                          checkHeightUnit();
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedUnit2 == HeightUnit.ft
                              ? Color(0xFFFF7401)
                              : Colors.transparent,
                        ),
                        color: Colors.transparent,
                      ),
                      width: 31,
                      height: 31,
                      child: Center(child: Text('ft', style: TextStyle(fontSize: 16,color: Colors.black))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (heightController2.text.isEmpty) {
                          selectedUnit2 = HeightUnit.cm;
                        } else {
                          selectedUnit2 = HeightUnit.cm;
                          checkHeightUnit();
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: selectedUnit2 == HeightUnit.cm
                              ? Color(0xFFFF7401)
                              : Colors.transparent,
                        ),
                        color: Colors.transparent,
                      ),
                      width: 31,
                      height: 31,
                      child: Center(child: Text('cm', style: TextStyle(fontSize: 16,color: Colors.black))),
                    ),
                  ),
                ),
              ],
            )));
  }
  HeightUnit selectedUnit = HeightUnit.ft;
  HeightUnit selectedUnit2 = HeightUnit.ft;
  TextEditingController heightController = TextEditingController();
  TextEditingController heightController2 = TextEditingController();
  int ft = 0;
  int inches = 0;
  String cm="";
  int ft2 = 0;
  int inches2 = 0;
  String cm2="";
  cmToInches(inchess) {
    ft = inchess ~/ 12;
    inches = inchess % 12;
    print('$ft feet and $inches inches');
   // widget.onChangedht('$ft\' $inches"');
  }

  inchesToCm() {
    int inchesTotal = (ft * 12) + inches;
    cm = (inchesTotal * 2.54).toStringAsPrecision(5);
    //widget.onChangedht('$ft\' $inches"');
    heightController.text = cm;
  }

  void checkHeightUnit() {
    if (selectedUnit == HeightUnit.ft) {
      setState(() {
        int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
        cmToInches(inchess);
       // widget.onChangedht('$ft\' $inches"');
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