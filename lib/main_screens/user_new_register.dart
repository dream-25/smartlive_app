import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartlive/main_screens/home_page.dart';

// ignore: must_be_immutable
class UserNewRegister extends StatefulWidget {
  String sUserNumber;
  String sUserCountry;
  String sUserCountryCode;

  UserNewRegister(this.sUserNumber, this.sUserCountry, this.sUserCountryCode,
      {Key? key})
      : super(key: key);
  @override
  State<UserNewRegister> createState() => _UserNewRegisterState();
}

class _UserNewRegisterState extends State<UserNewRegister> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();
  final otpController = TextEditingController();
  var userNumber = "";
  var userFullNumber = "";
  var userCountryCode = "";
  var userCountry = "";
  var isLoginInProgress = false;
  var isSavingProgress = false;
  var hide = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userNumber = widget.sUserNumber;
    var userFullNumber = widget.sUserCountryCode + widget.sUserNumber;
    var userCountryCode = widget.sUserCountryCode;
    var userCountry = widget.sUserCountry;

    final saveBtn = Container(
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
                userNumber = widget.sUserNumber;
                userFullNumber = widget.sUserCountryCode + widget.sUserNumber;
                isSavingProgress = true;
              });
              await Future.delayed(const Duration(milliseconds: 1500));
              await signIn();

              isSavingProgress = false;

              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "SAVE   ",
                    style: GoogleFonts.cabin(
                        color: Colors.white,
                        letterSpacing: 0.8,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                isSavingProgress
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
              ],
            ),
          ),
        ));

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      obscureText: hide,
      decoration: InputDecoration(
          suffixIcon: InkWell(
            child: (hide == false)
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.emergency),
            onTap: () {
              setState(() {
                if (hide == true) {
                  hide = false;
                } else {
                  hide = true;
                }
              });
            },
          ),
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          label: const Text("Enter Your Password"),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    final cpasswordField = TextFormField(
      autofocus: false,
      controller: cpasswordController,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value) {
        cpasswordController.text = value!;
      },
      obscureText: hide,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          label: const Text("Enter Your Password"),
          suffixIcon: InkWell(
            child: (hide == false)
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.emergency),
            onTap: () {
              if (hide == true) {
                hide = false;
              } else {
                hide = true;
              }
              setState(() {});
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    final loginButton = Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 8, 0),
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
            minWidth: 100,
            color: Colors.blueGrey.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            splashColor: Colors.white.withAlpha(100),
            padding: const EdgeInsets.only(top: 14, bottom: 14),
            onPressed: () async {
              isLoginInProgress = true;
              setState(() {});

              await Future.delayed(const Duration(milliseconds: 1500));
              await sendOTP();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "GET OTP  ",
                  style: GoogleFonts.cabin(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                isLoginInProgress
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
                              width: 15,
                              height: 15,
                              child: Icon(Icons.arrow_forward,
                                  color: Colors.blueGrey, size: 15)),
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
          elevation: 1,
          automaticallyImplyLeading: false,
          title: Text("Register",
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.bold, color: Colors.white)),
          foregroundColor: Colors.blueGrey.shade900,
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 8, 15, 0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 6) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                            style: GoogleFonts.rubik(
                                letterSpacing: 0.1,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            decoration: InputDecoration(
                                hintText: "OTP",
                                hintStyle: GoogleFonts.rubik(
                                    letterSpacing: 0.1,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                                border: allTFBorder,
                                enabledBorder: allTFBorder,
                                focusedBorder: allTFBorder,
                                prefixIcon: const Icon(Icons.phone, size: 22),
                                isDense: true,
                                contentPadding: EdgeInsets.zero),
                            keyboardType: TextInputType.phone,
                            controller: otpController,
                          ),
                        ),
                        loginButton,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: passwordField,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: cpasswordField,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              saveBtn
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendOTP() async {
    isLoginInProgress = false;
    setState(() {});
  }

  Future<void> signIn() async {
    isSavingProgress = false;
    setState(() {});
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeRootPage(pageIndex: 1)));
  }
}
