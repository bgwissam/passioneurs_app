import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as appLoc;
import 'package:passioneurs/services/database.dart';

class HomeLandingPage extends StatefulWidget {
  const HomeLandingPage({Key? key}) : super(key: key);

  @override
  _HomeLandingPageState createState() => _HomeLandingPageState();
}

class _HomeLandingPageState extends State<HomeLandingPage> {
  Database db = new Database();
  String welcome = '';
  @override
  void initState() {
    super.initState();
    _getWelcomeMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Home Landing Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(appLoc.AppLocalizations.of(context)!.helloWorld),
              SizedBox(
                height: 20,
              ),
              Text(welcome)
            ],
          ),
        ),
      ),
    );
  }

  //This is just for testing data
  _getWelcomeMessage() async {
    welcome = await db.fetchWelcome();
    setState(() {});
  }
}
