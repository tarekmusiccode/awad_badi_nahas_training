import 'package:awad_badi_nahas_training/core/extensions/validations.dart';
import 'package:awad_badi_nahas_training/core/routes/page_route_names.dart';
import 'package:awad_badi_nahas_training/core/theme/app_colors.dart';
import 'package:awad_badi_nahas_training/core/widgets/custom_elevated_button.dart';
import 'package:awad_badi_nahas_training/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();
  bool _goodPass1 = false;
  bool _goodPass2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "New Password",
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
                runSpacing: 20,                children: [
                  Wrap(
                    children: [
                      Text(
                        "New password",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      CustomTextFormField(
                        controller: _passwordController1,
                        isPassword: true,
                        maxLines: 1,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            _goodPass1 = false;
                            return "Please enter your password";
                          }
                          else if (!Validations.validatePassword(value)) {
                            _goodPass1 = false;
                            return "Please enter your password right";
                          }
                          _goodPass1 = true;
                          return null;
                        }
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Confirm new password",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      CustomTextFormField(
                        controller: _passwordController2,
                        isPassword: true,
                        maxLines: 1,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            _goodPass2 = false;
                            return "Please enter your password";
                          }
                          else if (!Validations.validatePassword(value)) {
                            _goodPass2 = false;
                            return "Please enter your password right";
                          }
                          _goodPass2 = true;
                          return null;
                        }
                      ),
                    ],
                  ),
                ],
              ),
              CustomElevatedButton(
                text: "Reset Password",
                textColor: AppColors.white,
                buttonColor: AppColors.red,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
