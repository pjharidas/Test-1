import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../colors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      builder: (context, child) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to WhatsApp, " + Provider.of<AppData>(context).name,
                style: const TextStyle(fontSize: 33),
              ),
              // Image.asset("images/backgroundImage.png"),
              Wid2(),
            ],
          ),
        ));
      },
    );
  }
}

class Wid2 extends StatelessWidget {
  const Wid2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wid3();
  }
}

class Wid3 extends StatelessWidget {
  const Wid3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wid4();
  }
}

class Wid4 extends StatefulWidget {
  const Wid4({
    Key? key,
  }) : super(key: key);

  @override
  State<Wid4> createState() => _Wid4State();
}

class _Wid4State extends State<Wid4> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          // can be replaced with context.watch().name (listen : true) 
          Provider.of<AppData>(context).name,
            style: TextStyle(color: Colors.white)),
        ElevatedButton(
            onPressed: () {
              // can be replaced with context.read().name (listen : false) (listen : false)
              Provider.of<AppData>(context, listen: false)
                  .changeData("We Fucked You So Bad !!");
            },
            child: const Text('Fuck Your Client !!'))
      ],
    );
  }
}

// # this class will be the info holder
// # it'll store values of all the variables and work as a change notifier for
//   all the Widgets which are using the vars inside this!!
class AppData with ChangeNotifier {
  String name = '';
  void changeData(String data) {
    name = data;
    notifyListeners();
  }
}
