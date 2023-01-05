import 'package:cygnus/ui/screens/setings/pin_input_field.dart';
import 'package:cygnus/ui/screens/top_navigation_screen.dart';
import 'package:cygnus/ui/screens/top_navigation_screens/SettingsPage.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';

import '../../../util/utils.dart';
import 'CustomLoader.dart';






class VerifyPhoneNumberScreen extends StatefulWidget {
  static const id = 'VerifyPhoneNumberScreen';

  final String phoneNumber;

  const VerifyPhoneNumberScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance!.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider( child: Scaffold(backgroundColor: Colors.white,
      body: FirebasePhoneAuthHandler(
        phoneNumber: widget.phoneNumber,
        onLoginSuccess: (userCredential, autoVerified) async {
          // log(
          //   VerifyPhoneNumberScreen.id,
          //   msg: autoVerified
          //       ? 'OTP was fetched automatically!'
          //       : 'OTP was verified manually!',
          // );

          showSnackBar(context,'Phone number verified successfully!');

          // log(
          //   VerifyPhoneNumberScreen.id,
          //   msg: 'Login Success UID: ${userCredential.user?.uid}',
          // );

          Navigator
              .of(context).pop();  Navigator
              .of(context).pop(); Navigator
              .of(context).pop();
        },
        onLoginFailed: (authException) {
          showSnackBar(context,'Something went wrong, Pleas try again!');
         // log(VerifyPhoneNumberScreen.id, error: authException.message);
          // handle error further if needed

        },
        builder: (context, controller) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 0,
              leading: const SizedBox.shrink(),
              title: const Text('Verify Phone Number'),
              actions: [
                if (controller.codeSent)
                  TextButton(
                    child: Text(
                      controller.timerIsActive
                          ? '${controller.timerCount.inSeconds}s'
                          : 'Resend',
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    onPressed: controller.timerIsActive
                        ? null
                        : () async {
                     // log(VerifyPhoneNumberScreen.id, msg: 'Resend OTP');
                      await controller.sendOTP();
                    },
                  ),
                const SizedBox(width: 5),
              ],
            ),
            body: controller.codeSent
                ? ListView(
              padding: const EdgeInsets.all(20),
              controller: scrollController,
              children: [
                Text(
                  "We've sent an SMS with a verification code to ${widget.phoneNumber}",
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),
                const Divider(),
                if (controller.timerIsActive)
                  Column(
                    children: const [
                      CustomLoader(),
                      SizedBox(height: 50),
                      Text(
                        'Listening for OTP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15),
                      Divider(),
                      Text('OR', textAlign: TextAlign.center),
                      Divider(),
                    ],
                  ),
                const SizedBox(height: 15),
                const Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                PinInputField(
                  length: 6,
                  onFocusChange: (hasFocus) async {
                    if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                  },
                  onSubmit: (enteredOTP) async {
                    final isValidOTP = await controller.verifyOTP(
                      otp: enteredOTP,
                    );
                    // Incorrect OTP
                    if (!isValidOTP) {
                      showSnackBar(context,'The entered OTP is invalid!');
                    }
                  },
                ),
              ],
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CustomLoader(),
                SizedBox(height: 50),
                Center(
                  child: Text(
                    'Sending OTP',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          );
        },
      ), ),
    );
  }
}