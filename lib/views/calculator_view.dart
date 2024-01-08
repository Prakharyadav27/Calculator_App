import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displaytwoController = TextEditingController();

  late final AppLifecycleListener _listener;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text = x.toString();
    displaytwoController.text = y.toString();

    _listener = AppLifecycleListener(
        onShow: _onShow,
        onHide: _onHide,
        onResume: _onResume,
        onDetach: _onDetach,
        onInactive: _onInactive,
        onPause: _onPause,
        onRestart: _onRestart,
        onStateChange: _onStateChange);
  }

  void _onShow() => print("onShow Called");
  void _onHide() => print("onHide Called");
  void _onResume() => print("onResume Called");
  void _onDetach() => print("onDetach Called");
  void _onInactive() => print("onInactive Called");
  void _onPause() => print("onPause Called");
  void _onRestart() => print("onRestart Called");
  void _onStateChange(AppLifecycleState state) =>
      print("onStateChange called with state : $state ");
  @override
  void dispose() {
    displayOneController.dispose();
    displaytwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0),
      child: Column(
        children: [
          DisplayOne(
            hint: "Enter First Number",
            controller: displayOneController,
          ),
          SizedBox(
            height: 40,
          ),
          DisplayOne(
            hint: "Enter First Number",
            controller: displaytwoController,
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              z.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! +
                          num.tryParse(displaytwoController.text)!;
                    });
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! -
                          num.tryParse(displaytwoController.text)!;
                    });
                  },
                  child: Icon(CupertinoIcons.minus),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! *
                          num.tryParse(displaytwoController.text)!;
                    });
                  },
                  child: Icon(CupertinoIcons.multiply),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! /
                          num.tryParse(displaytwoController.text)!;
                    });
                  },
                  child: Icon(CupertinoIcons.divide),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  x = 0;
                  y = 0;
                  z = 0;
                  displayOneController.clear();
                  displaytwoController.clear();
                });
              },
              label: Text("Clear"),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class DisplayOne extends StatelessWidget {
  const DisplayOne(
      {super.key, this.hint = "Enter a number", required this.controller});

  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(),
      autofocus: true,
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        // ),
        // disabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.white)),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.white)),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white38, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        // labelText: "0",
        hintText: "Enter values",
        hintStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
