import 'package:flutter/material.dart';
import 'package:rise_real_estate/core/common_widgets/common_button.dart';
import 'package:rise_real_estate/core/common_widgets/common_ios_back_button.dart';
import 'package:rise_real_estate/core/common_widgets/common_text_field_.dart';
import 'package:rise_real_estate/core/common_widgets/rich_text.dart';

class LoginSecondScreen extends StatefulWidget {
  const LoginSecondScreen({Key? key}) : super(key: key);

  @override
  State<LoginSecondScreen> createState() => _LoginSecondScreenState();
}

class _LoginSecondScreenState extends State<LoginSecondScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool passwordVisible = true;
  String? isValid = "";

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //const Image(
              //image: AssetImage("assets/images/undraw_city_life_gnpr_1.png"),
              //),
              const Align(
                  alignment: Alignment.topLeft, child: CommonIosBackButton()),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  const RichTextScreen(
                    text: "Let’s ",
                    text1: "Sign In'??'",
                    text2:
                        "\n\nquis nostrud exercitation ullamco laboris nisi ut.",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //SizedBox(),
                  isValid!.isEmpty
                      ? const SizedBox()
                      : Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0XFF234F68),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: Text(
                            isValid!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          )),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  CommonTextField(
                    textEditingController: emailController,
                    hintText: "Email",
                    prefixImage: "assets/icon_images/email_icon.png",
                    suffixImage: "assets/icon_images/email_icon.png",
                    hidePrefix: !emailFocus.hasFocus,
                    textInputType: TextInputType.emailAddress,
                    focusNode: emailFocus,
                    onEditingComplete: () {
                      debugPrint("object");
                      emailFocus.unfocus();
                      FocusScope.of(context).requestFocus(passwordFocus);
                      debugPrint(
                          "emailFocus.hasFocus! ---------->>>${emailFocus.hasFocus}");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTextField(
                    hidePrefix: !passwordFocus.hasFocus,
                    obscureText: passwordVisible,
                    textEditingController: passwordController,
                    hintText: "Password",
                    prefixImage: "assets/icon_images/Lock.png",
                    suffixImage: "assets/icon_images/Lock.png",
                    textInputType: TextInputType.visiblePassword,
                    focusNode: passwordFocus,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      debugPrint("object");
                      passwordFocus.unfocus();
                      debugPrint(
                          "passwordFocus.hasFocus! ---------->>>${passwordFocus.hasFocus}");
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            passwordController.clear();
                          });
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Color(0XFF1F4C6B),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                        child: const Text(
                          "Show password",
                          style: TextStyle(
                            color: Color(0XFF1F4C6B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonButton(
                    onTap: () {
                      if (validator()) {
                        setState(() {});
                      }
                    },
                    height: 62,
                    width: 250,
                    text: "Login",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Divider(
                          endIndent: 10,
                          thickness: 0.5,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                            color: Color(0XFFA1A5C1),
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                      Flexible(
                        child: Divider(
                          thickness: 0.5,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 65,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0XFFF5F4F8),
                          image: const DecorationImage(
                            scale: 3,
                            image: AssetImage("assets/images/Google.png"),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0XFFF5F4F8),
                          image: const DecorationImage(
                            scale: 3,
                            image: AssetImage("assets/images/Facebook.png"),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      RichTextScreen(
                        fontSize: 12,
                        text2: "Don’t have an account? ",
                      ),
                      RichTextScreen(
                        textStyle: TextStyle(
                          color: Color(0xff1F4C6B),
                          height: 1.5,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                        text1: "Register ",
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validator() {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      debugPrint("Enter correct email");
      isValid = "enter correct email";
      setState(() {});

      return false;
    } else if (!RegExp(
            r"^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$")
        .hasMatch(passwordController.text)) {
      debugPrint("Enter correct password");
      isValid = "your password is incorrect";
    }

    return true;
  }
}
