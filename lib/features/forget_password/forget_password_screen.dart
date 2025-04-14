import 'package:awad_badi_nahas_training/core/extensions/validations.dart';
import 'package:awad_badi_nahas_training/core/theme/app_colors.dart';
import 'package:awad_badi_nahas_training/core/widgets/custom_elevated_button.dart';
import 'package:awad_badi_nahas_training/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 33
          )
        )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  Text(
                    "Email",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  CustomTextFormField(
                    isPassword: true,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Ex@gmail.com",
                    enableSuggestions: true,
                    hintColor: Colors.grey,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your email address";
                      }
                      else if (!Validations.validateEmail(value)) {
                        return "Please enter your email address right";
                      }
                      return null;
                    }
                  ),
                ],
              ),
              CustomElevatedButton(
                text: "Next",
                textColor: AppColors.white,
                buttonColor: AppColors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
