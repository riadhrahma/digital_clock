import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NumberP extends StatefulWidget {
  NumberP({Key key, this.num}) : super(key: key);

  final int num;

  NumberPage createState() => NumberPage();
}

class NumberPage extends State<NumberP> with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController fadeController;

  var one = {
    'top': false,
    'topRight': false,
    'topLeft': true,
    'midl': false,
    'bottomRight': false,
    'bottomLeft': true,
    'bottom': false,
  };

  var tow = {
    'top': true,
    'topRight': true,
    'topLeft': false,
    'midl': true,
    'bottomRight': false,
    'bottomLeft': true,
    'bottom': true,
  };

  var three = {
    'top': true,
    'topRight': true,
    'topLeft': false,
    'midl': true,
    'bottomRight': true,
    'bottomLeft': false,
    'bottom': true,
  };

  var four = {
    'top': false,
    'topRight': true,
    'topLeft': true,
    'midl': true,
    'bottomRight': true,
    'bottomLeft': false,
    'bottom': false,
  };

  var five = {
    'top': true,
    'topRight': false,
    'topLeft': true,
    'midl': true,
    'bottomRight': true,
    'bottomLeft': false,
    'bottom': true,
  };

  var six = {
    'top': true,
    'topRight': false,
    'topLeft': true,
    'midl': true,
    'bottomRight': true,
    'bottomLeft': true,
    'bottom': true,
  };

  var seven = {
    'top': true,
    'topRight': true,
    'topLeft': true,
    'midl': true,
    'bottomRight': true,
    'bottomLeft': true,
    'bottom': true,
  };

  var eight = {
    'top': true,
    'topRight': true,
    'topLeft': true,
    'midl': true,
    'bottomRight': true,
    'bottomLeft': true,
    'bottom': true,
  };

  var nine = {
    'top': true,
    'topRight': true,
    'topLeft': true,
    'midl': true,
    'bottomRight': true,
    'bottomLeft': false,
    'bottom': true,
  };

  var firstParametre = {
    'top': 0.75,
    'topRight': 0.5,
    'topLeft': 0.0,
    'midl': 0.25,
    'bottomRight': 0.5,
    'bottomLeft': 0.0,
    'bottom': 0.25,
  };

  var secondParametre = {
    'top': Alignment.topCenter,
    'topRight': Alignment.centerRight,
    'topLeft': Alignment.bottomCenter,
    'midl': Alignment.bottomCenter,
    'bottomRight': Alignment.centerRight,
    'bottomLeft': Alignment.bottomCenter,
    'bottom': Alignment.bottomCenter,
  };

  RotationTransition top(
          {bool show, Color color, AnimationController controller}) =>
      RotationTransition(
          alignment: show ? secondParametre['top'] : Alignment.bottomCenter,
          turns: Tween(begin: 0.0, end: show ? firstParametre['top'] : 0.25)
              .animate(controller),
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: color,
          ));

  RotationTransition topRight(
          {bool show, Color color, AnimationController controller}) =>
      RotationTransition(
          alignment:
              show ? secondParametre['topRight'] : Alignment.bottomCenter,
          turns:
              Tween(begin: 0.0, end: show ? firstParametre['topRight'] : 0.25)
                  .animate(controller),
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: color,
          ));

  RotationTransition topLeft(
          {bool show, Color color, AnimationController controller}) =>
      RotationTransition(
          alignment: secondParametre['topLeft'],
          turns: Tween(begin: 0.0, end: show ? firstParametre['topLeft'] : 0.25)
              .animate(controller),
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: color,
          ));

  RotationTransition midl(
          {bool show, Color color, AnimationController controller}) =>
      RotationTransition(
          alignment: secondParametre['midl'],
          turns: Tween(begin: 0.0, end: show ? firstParametre['midl'] : 0.25)
              .animate(controller),
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: color,
          ));

  RotationTransition bottomRight(
          {bool show, Color color, AnimationController controller}) =>
      RotationTransition(
          alignment:
              show ? secondParametre['bottomRight'] : Alignment.topCenter,
          turns: Tween(
                  begin: 0.0, end: show ? firstParametre['bottomRight'] : 0.75)
              .animate(controller),
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: color,
          ));

  RotationTransition bottomLeft(
          {bool show, Color color, AnimationController controller}) =>
      RotationTransition(
          alignment: show ? secondParametre['bottomLeft'] : Alignment.topCenter,
          turns:
              Tween(begin: 0.0, end: show ? firstParametre['bottomLeft'] : 0.75)
                  .animate(controller),
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: color,
          ));

  RotationTransition bottom(
          {bool show, Color color, AnimationController controller}) =>
      RotationTransition(
          alignment: show ? secondParametre['bottom'] : Alignment.topCenter,
          turns: Tween(begin: 0.0, end: show ? firstParametre['bottom'] : 0.75)
              .animate(controller),
          child: Icon(
            Icons.more_vert,
            size: 30,
            color: color,
          ));

  Container number({int num}) {
    int temp;
    if (temp != num) {
      controller.reset();
      controller.forward();
    }

    if (num == 1) {
      controller.reverse();
    }

    Map<String, bool> showParametre;

    switch (num) {
      case 0:
        {
          showParametre = eight;
          break;
        }

      case 1:
        {
          showParametre = eight;

          break;
        }

      case 2:
        {
          showParametre = tow;
          break;
        }

      case 3:
        {
          showParametre = three;
          break;
        }

      case 4:
        {
          showParametre = four;
          break;
        }

      case 5:
        {
          showParametre = five;
          break;
        }

      case 6:
        {
          showParametre = six;
          break;
        }

      case 7:
        {
          showParametre = seven;
          break;
        }

      case 8:
        {
          showParametre = eight;
          break;
        }

      case 9:
        {
          showParametre = nine;
          break;
        }
    }
    temp = num;

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 0),
              child: Stack(
                children: <Widget>[
                  midl(
                      show: showParametre['midl'],
                      color: (showParametre == seven ||
                              num == 0 ||
                              showParametre == one)
                          ? Colors.white
                          : Colors.black,
                      controller: controller),
                  topLeft(
                      show: showParametre['topLeft'],
                      color:
                          showParametre == seven ? Colors.white : Colors.black,
                      controller: controller),
                  topRight(
                      show: showParametre['topRight'],
                      color: Colors.black,
                      controller: controller),
                  top(
                      show: showParametre['top'],
                      color: showParametre == one ? Colors.white : Colors.black,
                      controller: controller),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: Stack(
                children: <Widget>[
                  bottomLeft(
                      show: showParametre['bottomLeft'],
                      color:
                          showParametre == seven ? Colors.white : Colors.black,
                      controller: controller),
                  bottomRight(
                      show: showParametre['bottomRight'],
                      color: showParametre == one ? Colors.white : Colors.black,
                      controller: controller),
                  bottom(
                      show: showParametre['bottom'],
                      color: (showParametre == seven || showParametre == one)
                          ? Colors.white
                          : Colors.black,
                      controller: controller)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    fadeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return number(num: widget.num);
  }
}
