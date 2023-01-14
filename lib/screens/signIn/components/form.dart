import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ims/components/customSurffixIcon.dart';
import 'package:ims/components/loadingButton.dart';
import 'package:ims/utils/constants.dart';
import 'package:ims/utils/keyBoard.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? phone;
  String? password;
  bool? remember = false;
  bool _passwordVisible = false;
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  final List<String?> errors = [];

  void initState() {
    _loadUserphone();
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          const SizedBox(height: 10),
          buildPasswordFormField(),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Theme(
                    data: ThemeData(
                        unselectedWidgetColor:
                            Color.fromARGB(255, 8, 42, 47) // Your color
                        ),
                    child: Checkbox(
                        activeColor: kPrimaryColor,
                        value: remember,
                        onChanged: _handleRemeberme),
                  )),
              Text(
                "Remember me",
                style: GoogleFonts.lato(color: kPrimaryColor, fontSize: 17),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    "/check_user",
                  );
                },
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.lato(
                      decoration: TextDecoration.underline,
                      color: kPrimaryColor,
                      fontSize: 17),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                  }
                },
                child: ContinueButton()),
          ),
        ],
      ),
    );
  }

  void _handleRemeberme(bool? value) {
    remember = value;

    setState(() {
      remember = value;
    });
  }

  void _loadUserphone() async {}

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !_passwordVisible,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 4) {
          return kShortPassError;
        } else if (value.length >= 25) {
          return kLongPassError;
        }
        return null;
      },
      controller: passController, //loginController.passController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: "Password",
        hintText: "Enter your password",
        hintStyle: GoogleFonts.lato(color: kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: _passwordVisible
              ? Icon(
                  Icons.visibility,
                  color: kPrimaryColor,
                )
              : Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (newValue) => phone = newValue,
      maxLength: 10,
      onChanged: (value) {
        if (value.isNotEmpty) {
          return null;
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        } else if (value.length < 10) {
          return kShortphoneError;
        } else if (value.length > 10) {
          return kLongphoneError;
        }
        return null;
      },
      controller: phoneController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: "Phone",
        hintText: "Enter your phone number",
        hintStyle: GoogleFonts.lato(color: kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(
          svgIcon: "assets/icons/Phone.svg",
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
