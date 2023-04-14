import 'package:flutter/material.dart';

import 'auth_card.dart';
import 'app_banner.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 174, 228, 198)),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Flexible(
                    child: SizedBox(
                        width: 300,
                        height: 80,
                        child: Image(
                            image: NetworkImage(
                                'https://www.logolynx.com/images/logolynx/ee/eeebd6f03cea172ad149f2095d575de0.png'))),
                  ),
                  SizedBox(height: 40),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: const AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
