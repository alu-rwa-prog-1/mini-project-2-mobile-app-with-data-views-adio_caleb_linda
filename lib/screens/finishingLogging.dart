import 'package:flutter/material.dart';
import 'package:mitup/models/SignUpModel.dart';
import 'package:mitup/models/avatars.dart';

class FinishingLogging extends StatefulWidget {
  const FinishingLogging({Key? key}) : super(key: key);

  @override
  State<FinishingLogging> createState() => _FinishingLoggingState();
}

class _FinishingLoggingState extends State<FinishingLogging> {
  bool isLoading = false;
  final _form = GlobalKey<FormState>();
  var _signUpRealHandler =
  const CredentialsSignUp(selectedUserImage: "", username: "");
  void createNewUserHandler() {
    Navigator.of(context).pushNamed("/create-interest");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              children: AVATARS
                  .map((element) => Container(
                child: Image.asset(
                  element.avatarImagePath,
                  fit: BoxFit.cover,
                ),
              ))
                  .toList()),
          // todo NAMES REQUIRED

          Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            labelText: 'Enter your nickname',
                            labelStyle: const TextStyle(fontSize: 12),
                            suffixIcon: const Icon(Icons.people),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20)),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Fill your email";
                          }

                          return null;
                        },
                        onSaved: (value) {
                          _signUpRealHandler = CredentialsSignUp(
                              username: value.toString(),
                              selectedUserImage:
                              _signUpRealHandler.selectedUserImage);
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: createNewUserHandler,
                            child: isLoading == false
                                ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            )
                                : const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                primary: const Color.fromRGBO(91, 144, 148, 1.0)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}