import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_footer/Pages/signup_page.dart';
import '../models/account.dart';
import '/pages/bottom_navbar.dart';

@override
SignInPage2 createState() => SignInPage2();

class SignInPage2 extends StatefulWidget {
  SignInPage2({super.key});

  @override
  State<SignInPage2> createState() => _SignInPage2State();
}

class _SignInPage2State extends State<SignInPage2> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  List<Account> _accounts = [];

  Future<void> _readJsonFile() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final productData = await json.decode(response);

    var list = productData["account"] as List<dynamic>;

    setState(() {
      _accounts = list.map((e) => Account.fromJson(e)).toList();
    });
  }

  void _checkLogin() async {
    await _readJsonFile();

    bool isValid = false;
    for (var account in _accounts) {
      if (account.username == _username && account.password == _password) {
        isValid = true;
        break;
      }
    }

    if (isValid) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Login Success"),
          content: Text("Username and password are valid"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavBar()));

              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Login Failed"),
          content: Text("Username and password are not valid"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: displayWidth,
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const FittedBox(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 8),
                    child: Text('Hello ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text('Somo Staff',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                          hintText: 'Username',
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 20)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      onSaved: (value) => _username = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                          hintText: 'Password',
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 20)),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(48, 0, 183, 1),
                              Color.fromRGBO(161, 128, 255, 1),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _checkLogin();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(500, 64),
                            elevation: 0, // Remove button shadow
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      //SIGN UP LINK
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: displayWidth * .2,
            )
          ],
        ),
      ),
    );
  }
}
