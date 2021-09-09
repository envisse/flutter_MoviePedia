part of 'base.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _validate = true;

  //button action function
  _onLoginButtonPressed() {
    if (_formkey.currentState!.validate()) {
      print('coming soon with bloc pattern');
    } else {
      setState(() {
        _validate = false;
      });
    }
  }

  _onSignupButtonPressed() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextComponent(
                          textcomp: Textcomp.heading1, text: 'LOGIN'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextComponent(
                          textcomp: Textcomp.body,
                          text: 'please sign in to continue'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Textformfieldcomponent(
                        hint: 'email',
                        validator: (value) =>
                            value!.isEmpty ? 'fill email' : null,
                        controller: _email,
                        icons: _validate
                            ? Icon(
                                Icons.person,
                                color: null,
                              )
                            : Icon(
                                Icons.person,
                                color: Dimens.color_error,
                              )),
                    SizedBox(
                      height: 15,
                    ),
                    Textformfieldcomponent(
                      hint: 'password',
                      validator: (value) =>
                          value!.isEmpty ? 'fill password' : null,
                      obsecure: true,
                      controller: _password,
                      icons: _validate
                          ? Icon(Icons.vpn_key, color: null)
                          : Icon(Icons.vpn_key, color: Dimens.color_error),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonComponent(
                            text: 'LOGIN',
                            function: _onLoginButtonPressed,
                            buttonComponentStyle:
                                ButtonComponentStyle.ButtonContained),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account ?'),
                  ButtonComponent(
                      text: 'sign up',
                      function: _onSignupButtonPressed,
                      buttonComponentStyle: ButtonComponentStyle.ButtonText),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
