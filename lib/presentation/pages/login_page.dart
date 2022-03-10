import 'package:flutter/material.dart';

import 'dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordHidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          IconButton(
            onPressed: () {
              print('Tombolnya di klik');
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                ),
              ),
              SizedBox(height: 12),
              TextFormField(
                obscureText: isPasswordHidden,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      isPasswordHidden = !isPasswordHidden;
                      setState(() {});
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
              MaterialButton(
                minWidth: double.maxFinite,
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  /// Navigate ke dashboard
                  Navigator.pushReplacementNamed(
                    context,
                    DashboardPage.routeName,
                  );
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
