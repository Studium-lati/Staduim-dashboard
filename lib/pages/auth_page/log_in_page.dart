import 'package:dashbord/helper/const.dart';
import 'package:dashbord/provider/auth_provider.dart';
import 'package:dashbord/widgets/clickables/bouttem_navigation.dart';
import 'package:dashbord/widgets/clickables/main_button_widget.dart';
import 'package:dashbord/widgets/clickables/text_clickable.dart';
import 'package:dashbord/widgets/inputs/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(builder: (context, authConsumer, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/logo_remove.png',
                      height: getScreenSize(context).height * 0.3,
                      width: getScreenSize(context).width * 0.3,
                    ),
                    Text(
                      'Login here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextForm(
                        controller: _emailController,
                        labelText: "Email or Phone",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email or Phone is required';
                          }

                          return null;
                        }),
                    const SizedBox(height: 20),
                    TextForm(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }

                        return null;
                      },
                      controller: _passwordController,
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      obscure: _obscureText,
                    ),
                    const SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextClickable(
                          text: "Forgot your password?",
                          function: () {},
                          color: primaryColor,
                        )),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: getScreenSize(context).height * 0.07,
                      child: Mainbutton(
                          text: 'Log in',
                          textsize: 18,
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<AuthenProvider>(context,
                                      listen: false)
                                  .login({
                                _emailController.text.contains('@')
                                    ? 'email'
                                    : 'phone': _emailController.text.toString(),
                                'password': _passwordController.text.toString(),
                              }).then((value) {
                                if (value[0]) {
                                  Navigator.pushAndRemoveUntil(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TabsScreen()),
                                      (Route<dynamic> route) => false);
                                } else {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(value[1].toString())));
                                }
                              });
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
