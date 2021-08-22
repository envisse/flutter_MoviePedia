part of 'base.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool validate = true;

  var authentication = Authentication();

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
                      child: Textheading1(
                        text: 'Login',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Textbody(text: 'please sign in to continue'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Textformfieldcomponent(
                        hint: 'email',
                        validator: (value) =>
                            value!.isEmpty ? 'fill email' : null,
                        controller: _email,
                        icons: validate
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
                      icons: validate
                          ? Icon(Icons.vpn_key, color: null)
                          : Icon(Icons.vpn_key, color: Dimens.color_error),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              authentication.login(
                                  _email.text, _password.text, context);
                              setState(() {
                                validate = true;
                              });
                            } else {
                              setState(() {
                                validate = false;
                              });
                            }
                          },
                          child: Text('LOGIN'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Registerpage(),
                            ));
                      },
                      child: Text('Sign up'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}