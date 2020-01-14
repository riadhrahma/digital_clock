import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'Number.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',

    // Start the app with the "/" named route. In our case, the app will start
    // on the FirstScreen Widget
    initialRoute: '/',
    routes: {
      // When we navigate to the "/" route, build the FirstScreen Widget
      '/': (context) => MyApp(),
      // When we navigate to the "/second" route, build the SecondScreen Widget
      '/second': (context) => MyHomePage(),
    },
  ));

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

// ignore: camel_case_types
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mainPage',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          accentColor: Colors.blue,
          accentColorBrightness: Brightness.light,
          buttonTheme: ButtonThemeData(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(style: BorderStyle.none))),
          appBarTheme: AppBarTheme(
            elevation: 0,
          )),
      home: MyHomePage(title: 'mainContent'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  DateTime _dateTime = DateTime.now();

  dynamic color = Colors.black.withOpacity(0.6);

  void _updateTime() {
    var p;

    Stream.periodic(const Duration(seconds: 1), (v) => v).listen((count) {
      if (p != DateTime.now().minute) {
        setState(() {
          _dateTime = DateTime.now();
        });
      }

      fadeController.forward();
      Future.delayed(Duration(milliseconds: 600), () {
        fadeController.reverse();
      });
      p = DateTime.now().minute;
    });
  }

  AnimationController fadeController;

  @override
  void initState() {
    fadeController = AnimationController(
        duration: const Duration(milliseconds: 350),
        vsync: this,
        reverseDuration: Duration(milliseconds: 70),
        animationBehavior: AnimationBehavior.preserve);

    _updateTime();

    super.initState();
  }

  int i = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(fadeController);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, bottom: 8.0, right: 8.0, top: 0.0),
                    child: FadeTransition(
                      child: NumberP(
                        num: _dateTime.hour.toString().length == 2
                            ? int.parse(_dateTime.hour.toString()[0])
                            : 0,
                      ),
                      opacity: animation,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, bottom: 8.0, right: 8.0, top: 0.0),
                    child: FadeTransition(
                      child: NumberP(
                        num: _dateTime.hour.toString().length == 2
                            ? int.parse(_dateTime.hour.toString()[1])
                            : int.parse(_dateTime.hour.toString()[0]),
                      ),
                      opacity: animation,
                    ),
                  ),
                  Transform.translate(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, bottom: 8.0, right: 8.0, top: 0.0),
                      child: Text(
                        'HH',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    offset:
                        Offset(0, double.parse(_dateTime.hour.toString()) / 3),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, bottom: 8.0, right: 8.0, top: 0.0),
                    child: FadeTransition(
                      child: NumberP(
                        num: _dateTime.minute.toString().length == 2
                            ? int.parse(_dateTime.minute.toString()[0])
                            : 0,
                      ),
                      opacity: animation,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, bottom: 8.0, right: 8.0, top: 0.0),
                    child: FadeTransition(
                      child: NumberP(
                        num: _dateTime.minute.toString().length == 2
                            ? int.parse(_dateTime.minute.toString()[1])
                            : int.parse(_dateTime.minute.toString()[0]),
                      ),
                      opacity: animation,
                    ),
                  ),
                  Transform.translate(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, bottom: 8.0, right: 8.0, top: 0.0),
                      child: Text(
                        'MN',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    offset:
                        Offset(0, double.parse(_dateTime.hour.toString()) / 3),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
