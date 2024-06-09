import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_footer/Pages/signup_page.dart';
import '/pages/bottom_navbar.dart';
import 'home_page.dart';


@override
SignInPage createState() => SignInPage();

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordVisible = false;

  Future<User?> Signin(
      {required String idcontroller, required String pwcontroller}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: idcontroller, password: pwcontroller);
      user = userCredential.user;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return user;
  }

  final idcontroller = TextEditingController();

  final pwcontroller = TextEditingController();

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
            // const Text(
            //   'Back',
            //   style: TextStyle(color: Colors.blue),
            // ),
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
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                controller: idcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'User ID or E-mail',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                controller: pwcontroller,
                obscureText:
                    !_isPasswordVisible, // Obfuscate the password when not visible
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
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
                  // onPressed: () async {
                  //   await Signin(
                  //     idcontroller: idcontroller.text,
                  //     pwcontroller: pwcontroller.text,
                  //   );
                  // },
                  onPressed: () {
                    _completeLogin(context);
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
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color.fromRGBO(48, 0, 183, 1),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 113, 191, 115),
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Text(
                //     'or',
                //     style: TextStyle(fontSize: 18),
                //   ),
                // ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 113, 191, 115),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color.fromRGBO(48, 0, 183, 1),
                  ),
                ),
              ],
            ),
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Text('Sign Up with', style: TextStyle(fontSize: 18))],
            // ),
            // const SizedBox(height: 5),
            // Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         padding: const EdgeInsets.all(20),
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.white),
            //           borderRadius: BorderRadius.circular(16),
            //           color: const Color.fromRGBO(255, 255, 255, 1),
            //         ),
            //         child: Image.asset(
            //           'assets/images/Google.png',
            //           height: 40,
            //         ),
            //       ),
                  // Container(
                  //   padding: const EdgeInsets.all(20),
                  //   constraints: const BoxConstraints(
                  //       maxWidth: 90), // Set max width here
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.white),
                  //     borderRadius: BorderRadius.circular(16),
                  //     color: const Color.fromRGBO(255, 255, 255, 1),
                  //   ),
                  //   child: Image.asset(
                  //     'assets/images/SpaceX.png',
                  //     height: 40,
                  //   ),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.all(20),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.white),
                  //     borderRadius: BorderRadius.circular(16),
                  //     color: const Color.fromRGBO(255, 255, 255, 1),
                  //   ),
                  //   child: Image.asset(
                  //     'assets/images/Nasa.png',
                  //     height: 40,
                  //   ),
                  // ),
            //     ],
            //   ),
            // ),
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


void _completeLogin(BuildContext context) {
  Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => HomePage(),
    ),
  );
}