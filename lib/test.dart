import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'core/functions/checkinternet.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  var res ;

  intialdata() async {
    res = await CheckInternet();
    print(res) ;
  }

  @override
  void initState(){
    intialdata() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(10),
              numberOfFields: 5,
              borderColor:  Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){

              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
