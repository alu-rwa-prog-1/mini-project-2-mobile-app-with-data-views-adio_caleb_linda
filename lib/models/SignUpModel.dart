// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SignUpModel {
  @required
  final String email;
  @required
  final String district;
  @required
  final String password;
  @required
  final String confirmPassword;

  const SignUpModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.district,
  });
}

class CredentialsSignUp {
  final String selectedUserImage;
  final String username;
  const CredentialsSignUp(
      {required this.selectedUserImage, required this.username});
}