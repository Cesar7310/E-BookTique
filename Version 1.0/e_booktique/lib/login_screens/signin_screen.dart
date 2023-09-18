import 'dart:ui';

import 'package:e_booktique/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final double _opacity = 0.2;
  final _formKey = GlobalKey<FormState>();

  void signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
      }
    } catch (e) {
      // print('Error signing in with Google: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.solidHandPointLeft,
                        color: Colors.grey.shade200,
                        size: 35,
                      ),
                      onPressed: () => _onBackButtonPressed(context))
                  .animate()
                  .fade(duration: 3000.ms)
                  .show();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Salir',
            style: TextStyle(color: Colors.grey.shade200, fontSize: 30),
          ).animate().fade(duration: 3000.ms).show(),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     Colors.pink.shade900,
            //     Colors.deepPurple.shade400,
            //     Colors.deepPurple.shade900,
            //   ],
            // ),
            // image: DecorationImage(
            //   image: AssetImage("assets/login_bg.png"),
            //   fit: BoxFit.cover,
            // ),
            image: DecorationImage(
              image: NetworkImage(
                  "https://cdn.pixabay.com/animation/2023/01/17/08/02/08-02-46-918_512.gif"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 1)
                              .withOpacity(_opacity),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.78,
                      child: Form(
                        key: _formKey,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SizedBox(width: 20, height: 80),
                                  Container(
                                    color: const Color.fromARGB(44, 2, 29, 69),
                                    child: Text(
                                      'Iniciar Sesión',
                                      style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 45,
                                      ),
                                    )
                                        .animate()
                                        .fade(duration: 2000.ms)
                                        .rotate(),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // google button
                                    // Image.asset('assets/logo.png'),
                                    // SizedBox(height: 10),
                                    // // apple button
                                    // SquareTile(
                                    //     imagePath: 'assets/apple.png',
                                    //     title: "Continue with Apple"),
                                  ],
                                ),
                              ).animate().fade(duration: 2000.ms).rotate(),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => signInWithGoogle(context),
                                  child: Container(
                                    height: 67,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white70,
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/google.png',
                                          height: 40,
                                        ),
                                        const SizedBox(width: 20),
                                        const Text(
                                          'Continuar con Google',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ).animate().fade(duration: 2000.ms).rotate(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Salir de la aplicación"),
          content: const Text("¿Quieres salir de la aplicación?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () =>
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              child: const Text("Si"),
            ),
          ],
        );
      },
    );
    return exitApp;
  }
}
