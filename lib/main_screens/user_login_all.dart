import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smartlive/utils/routes.dart';

class UserLoginAll extends StatefulWidget {
  const UserLoginAll({Key? key}) : super(key: key);

  @override
  State<UserLoginAll> createState() => _UserLoginAllState();
}

class _UserLoginAllState extends State<UserLoginAll> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash_bg.png"),
                fit: BoxFit.cover)),
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height / 2.5, 0, 0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Sign in to SmartLive',
                      style: GoogleFonts.varelaRound(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LineIcon(
                            LineIcons.facebookF,
                            color: Colors.white,
                          ),
                          Text(
                            '  Sign in with Facebook ',
                            textScaleFactor: 1.2,
                            style: GoogleFonts.varelaRound(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.indigo.shade500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LineIcon(
                            LineIcons.googleLogo,
                            color: Colors.white,
                          ),
                          Text(
                            '  Sign in with Google ',
                            textScaleFactor: 1.2,
                            style: GoogleFonts.varelaRound(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.red.shade600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.loginNumberRoute);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LineIcon(
                              LineIcons.phone,
                              color: Colors.white,
                            ),
                            Text(
                              '  Phone Number',
                              textScaleFactor: 1.2,
                              style: GoogleFonts.varelaRound(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "Log in to your account in order to unlock SmartLives's cool features",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.varelaRound(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    ));
  }
}
