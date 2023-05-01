



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omda_attendenceapp/picker.dart';

import 'constant.dart';
import 'homescreen.dart';

class loginscreen extends StatefulWidget {
  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  bool rememver = false;

  bool sec = true;

  var visible = const Icon(Icons.visibility, color: Color(0xff4c5166));

  var visibleoff = const Icon(Icons.visibility_off, color: Color(0xff4c5166));

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration:  const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        kPrimaryColor,
                        Color(0xffa7adba),
                        kPrimaryColor,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 45),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            "Welcome Student ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          buildemail(),
                          const SizedBox(
                            height: 30,
                          ),
                          buildPassword(),
                          const SizedBox(
                            height: 30,
                          ),
                          buildrember(),
                          const SizedBox(
                            height: 20,
                          ),
                          buildloginbutton(),
                          const SizedBox(
                            height: 20,
                          ),
                          builddonthaveacc(),

                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildFacebook(),
                              buildGoogle(),
                              buildTwitter()
                            ],
                          ),
                          const SizedBox(height: 60,),
                          const Text("الشروط والاحكام",style: TextStyle(color: Colors.white,fontSize: 10),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildemail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xffebefff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 2),
                )
              ]),
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10, top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff4c5166),
              ),
              hintText: "Email Address",
              helperStyle: TextStyle(color: Colors.black38),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xffebefff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 2),
                )
              ]),
          child: TextField(
            obscureText: sec,
            keyboardType: TextInputType.visiblePassword,
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10, top: 14),
              prefixIcon: const Icon(
                Icons.password,
                color: Color(0xff4c5166),
              ),
              suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      sec = !sec;
                    });
                  },
                  icon: sec ? visible : visibleoff),
              hintText: "Password",
              helperStyle: TextStyle(color: Colors.black38),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildrember() {
    return Container(
      height: 50,
      child: Row(
        children: [
          Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                onChanged: (bool? value) {
                  setState(() {
                    rememver = value!;
                  });
                },
                value: rememver,
                checkColor: Colors.blueGrey,
                activeColor: Colors.white,
              )),
          const Text(
            "REMEMBER ME",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "forget password?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildloginbutton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MainHomeScreen()),
          );
        },
        child: const Text(
          "LOGIN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Color(0xff727999),
      ),
      ),
    );
  }

  Widget builddonthaveacc() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Don't have an account?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Create Now..",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget buildFacebook() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset("assets/facebook.png"),
    );
  }

  Widget buildGoogle() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset("assets/search.png"),
    );
  }

  Widget buildTwitter() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset("assets/twitter.png"),
    );
  }
}
