import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oras_analytics/Constants.dart';
import 'package:oras_analytics/Screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List selectedUsers = [true, false];
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 60),
            Text("Choose, you are?",
                style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black, fontSize: 30))),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedUsers[0] = true;
                            selectedUsers[1] = false;
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: (selectedUsers[0])
                                        ? kPrimaryColor
                                        : Colors.white,
                                    width: 4),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 3))
                                ]),
                            child: SvgPicture.asset("assets/icons/user.svg",
                                width: 60)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Owner",
                          style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black, fontSize: 30))),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedUsers[0] = false;
                            selectedUsers[1] = true;
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: (selectedUsers[1])
                                        ? kPrimaryColor
                                        : Colors.white,
                                    width: 4),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 3))
                                ]),
                            child: SvgPicture.asset("assets/icons/users.svg",
                                width: 60)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("inhabitant",
                          style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black, fontSize: 30))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3))
                ]),
                child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'email',
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        prefixIcon: Container(
                            margin: EdgeInsets.all(4),
                            child: SvgPicture.asset("assets/icons/user.svg",
                                width: 10)))),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3))
                ]),
                child: TextFormField(
                    autofocus: false,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor)),
                      hintText: 'password',
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      prefixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: SvgPicture.asset(
                            "assets/icons/asterisk-1521571-1288243.svg"),
                      ),
                    )),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Forgot password?",
              style: GoogleFonts.montserrat(textStyle: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
            ),
            SizedBox(height: 40),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                )),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
