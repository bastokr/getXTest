import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gjmarket/res/custom_colors.dart';
import 'package:gjmarket/screens/user_info_screen.dart';
import 'package:gjmarket/widgets/sign_in_form.dart';

import '../app.dart';
import '../sample.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      /* Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => UserInfoScreen(
            user: user,
          ),
        ),
      );
      */
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',

        // 라우트들을 등록
        routes: {
          '/first': (context) => FirstScreen(), // 초기 라우트로 FirstScreen을 설정
          '/shop': (context) => CupertinoStoreApp(),
          '/second': (context) =>
              SecondScreen(), // '/second'란 경로로 SecondScrrent을 설정정
          '/sample': (context) => Sample(),
        },
        home: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              _emailFocusNode.unfocus();
              _passwordFocusNode.unfocus();
            },
            child: Scaffold(
              backgroundColor: CustomColors.firebaseNavy,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Image.asset(
                                'assets/noSub2.png',
                                height: 160,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'FlutterFire',
                              style: TextStyle(
                                color: CustomColors.firebaseYellow,
                                fontSize: 40,
                              ),
                            ),
                            Text(
                              'Authentication',
                              style: TextStyle(
                                color: CustomColors.firebaseOrange,
                                fontSize: 40,
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                // Respond to button press
                              },
                              child: Text("Go Shop111111"),
                            ),
                            OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/shop');
                                /*
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CupertinoStoreApp()),
                                */
                                //);
                                // Respond to button press
                              },
                              icon: Icon(Icons.add, size: 18),
                              label: Text("Go Shop"),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            Color(0xFF0D47A1),
                                            Color(0xFF1976D2),
                                            Color(0xFF42A5F5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(16.0),
                                      primary: Colors.white,
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/sample');
                                    },
                                    child: const Text('Gradient'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder(
                        future: _initializeFirebase(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error initializing Firebase');
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return SignInForm(
                              emailFocusNode: _emailFocusNode,
                              passwordFocusNode: _passwordFocusNode,
                            );
                          }
                          return CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              CustomColors.firebaseOrange,
                            ),
                          );
                        },
                      )
                      // SignInForm(
                      //   emailFocusNode: _emailFocusNode,
                      //   passwordFocusNode: _passwordFocusNode,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // 라우트의 이름으로 새로운 라우트 적재
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // 현재 라우트를 pop(제거)
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        // RiasedButton을 등록
        child: RaisedButton(
          child: Text('Go back!'),
          onPressed: () {
            // 버튼이 눌렸을 때 처리
            Navigator.pop(context); // 현재 라우트를 pop하여 제거함
          },
        ),
      ),
    );
  }
}
