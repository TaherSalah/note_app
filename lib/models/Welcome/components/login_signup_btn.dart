import 'package:flutter/material.dart';
import 'package:notes/shared/components/widgets/custom_button.dart';
import 'package:notes/shared/components/widgets/custom_navigate_and_finish.dart';
import '../../Login/login_screen.dart';
import '../../Signup/signup_screen.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: buttonElevated(label: 'Login',onPress: (){navigateAndFinish(context,const LoginScreen());}),

        ),
        const SizedBox(height: 16),
        buttonElevated(label: 'Sign up',onPress: (){navigateAndFinish(context,const SignUpScreen());}),
      ],
    );
  }
}
