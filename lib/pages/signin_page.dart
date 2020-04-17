import 'package:flutter/material.dart';
import 'package:catapp/catalogged_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import '../pages/home_page.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class SigninPage extends StatelessWidget {
  static const routeName = '/loginPage';
  String _email, _password;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Sign In'),
      ),
      body: Form(
        key: _keyForm,
        child: Container(
          padding: const EdgeInsets.all(15),
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          child: ListView(
            children: <Widget>[
              Image.asset(
                'assets/images/receipt_icon.png',
                height: 130,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Please enter an Email';
                  }
                  return null;
                },
                onSaved: (input) => _email = input,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Email',
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (input) => _password = input,
                obscureText: true,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                textColor: Colors.white,
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton.icon(
                icon: Icon(Catalogged.google),
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                textColor: Colors.white,
                onPressed: () {
                  FirebaseUser user = null;
                  user = _handleSignIn() as FirebaseUser;
                  if (user != null) {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  }
                },
              ),
            ],
          ),
        ),
      )
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("this is signed in from: " + user.displayName);
    return user;
  }

  Future<FirebaseUser> _normalSignIn() async{
    final formState = _keyForm.currentState;
    if(formState.validate()){
      //TODO firebase login
    }
  }
}


