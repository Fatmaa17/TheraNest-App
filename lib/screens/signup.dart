import 'package:flutter/material.dart';
import 'package:therapy_app/screens/LoginPage.dart';
import 'package:therapy_app/core/utilis/my_validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var usernamecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var usernamefocusnode = FocusNode();
  var emailfocusnode = FocusNode();
  var passwordfocusnode = FocusNode();
  var confirmpasswordfocusnode = FocusNode();
  var formkey = GlobalKey<FormState>();
  bool ispassword = true;

  @override
  void initState() {
    usernamecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    confirmpasswordController = TextEditingController();
    // Focus Nodes
    usernamefocusnode = FocusNode();
    emailfocusnode = FocusNode();
    passwordfocusnode = FocusNode();
    confirmpasswordfocusnode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    usernamecontroller.dispose();
    confirmpasswordController.dispose();
    // Focus Nodes
    usernamefocusnode.dispose();
    emailfocusnode.dispose();
    passwordfocusnode.dispose();
    confirmpasswordfocusnode.dispose();
    super.dispose();
  }

  Future<void> _registerFct() async {
    final isValid = formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(children: [
          Image.asset(
            "assets/images/signup.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Column(
              children: [_header(context), _inputfield(context)],
            ),
          )
        ]));
  }

  _header(context) {
    return const Padding(
      padding: EdgeInsets.only(top: 200),
      child: Column(
        children: [
          Text(
            "Create Account",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico'),
          ),
          Text(
            "Enter Details To Get Started",
            style: TextStyle(fontFamily: 'Pacifico'),
          )
        ],
      ),
    );
  }

  _inputfield(context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: usernamecontroller,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              focusNode: usernamefocusnode,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                labelText: 'Username',
              ),
              validator: (value) {
                return MyValidators.displayNamevalidator(value);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(emailfocusnode);
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: emailcontroller,
              focusNode: emailfocusnode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email Address',
              ),
              validator: (value) {
                return MyValidators.emailValidator(value);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(passwordfocusnode);
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              controller: passwordcontroller,
              focusNode: passwordfocusnode,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      ispassword = !ispassword;
                    });
                  },
                  icon: Icon(
                    ispassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                labelText: 'Password',
              ),
              validator: (value) {
                return MyValidators.passwordValidator(value);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(confirmpasswordfocusnode);
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              obscureText: true,
              controller: confirmpasswordController,
              focusNode: confirmpasswordfocusnode,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.password),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      ispassword = !ispassword;
                    });
                  },
                  icon: Icon(
                    ispassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                labelText: 'Confirm Password',
              ),
              validator: (value) {
                return MyValidators.repeatPasswordValidator(
                    value: value, password: passwordcontroller.text);
              },
              onFieldSubmitted: (value) {},
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE1D69E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onPressed: () {
                  _registerFct();
                },
                icon: const Icon(
                  Icons.verified_user,
                  color: Colors.black87,
                ),
                label: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                const Text('Do you have account already?',
                    style: TextStyle(fontFamily: 'Pacifico')),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
