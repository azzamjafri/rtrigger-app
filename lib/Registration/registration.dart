import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rtiggers/LoginScreen/login.dart';
import 'package:rtiggers/Registration/details.dart';
import 'package:rtiggers/colors.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final key = GlobalKey<ScaffoldState>();
  // CONTROLLERS
  final nameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final mobileController = new TextEditingController();
  final otpController = new TextEditingController();
  final displayNameController = new TextEditingController();

  bool privacyCheck = false;
  bool drinkingCheck = false;
  String otp;
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
      backgroundColor: blueColor,
      key: key,
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: getContents(),
    ));
  }

  getContents() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15.0,
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
                        color: brownColor,
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
              textAlign: TextAlign.justify,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                prefixIcon: Image.asset('assets/profile.png'),
                hintText: 'Name of the seller',
                hintStyle: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
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
              textAlign: TextAlign.justify,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                prefixIcon: Image.asset('assets/mail.png'),
                hintStyle: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                hintText: 'Email Address of the seller',
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
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Mobile Number',
                prefixIcon: Icon(Icons.phone),
                hintStyle: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
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
            height: 5.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: Row(
              children: [
                Text(
                  'OTP Recieved',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1.8,
            color: blueColor,
            child: PinCodeTextField(
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                inactiveFillColor: Colors.white,
                activeColor: Colors.white,
                selectedColor: brownColor,
                activeFillColor: Colors.white,
                inactiveColor: Colors.white,
                selectedFillColor: Colors.white,
                
              ),
              backgroundColor: blueColor,
              enableActiveFill: true,
              length: 4,
              textInputType: TextInputType.number,
              onChanged: (val) {
                otp = val;
              },
            ),
          ),
          SizedBox(height: 12.0,),
          Container(
            
            width: MediaQuery.of(context).size.width / 2.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              
              children: [Text('Resend OTP', style: TextStyle(color: brownColor),)],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              // textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                hintText: 'Enter your display name',
                prefixIcon: Icon(Icons.phone),
                hintStyle: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              keyboardType: TextInputType.number,
              controller: displayNameController,
              validator: (val) =>
                  val.length == 0 ? 'Display name can\'t be empty' : null,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          
          // Container(
          //   height: 45.0,
          //   width: MediaQuery.of(context).size.width / 1.35,
          //   child: new TextFormField(
          //     decoration: InputDecoration(
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //           borderSide: BorderSide(
          //             color: Colors.grey[200],
          //             width: 1.8,
          //           ),
          //         ),
          //         hintText: 'OTP Code',
          //         hintStyle:
          //             TextStyle(color: blueColor, fontWeight: FontWeight.bold),
          //         fillColor: Colors.grey[100],
          //         filled: true,
          //         suffix: FlatButton(
          //             onPressed: () {
          //               mobileController.text = mobileController.text.trim();
          //               codeSent
          //                   ? AuthService().signWithOTP(smsCode, verificationId)
          //                   : verifyPhone("+91" + mobileController.text);

          //               if (verified) {
          //                 setState(() {
          //                   key.currentState.showSnackBar(OTPVerifiedSnackBar);
          //                 });
          //               }
          //             },
          //             child: codeSent
          //                 ? Text("Submit the OTP Code",
          //                     style: TextStyle(color: blueColor))
          //                 : Text("Get OTP Code",
          //                     style: TextStyle(color: blueColor)))),
          //     controller: otpController,
          //     keyboardType: TextInputType.number,

          //     // validator: (val) => val.isEmpty ? 'Enter ' : null,
          //   ),
          // ),
          Container(
            height: 70.0,
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
                  prefixIcon: Image.asset('assets/pppp.png', color: Colors.grey[700],),
                  hintText: 'Business/Pickup Address',
                  hintStyle: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                  fillColor: Colors.grey[100],
                  filled: true,
                  ),
              controller: otpController,
              

              validator: (val) => val.isEmpty ? 'Enter the address' : null,
            ),
          ),

          SizedBox(
            height: 25.0,
          ),

          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.35,
            child: new TextFormField(
              textAlign: TextAlign.justify,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 1.8,
                  ),
                ),
                prefixIcon: Image.asset('assets/password.png'),
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              controller: passwordController,
              validator: (val) => val.length < 6 ? 'Password should be atleast 6 characers long' : null,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            onPressed: () async {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => Details()));
            },
            minWidth: MediaQuery.of(context).size.width / 1.35,
            color: brownColor,
            child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 25.0, letterSpacing: 1.1)),
            height: 50.0,
          ),
          
          SizedBox(
            height: 15.0,
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account ? ',
                  style:
                      TextStyle(fontSize: 16.0, color: Colors.white)),
              GestureDetector(
                child: Text('Login',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.8, color: brownColor)),
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
