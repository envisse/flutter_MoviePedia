import 'package:flutter/material.dart';
import 'package:flutter_movie_blocpattern/services/authnetications.dart';
import 'package:flutter_movie_blocpattern/view/components/buttoncomponents.dart';
import 'package:flutter_movie_blocpattern/view/components/textformfield.dart';
import 'package:flutter_movie_blocpattern/view/shared/themedata.dart';

class Registerpage extends StatefulWidget {
  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  //inizialize
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _hp = TextEditingController();
  bool validate = true;
  Authentication _authentication = Authentication();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Textformfieldcomponent(
                hint: 'fullname',
                validator: (value) => value!.isEmpty ? 'fill fullname' : null,
                controller: _fullname,
                icons: validate
                    ? Icon(
                        Icons.person,
                        color: null,
                      )
                    : Icon(
                        Icons.person,
                        color: error,
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              Textformfieldcomponent(
                hint: 'Email',
                validator: (value) => value!.isEmpty ? 'fill email' : null,
                controller: _email,
                icons: validate
                    ? Icon(
                        Icons.mail,
                        color: null,
                      )
                    : Icon(
                        Icons.mail,
                        color: error,
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              Textformfieldcomponent(
                hint: 'password',
                validator: (value) => value!.isEmpty ? 'fill email' : null,
                obsecure: true,
                controller: _password,
                icons: validate
                    ? Icon(
                        Icons.vpn_key,
                        color: null,
                      )
                    : Icon(
                        Icons.vpn_key,
                        color: error,
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              Textformfieldcomponent(
                hint: 'retype password',
                validator: (value) => value!.isEmpty ? 'fill email' : null,
                controller: _hp,
                icons: validate
                    ? Icon(
                        Icons.vpn_key,
                        color: null,
                      )
                    : Icon(
                        Icons.vpn_key,
                        color: error,
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topRight,
                child: ButtonOutlinedComponent(
                  text: 'register',
                  function: () {
                    _authentication.register(
                        _fullname.text, _email.text, _password.text, _hp.text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
