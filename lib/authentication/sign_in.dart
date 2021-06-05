import 'package:flutter/material.dart';
import 'package:passioneurs/shared/drop_down_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as appLoc;

class LoginPage extends StatefulWidget {
  final Function changeLang;
  const LoginPage({Key? key, required this.changeLang}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String userName = '', password = '', _langLocal = 'en';
  double _sizedBoxHeight = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginPage(),
    );
  }

  _loginPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //The app logo
            Container(
              child: Text('Logo will be placed here'),
            ),
            SizedBox(height: _sizedBoxHeight),
            //The app user name and password field
            Container(
              child: _buildUsernamePasswordForm(),
            ),
            //The app social authentication
            Container()
          ]),
    );
  }

  //This form will allow to enter both user name and password
  _buildUsernamePasswordForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //User Name
          TextFormField(
            initialValue: '',
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.pink)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green),
                )),
            validator: (val) {
              if (val == '' || val == null) {
                return 'Username is required';
              }
            },
            onChanged: (val) {
              userName = val;
            },
          ),
          SizedBox(height: _sizedBoxHeight),
          //Password
          TextFormField(
            initialValue: '',
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.pink)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green),
                )),
            validator: (val) {
              if (val == '' || val == null) {
                return 'Password is required';
              }
            },
            onChanged: (val) {
              password = val;
            },
          ),
          SizedBox(height: _sizedBoxHeight),
          //Submit button to validate and check data
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('The username: $userName and password: $password');
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.yellow;
                    }
                    return Colors.pink;
                  }),
                ),
                child: Text(appLoc.AppLocalizations.of(context)!.submit)),
          ),
          SizedBox(
            height: _sizedBoxHeight * 3,
          ),
          Container(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isDense: true,
                isExpanded: true,
                value: _langLocal,
                onChanged: (val) {
                  setState(() {
                    _langLocal = val.toString();
                    widget.changeLang(_langLocal);
                  });
                },
                selectedItemBuilder: (BuildContext context) {
                  return Languages.locale().map<Widget>((e) {
                    return Center(
                      child: Text(e),
                    );
                  }).toList();
                },
                items: Languages.locale().map(
                  (String e) {
                    return DropdownMenuItem(child: Text(e), value: e);
                  },
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
