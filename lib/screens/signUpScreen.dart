import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mitup/models/SignUpModel.dart';
import 'package:mitup/screens/finishingLogging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  int nextPage = 1;
  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    var _signUpDatas = const SignUpModel(
        email: "", district: "", password: "", confirmPassword: "");
    // ignore: non_constant_identifier_names
    Future<void> signUpController() async {
      var validateForm = _form.currentState!.validate();
      _form.currentState!.save();

      setState(() {
        nextPage = 2;
      });
    }

    return Scaffold(
      body: nextPage == 2
          ? Container(
        child:  FinishingLogging(),
      )
          : SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // todo NAMES REQUIRED

                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                25)),
                                        labelText: 'Enter your email',
                                        labelStyle:
                                        const TextStyle(fontSize: 12),
                                        suffixIcon:
                                        const Icon(Icons.email),
                                        isDense: true,
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 0,
                                            horizontal: 20)),
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Fill your email";
                                      }
                                      if (value.isNotEmpty &&
                                          (!value.contains("@") ||
                                              !value.contains("."))) {
                                        return "email is invalid";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _signUpDatas = SignUpModel(
                                          email: value.toString(),
                                          district: _signUpDatas.district,
                                          password: _signUpDatas.password,
                                          confirmPassword: _signUpDatas
                                              .confirmPassword);
                                    },
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                25)),
                                        labelText:
                                        'Enter your District/Province',
                                        suffixIcon:
                                        const Icon(Icons.place),
                                        labelStyle:
                                        const TextStyle(fontSize: 12),
                                        isDense: true,
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                          // vertical: 4,
                                            horizontal: 20)),
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (_) {
                                      signUpController();
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Fill your address';
                                      }

                                      return null;
                                    },
                                    onSaved: (value) {
                                      _signUpDatas = SignUpModel(
                                          email: _signUpDatas.email,
                                          district: value.toString(),
                                          password: _signUpDatas.password,
                                          confirmPassword: _signUpDatas
                                              .confirmPassword);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                25)),
                                        labelText: 'Enter your password',
                                        suffixIcon:
                                        const Icon(Icons.lock),
                                        labelStyle:
                                        const TextStyle(fontSize: 12),
                                        isDense: true,
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                          // vertical: 4,
                                            horizontal: 20)),
                                    textInputAction: TextInputAction.done,
                                    obscureText: true,
                                    onFieldSubmitted: (_) {
                                      signUpController();
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Fill the password';
                                      }
                                      if (value.length < 6) {
                                        return "Week password";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _signUpDatas = SignUpModel(
                                          email: _signUpDatas.email,
                                          district: _signUpDatas.district,
                                          password: value.toString(),
                                          confirmPassword: _signUpDatas
                                              .confirmPassword);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                25)),
                                        labelText:
                                        'Re-enter your password',
                                        suffixIcon:
                                        const Icon(Icons.lock),
                                        labelStyle:
                                        const TextStyle(fontSize: 12),
                                        isDense: true,
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                          // vertical: 4,
                                            horizontal: 20)),
                                    textInputAction: TextInputAction.next,
                                    obscureText: true,
                                    onFieldSubmitted: (_) {
                                      signUpController();
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Fill the password';
                                      }
                                      if (value.length < 6) {
                                        return "Week password";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _signUpDatas = SignUpModel(
                                        email: _signUpDatas.email,
                                        district: _signUpDatas.district,
                                        password: _signUpDatas.password,
                                        confirmPassword: value.toString(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20),
                                child: ElevatedButton(
                                  onPressed: signUpController,
                                  child: isLoading == false
                                      ? const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 14),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontFamily: 'Poppins'),
                                    ),
                                  )
                                      : const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child:
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(25)),
                                      primary: const Color.fromRGBO(
                                          91, 144, 148, 1.0)),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 0, bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/');
                          },
                          child: const Text("Continue",
                              style: TextStyle(
                                  color: Color.fromRGBO(91, 144, 148, 1.0),
                                  fontSize: 12)),
                        ),
                        const Text("Forgot Password",
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}