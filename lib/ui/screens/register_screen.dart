import 'package:cygnus/ui/screens/register_sub_screens/aboutinfo.dart';
import 'package:cygnus/ui/screens/register_sub_screens/terms.dart';
import 'package:cygnus/ui/widgets/rounded_outlined_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:cygnus/data/db/remote/response.dart';
import 'package:cygnus/data/model/user_registration.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/register_sub_screens/add_photo_screen.dart';
import 'package:cygnus/ui/screens/register_sub_screens/age_screen.dart';
import 'package:cygnus/ui/screens/register_sub_screens/email_and_password_screen.dart';
import 'package:cygnus/ui/screens/register_sub_screens/name_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/widgets/custom_modal_progress_hud.dart';
import 'package:cygnus/ui/widgets/rounded_button.dart';
import 'package:cygnus/util/constants.dart';
import 'package:cygnus/util/utils.dart';
import 'package:cygnus/ui/screens/start_screen.dart';

import '../../util/shared_preferences_utils.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final UserRegistration _userRegistration = UserRegistration();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final int _endScreenIndex = 5;
  int _currentScreenIndex = 0;
  int _errorIndex = 0;
  bool _isLoading = false;
  UserProvider? _userProvider;
  bool istac = false;
  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }






   registerUser() async {


     WidgetsBinding.instance.addPostFrameCallback((_) async {


    setState(() {
      _isLoading = true;
    });

    await _userProvider!
        .registerUser(_userRegistration, _scaffoldKey)
        .then((response) {
      if (response=='200') {
        Navigator.pop(context);
        Navigator.pushNamed(context, OnBoardingPage.id);
      }else{
        showSnackBar(
            context, 'Check Your Network!');
         _userProvider!
            .registerUser(_userRegistration, _scaffoldKey)
            .then((response) {
          if (response=='200') {
            Navigator.pop(context);
            Navigator.pushNamed(context, OnBoardingPage.id);
          }else{
            showSnackBar(
                context, 'Network Error Please Try Again Later!');

          }
        });

      }
    });

    setState(() {
      _isLoading = false;
    }); });
  }

  void goBackPressed() {
    if (_currentScreenIndex == 0) {
      Navigator.pop(context);
      Navigator.pushNamed(context, StartScreen.id);
    } else {
      setState(() {
        _currentScreenIndex--;
      });
    }
  }
  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
  Widget getSubScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return NameScreen(
            onChangedfn: (value) => { _userRegistration.fn = value},
            onChangedln: (value) => { _userRegistration.ln = value},
            onChangeddt: (value) => { _userRegistration.dob = value},
            onChangedrel: (value) => { _userRegistration.religion = value},
            onChangedfor: (value) => { _userRegistration.forwhom = value},
            onChangedsex: (value) => { _userRegistration.sex = value});

      case 1:
        return AgeScreen(onChangedht: (value) => {_userRegistration.height = value },
        onChangedcn: (value) => {_userRegistration.country = value },
          onChangedstate: (value) => {_userRegistration.state = value },
          onChangedcity: (value) => {_userRegistration.city = value },
          onChangedpw: (value) => {_userRegistration.password = value },
          onChangedcpw: (value) => {_userRegistration.conpass = value },
          onChangedem: (value) => {_userRegistration.email = value },
          onChangedmarit: (value) => {_userRegistration.marital = value },
          onChangeddiet: (value) => {_userRegistration.diet = value },
          onChangedweight: (value) => {_userRegistration.weight = value },
        );
      case 2:return EmailAndPasswordScreen(
          emailOnChanged: (value) => {_userRegistration.income = value},
          passwordOnChanged: (value) => {_userRegistration.curr = value},
        OnChangedocc : (value) => {_userRegistration.occup = value},
        OnChangedquli: (value) => {_userRegistration.qualify = value},
       OnChangedwork: (value) => {_userRegistration.work = value},
          );
      case 3:
        return aboutinfo(
            onChangedab: (value) =>
            {_userRegistration.about = value},
            onChangedpn: (value) =>
            {_userRegistration.phone = value},
            onChangeddk: (value) =>
            {_userRegistration.dk = value},
            onChangedsk: (value) =>
            {_userRegistration.sk = value},
            onChangedbr: (value) =>
            {_userRegistration.br = value},
            onChangedsis: (value) =>
            {_userRegistration.sis = value},
    onChangedlan: (value) =>
    {_userRegistration.langs = value}
            );
      case 4:
        return AddPhotoScreen(
            onPhotoChanged: (value) =>
            {_userRegistration.localProfilePhotoPath = value});
      case 5:
        return terms(
            onPhotoChanged: (value) =>
            {istac = value});
      default:
        return Container();
    }
  }

  bool canContinueToNextSubScreen() {
    if(_currentScreenIndex==0 && _userRegistration.ln.length >= 3){


    }


    switch (_currentScreenIndex) {
      case 0:
        if(_userRegistration.ln.length <= 2){
          _errorIndex=0;
          return false;

        } else if(calculateAge(DateTime.parse(_userRegistration.dob)) < 18){
          _errorIndex=1;
          return false;

        }
        else if(_userRegistration.fn.length <= 2){
          _errorIndex=2;
          return false;

        }
        else  if(_userRegistration.sex.isEmpty){
          _errorIndex=3;
          return false;

        }
        else if(_userRegistration.dob.isEmpty){
          _errorIndex=4;
          return false;

        }
        else if(_userRegistration.forwhom.isEmpty){
          _errorIndex=5;
          return false;

        }
        else if(_userRegistration.religion.isEmpty){
          _errorIndex=6;
          return false;

        }
        else {
          return true;
        }
      case 1:
        if(_userRegistration.email.isEmpty||!isValidEmail(_userRegistration.email)){
          _errorIndex=7;
          return false;

        } else if(_userRegistration.password.isEmpty){
          _errorIndex=8;
          return false;

        }
        else if(!isPassMatch(_userRegistration.password,_userRegistration.conpass)){
          _errorIndex=9;
          return false;

        }
        else if(_userRegistration.password.length<6){
          _errorIndex=23;
          return false;

        }
        else if(_userRegistration.country.isEmpty){
          _errorIndex=10;
          return false;

        }
        else if(_userRegistration.state==null){
          _errorIndex=11;
          return false;

        }
        else if(_userRegistration.city==null){
          _errorIndex=12;
          return false;

        }
        else if(_userRegistration.marital.isEmpty){
          _errorIndex=13;
          return false;

        }
        else if(_userRegistration.diet.isEmpty){
          _errorIndex=14;
          return false;

        }
        else if(_userRegistration.height.isEmpty){
          _errorIndex=15;
          return false;

        }

        else{
          gett3(_userRegistration.password).then((data) {



          });
          return true;}

      case 2:
     if(_userRegistration.curr=="Currency*"){
    _errorIndex=16;
    return false;

    }
    else if(_userRegistration.income==""){
    _errorIndex=17;
    return false;

    }
    else if(_userRegistration.occup==""){
    _errorIndex=18;
    return false;

    }
    else if(_userRegistration.work==""){
    _errorIndex=19;
    return false;

    } else if(_userRegistration.qualify==""){
    _errorIndex=20;
    return false;

    }

    else{ return true;}
      case 3:
    //  if(_userRegistration.about==""){
    // _errorIndex=21;
    // return false;
    //
    // } else
      if(_userRegistration.phone==""){
    _errorIndex=22;
    return false;

    }
    else  if(_userRegistration.br==""){
        _errorIndex=24;
        return false;

      }
      else  if(_userRegistration.sis==""){
        _errorIndex=25;
        return false;

      }
      else  if(_userRegistration.dk==""){
        _errorIndex=26;
        return false;

      }
      else  if(_userRegistration.sk==""){
        _errorIndex=27;
        return false;

      }
      else  if(_userRegistration.langs==""){
        _errorIndex=28;
        return false;

      }
    else{ return true;}
      case 4:
        return (_userRegistration.dob.isNotEmpty);
      case 5:
        if(istac==true){
          return istac;
        }
        else{

          _errorIndex=29;
          return false;
        }
      // case 6:
      //   return _userRegistration.localProfilePhotoPath.isNotEmpty;

      default:
        return false;
    }
  }
  void fun2(){
    if(istac==true&&_isLoading == false){
      registerUser();
    }
    else{

    _errorIndex=29;
    showSnackBar(
        context, getInvalidRegistrationMessage());
    }
        // ? registerUser()
        // : null;

  }
  static bool isPassMatch(String value, String value2) {
    return value.contains(value2);
  }
  Future<String?> gett3(String? mid) async {

    await _userProvider!
        .getpass(mid!)
        .then((response) {
      _userRegistration.password=response;
      return response;
    });


  }

void fun1(){
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    if (canContinueToNextSubScreen()) {
      setState(() {
        _currentScreenIndex++;
      });
    } else {
      showSnackBar(
          context, getInvalidRegistrationMessage());
    }
  });
}
  String getInvalidRegistrationMessage() {
    switch (_errorIndex) {
      case 0:
        return "Last Name is too short!";
      case 1:
        return "Below 18 years not allowed to register!";
      case 2:
        return "First Name is too short!";
      case 3:
        return "Sex cannot empty!";
      case 4:
        return "Date of birth cannot empty!";
      case 5:
        return "For cannot empty!";
      case 6:
        return "Religion cannot empty!";
      case 7:
        return "Incorrect Email or  empty!";
      case 8:
        return "Password cannot empty!";
      case 9:
        return "Password and Confirm Password not Match!";
      case 10:
        return "Country cannot empty!";
      case 11:
        return "State cannot empty!";
      case 12:
        return "City cannot empty!";
      case 13:
        return "Marital Status cannot empty!";
      case 14:
        return "No of Children cannot empty!";
      case 15:
        return "Height cannot empty!";
      case 16:
        return "Currency cannot empty!";
      case 17:
        return "Income cannot empty!";
      case 18:
        return "Occupation cannot empty!";
      case 19:
        return "Work cannot empty!";
      case 20:
        return "Qualification cannot empty!";
      case 21:
        return "About Your self cannot empty!";
      case 22:
        return "Phone Number cannot empty!";
      case 23:
        return "The password must be at least 6 characters!";
      case 24:
        return "Select how many Brothers!";
      case 25:
        return "Select how many Sisters!";
      case 26:
        return "Select Use of Drinks!";
      case 27:
        return "Select use of Smokes!";
      case 28:
        return "Select at least one language!";
      case 29:
        return "Please agree to terms and conditions!";
      default:
        return "";
    }
  }

  static bool isValidEmail(String email) {
    String p = r"[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return  DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/bg.jpeg"), fit: BoxFit.cover),
      ),
      child:
      // Center(child:
      SafeArea(
        child:
        Scaffold(

        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
       // appBar: AppBar(title: Text('Register')),
        body: CustomModalProgressHUD(
          inAsyncCall: _isLoading,
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Column(

              children: [
                Container(
                  child: LinearPercentIndicator(
                      lineHeight: 5,
                      percent: (_currentScreenIndex / _endScreenIndex),
                      progressColor: kAccentColor,
                      padding: EdgeInsets.zero),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      padding: kDefaultPadding.copyWith(
                          left: kDefaultPadding.left / 2.0,
                          right: 0.0,
                          bottom: 4.0,
                          top: 4.0),
                      child: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(
                          _currentScreenIndex == 0
                              ? Icons.clear
                              : Icons.arrow_back,
                          color: kSecondaryColor,
                          size: 42.0,
                        ),
                        onPressed: goBackPressed,
                      )),
                ),
                SizedBox(height: 1),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      child: getSubScreen(),
                      padding: kDefaultPadding.copyWith(top: 0, bottom: 0)),
                ),

                Row(
                  children:  <Widget>[

                    Expanded(
                        child: Container()
                    ),
                    SizedBox(width: 55),


                    Container(
                      padding: kDefaultPadding,
                      child: _currentScreenIndex == (_endScreenIndex)
                          ? RoundedOutlinedButton(
                          text: 'REGISTER',
                          onPressed:fun2 )
                          : RoundedOutlinedButton(
                          text: 'CONTINUE',
                          onPressed: fun1
                      ),
                    ),

                  ],
                )


              ],
            ),
          ),
        ),
      ),
    ),
    // ),
    );


  }
}
class OnBoardingPage extends StatefulWidget {
  static const String id = 'OnBoardingPage';
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();



  void _onIntroEnd(context) {

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => TopNavigationScreen(1,0,0)),
      );


  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/images/b1.jpg',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
  Widget _buildFullscrenImage2() {
    return Image.asset(
      'assets/images/b2.jpg',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 0.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 0.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      //descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.transparent,
      // globalHeader: Align(
      //   alignment: Alignment.topRight,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child: _buildImage('images/tinder_icon.png', 100),
      //     ),
      //   ),
      // ),

      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Let\s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [


        // PageViewModel(
        //   title: "Welcome to Tune",
        //   body:
        //   "Tune is one of the most trusted matrimony website and mobile app made by Sri Lankans. This is a secure platform built in accordance with global standards, with utmost priority for privacy and data security.",
        //   image: _buildImage('images/tinder_icon.png'),
        //   decoration: pageDecoration,
        // ),
        PageViewModel(
          title: '',
          body:"",
          // "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscrenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 1,
          ),
        ),
        PageViewModel(
          title: '',
          body:"",
          // "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscrenImage2(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 0),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 3,
          ),
        ),
        // PageViewModel(
        //   title: "Another title page",
        //   body: "Another beautiful body text for this example onboarding",
        //   image: _buildImage('img2.jpg'),
        //   footer: ElevatedButton(
        //     onPressed: () {
        //       introKey.currentState?.animateScroll(0);
        //     },
        //     child: const Text(
        //       'FooButton',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     style: ElevatedButton.styleFrom(
        //       primary: Colors.lightBlue,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //     ),
        //   ),
        //   decoration: pageDecoration,
        // ),
        // PageViewModel(
        //   title: "Title of last page - reversed",
        //   bodyWidget: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       Text("Click on ", style: bodyStyle),
        //       Icon(Icons.edit),
        //       Text(" to edit a post", style: bodyStyle),
        //     ],
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     bodyFlex: 2,
        //     imageFlex: 4,
        //     bodyAlignment: Alignment.bottomCenter,
        //     imageAlignment: Alignment.topCenter,
        //   ),
        //   image: _buildImage('img1.jpg'),
        //   reverse: true,
        // ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
     // skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}