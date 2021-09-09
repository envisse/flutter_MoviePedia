//extend dari base_page.dart
part of 'base.dart';

class Registerpage extends StatefulWidget {
  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _retypepassword = TextEditingController();
  TextEditingController _hp = TextEditingController();
  bool _validate = true;

  //button action function
  _onRegisterButtonPressed() {
    if (_formkey.currentState!.validate()) {
      print('coming soon with bloc pattern');
    } else {
      setState(() {
        _validate = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Dimens.color_background,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextComponent(
                      textcomp: Textcomp.heading1, text: 'REGISTER'),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextComponent(
                      textcomp: Textcomp.body, text: "Let's make a new one"),
                ),
                SizedBox(
                  height: 15,
                ),
                Textformfieldcomponent(
                  hint: 'fullname',
                  validator: (value) => value!.isEmpty ? 'fill fullname' : null,
                  controller: _fullname,
                  icons: _validate
                      ? Icon(
                          Icons.person,
                          color: null,
                        )
                      : Icon(Icons.person, color: Dimens.color_error),
                ),
                SizedBox(
                  height: 15,
                ),
                Textformfieldcomponent(
                  hint: 'Email',
                  validator: (value) => value!.isEmpty ? 'fill email' : null,
                  controller: _email,
                  icons: _validate
                      ? Icon(
                          Icons.mail,
                          color: null,
                        )
                      : Icon(
                          Icons.mail,
                          color: Dimens.color_error,
                        ),
                ),
                SizedBox(
                  height: 15,
                ),
                Textformfieldcomponent(
                  hint: 'Phone Number',
                  validator: (value) => value!.isEmpty ? 'fill email' : null,
                  controller: _hp,
                  icons: _validate
                      ? Icon(
                          Icons.phone_android,
                          color: null,
                        )
                      : Icon(
                          Icons.phone_android,
                          color: Dimens.color_error,
                        ),
                ),
                SizedBox(
                  height: 15,
                ),
                Textformfieldcomponent(
                  hint: 'password',
                  validator: (value) => value!.isEmpty ? 'fill password' : null,
                  obsecure: true,
                  controller: _password,
                  icons: _validate
                      ? Icon(
                          Icons.vpn_key,
                          color: null,
                        )
                      : Icon(
                          Icons.vpn_key,
                          color: Dimens.color_error,
                        ),
                ),
                SizedBox(
                  height: 15,
                ),
                Textformfieldcomponent(
                  hint: 'retype password',
                  validator: (value) => value!.isEmpty
                      ? 'fill password'
                      : value != _password.text
                          ? 'password not match'
                          : null,
                  controller: _retypepassword,
                  icons: _validate
                      ? Icon(
                          Icons.vpn_key,
                          color: null,
                        )
                      : Icon(
                          Icons.vpn_key,
                          color: Dimens.color_error,
                        ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ButtonComponent(
                      text: 'REGISTER',
                      function: _onRegisterButtonPressed,
                      buttonComponentStyle: ButtonComponentStyle.ButtonContained),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
