import 'package:flutter/material.dart';
import 'package:rtiggers/colors.dart';

class EmailVerification extends StatefulWidget {
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: blueColor,
      body: new SingleChildScrollView(
        child: getBody(),
      ),
    );
  }

  getBody() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
          child: logo(),
        ),
        verificationCard(),
        // detailsCard(),
      ],
    );
  }

  verificationCard() {
    return Container(
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email Verification',
                  style:
                      TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                  'We have send an email with subject line : (Dello MarketPlcae) - Account Verification to your registered email address'),
            ],
          ),
        ),
      ),
    );
  }

  logo() {
    return Center(
      child: Container(
          height: 120.0, width: 120.0, child: Image.asset('assets/logo.png')),
    );
  }
}
