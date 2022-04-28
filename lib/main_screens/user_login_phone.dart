import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smartlive/main_screens/user_new_register.dart';
import 'package:smartlive/widgets/save_sp.dart';
import '../widgets/snackbar.dart';

class UserLoginPhone extends StatefulWidget {
  const UserLoginPhone({Key? key}) : super(key: key);

  @override
  State<UserLoginPhone> createState() => _UserLoginPhoneState();
}

class _UserLoginPhoneState extends State<UserLoginPhone> {
  final _numberController = TextEditingController();
  var userNumber = "";
  var userFullNumber = "";
  var userCountryCode = "+880";
  var userCountry = "Bangladesh";
  var isLoginInProgress = false;
  @override
  Widget build(BuildContext context) {
    final loginButton = Container(
        margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(48)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(100),
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: MaterialButton(
            color: Colors.blueGrey.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            splashColor: Colors.white.withAlpha(100),
            padding: const EdgeInsets.only(top: 14, bottom: 14),
            onPressed: () async {
              setState(() {
                userNumber = _numberController.text;
                userFullNumber = userCountryCode + _numberController.text;

                isLoginInProgress = true;
              });
              await Future.delayed(const Duration(milliseconds: 1500));
              await signIn();

              isLoginInProgress = false;

              setState(() {});
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.cabin(
                        color: Colors.white,
                        letterSpacing: 0.8,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Positioned(
                  right: 16,
                  child: isLoginInProgress
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 1.4),
                        )
                      : ClipOval(
                          child: Container(
                            color: Colors.blueGrey.shade100,
                            // button color
                            child: const SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blueGrey,
                                  size: 18,
                                )),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ));

    OutlineInputBorder allTFBorder;
    allTFBorder = const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(color: Colors.grey, width: 0));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(children: [
            Row(children: [
              Text("Phone Number",
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold, color: Colors.white))
            ])
          ]),
          foregroundColor: Colors.blueGrey.shade900,
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (value) {
                          userCountryCode = value.dialCode.toString();
                          userCountry = value.name.toString();
                        },
                        initialSelection: 'BD',
                        favorite: const ['BD', 'IN', "PK", "+98"],
                        flagDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 158,
                        child: Center(
                          child: TextFormField(
                            onChanged: (value) {},
                            style: GoogleFonts.rubik(
                                letterSpacing: 0.1,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            decoration: InputDecoration(
                                hintText: "Number",
                                hintStyle: GoogleFonts.rubik(
                                    letterSpacing: 0.1,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                                border: allTFBorder,
                                enabledBorder: allTFBorder,
                                focusedBorder: allTFBorder,
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  size: 22,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero),
                            keyboardType: TextInputType.phone,
                            controller: _numberController,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            loginButton
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    try {
      Future<void> createAlbum() async {
        http
            .post(
          Uri.parse('http://18.236.177.180:8800/api/auth/loginPhone'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{"phone": userFullNumber}),
        )
            .then((value) {
          setState(() {
            if (value.statusCode == 200) {
              setState(() {
                showSnackbarC(
                    context,
                    "Enter your password to Login".toString(),
                    Colors.green,
                    Colors.white);

                isLoginInProgress = false;
              });
            } else {
              saveSP("userNumber", userNumber);
              saveSP("userFullNumber", userFullNumber);
              saveSP("userCountryCode", userCountryCode);
              saveSP("userCountry", userCountry);
              showSnackbarC(context, "Welcome to SmartLive".toString(),
                  Colors.green, Colors.white);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserNewRegister(
                          userNumber, userCountry, userCountryCode)));
            }
          });
        });
      }

      createAlbum();
    } catch (e) {
      isLoginInProgress = false;
      setState(() {});
      showSnackbarC(context, e.toString(), Colors.red, Colors.white);
    }
  }
}
