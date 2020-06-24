import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rtiggers/Authentication/authentication.dart';

import 'package:rtiggers/LoginScreen/login.dart';
import 'package:rtiggers/Registration/details.dart';
import 'package:rtiggers/colors.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final key = GlobalKey<ScaffoldState>();
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final mobileController = new TextEditingController();
  final otpController = new TextEditingController();

  bool privacyCheck = false;
  bool drinkingCheck = false;

  // Registration variables
  String smsCode, verificationId;
  bool codeSent = false;
  bool verified = false;
  bool registered = false;
  final OTPSnackBar = SnackBar(
    content: Text("OTP Sent !"),
  );
  final OTPVerifiedSnackBar = SnackBar(
    content: Text("Phone Number Verified!"),
  );
  AuthCredential loginKey;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: getBody(),
      backgroundColor: blueColor,
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: getContents(),
      ),
    );
  }

  getContents() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 2,
            child: Center(child: new Image.asset('assets/logo.png')),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: Center(
                child: new Text('Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold))),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Full Name',
                hintStyle:
                    TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: nameController,
              validator: (val) => val.isEmpty ? 'Name can not be empty' : null,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'E-Mail Id',
                hintStyle:
                    TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: emailController,
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Mobile Number',
                hintStyle:
                    TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              keyboardType: TextInputType.number,
              controller: mobileController,
              validator: (val) => val.length != 10
                  ? 'Enter a valid 10 digit mobile number'
                  : null,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Set Password',
                hintStyle:
                    TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: passwordController,
              validator: (val) => val.length < 6
                  ? 'Enter a password atleast 6 chars long'
                  : null,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey[200],
                      width: 1.8,
                    ),
                  ),
                  hintText: 'OTP Code',
                  hintStyle:
                      TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                  fillColor: Colors.grey[100],
                  filled: true,
                  suffix: FlatButton(
                      onPressed: () {
                        mobileController.text = mobileController.text.trim();
                        codeSent
                            ? AuthService().signWithOTP(smsCode, verificationId)
                            : verifyPhone("+91" + mobileController.text);

                        if (verified) {
                          setState(() {
                            key.currentState.showSnackBar(OTPVerifiedSnackBar);
                          });
                        }
                      },
                      child: codeSent
                          ? Text("Submit the OTP Code",
                              style: TextStyle(color: blueColor))
                          : Text("Get OTP Code",
                              style: TextStyle(color: blueColor)))),
              controller: otpController,
              keyboardType: TextInputType.number,

              // validator: (val) => val.isEmpty ? 'Enter ' : null,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Details()));
            },
            minWidth: MediaQuery.of(context).size.width / 1.35,
            color: brownColor,
            child: Text("Register", style: TextStyle(color: Colors.white)),
            height: 43.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: CheckboxListTile(
              value: privacyCheck,
              onChanged: (newValue) {
                setState(() {
                  privacyCheck = newValue;
                });
              },
              title: Text('I Agree all Terms & Policies',
                  style: TextStyle(fontSize: 12.5, color: Colors.white)),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.white,
              activeColor: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: CheckboxListTile(
              value: drinkingCheck,
              onChanged: (newValue) {
                setState(() {
                  drinkingCheck = newValue;
                });
              },
              title: Text(
                  'I Agree that I have legal drinking age\nas per state domocile',
                  style: TextStyle(fontSize: 12.5, color: Colors.white)),
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.white,
              activeColor: Colors.blueGrey,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.8,
                      color: Colors.white)),
              GestureDetector(
                child: Text('Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.8,
                        color: Colors.white)),
                onTap: () => Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => LoginPage())),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(15.0)),
        ],
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      // AuthService().signIn(authResult);
      FirebaseAuth.instance.signInWithCredential(authResult).then((user) async {
        await FirebaseAuth.instance.currentUser();
        await Firestore.instance
            .collection('users')
            .document(user.user.uid)
            .setData({
          "email": emailController.text,
          "password": passwordController.text,
          "phone": mobileController.text,
          "username": nameController.text,
        });
      });
      setState(() async {
        this.verified = true;
        this.loginKey = authResult;
        otpController.text = smsCode;
      });
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');

      if (registered)
        key.currentState.showSnackBar(SnackBar(
          content: new Text('Already Registered please try Login'),
        ));

      registered = true;
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
