import 'package:awad_badi_nahas_training/core/constants/app_assets.dart';
import 'package:awad_badi_nahas_training/core/extensions/validations.dart';
import 'package:awad_badi_nahas_training/core/routes/page_route_names.dart';
import 'package:awad_badi_nahas_training/core/theme/app_colors.dart';
import 'package:awad_badi_nahas_training/core/widgets/custom_elevated_button.dart';
import 'package:awad_badi_nahas_training/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Log in",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 33
                      ),
                    ),
                    SizedBox(height: 50),
                    Wrap(
                      children: [
                        Text(
                          "Email",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        CustomTextFormField(
                          controller: _emailController,
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
                    SizedBox(height: 12),
                    Wrap(
                      children: [
                        Text(
                          "Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          isPassword: true,
                          maxLines: 1,
                          onValidate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter your password";
                            }
                            else if (!Validations.validatePassword(value)) {
                              return "Please enter your password right";
                            }
                            return null;
                          }
                        ),
                      ],
                    ),
                    CheckboxListTile(
                      title: Text(
                        "Remeber me",
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      value: _rememberMe,
                      activeColor: AppColors.black,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    _passwordController.text.trim().isEmpty && _emailController.text.trim().isEmpty ?
                      CustomElevatedButton(text: "Login", buttonColor: AppColors.redGrey, textColor: AppColors.white) : 
                        CustomElevatedButton(text: "Login", buttonColor: AppColors.red, textColor: AppColors.white),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, PageRouteNames.forgetPassword);
                          },
                          child: Wrap(
                            children: [
                              Text(
                                'Forgot your password?',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.red,
                              )
                            ]
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomElevatedButton(text: "Continue with Phone number", textColor: AppColors.black, icn: Icons.phone),
                    SizedBox(height: 10),
                    CustomElevatedButton(text: "Continue with Google", textColor: AppColors.black, imgIcn: AppAssets.googleIcn,),
                    SizedBox(height: 10),
                    CustomElevatedButton(text: "Continue with Facebook", textColor: AppColors.black, imgIcn: AppAssets.facebookIcn),
                    SizedBox(height: 20),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 13
                            )
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Create account",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          )
                        ]
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
