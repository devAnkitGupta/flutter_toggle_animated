import 'package:flutter/material.dart';
import 'package:flutter_toggle_animated/flutter_toggle_animated.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ToggleController _animatedController;

  @override
  void initState() {
    _animatedController = ToggleController(
        vsync: this, animationDuration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Animate Toggle"),
      ),
      body: Stack(
        children: [
          Center(
            child: RaisedButton(
              onPressed: () {
                _animatedController.toggle();
              },
              child: Text("Toggle"),
            ),
          ),
          FractionalTranslation(
            translation:
                Offset(1.0 - _animatedController.currentPercentOpen, 0.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 150,
                height: double.infinity,
                color: Colors.black54,
                child: buildColumn(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuildListButtons(
          icon: Icons.settings,
          txt: "Settings",
          fun: () => _animatedController.close(),
        ),
        BuildListButtons(
          icon: Icons.supervised_user_circle,
          txt: "Friends",
          fun: () => _animatedController.close(),
        ),
        BuildListButtons(
          icon: Icons.folder,
          txt: "Directory",
          fun: () => _animatedController.close(),
        ),
        BuildListButtons(
          icon: Icons.security,
          txt: "Security",
          fun: () => _animatedController.close(),
        ),
        BuildListButtons(
          icon: Icons.notifications,
          txt: "Notifications",
          fun: () => _animatedController.close(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }
}

class BuildListButtons extends StatelessWidget {
  const BuildListButtons({
    Key key,
    this.icon,
    this.txt,
    this.fun,
  }) : super(key: key);

  final IconData icon;
  final String txt;
  final VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            txt,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
