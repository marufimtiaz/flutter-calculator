import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

Color? colorDark = Colors.blueGrey.shade900;
Color? colorLight = Colors.blueGrey.shade100;
Color? coloredText = Colors.blue.shade600;
Color? darkColoredText = Colors.blue.shade300;
bool darkMode = false;

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: darkMode ? colorDark : colorLight,
        leading: Icon(Icons.settings,
            color: darkMode ? Colors.white70 : coloredText),
        centerTitle: true,
        title: GestureDetector(
            onTap: () {
              setState(() {
                darkMode ? darkMode = false : darkMode = true;
              });
            },
            child: switchMode()),
        actions: [
          Icon(Icons.history, color: darkMode ? Colors.white70 : coloredText),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 80),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '12.25',
                      style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : coloredText),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.equal,
                        size: 35,
                        color: darkMode ? darkColoredText : Colors.grey,
                      ),
                      Text(
                        '1,078/88',
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? darkColoredText : Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ovalButton(title: 'sin'),
                    ovalButton(title: 'cos'),
                    ovalButton(title: 'tan'),
                    ovalButton(title: '%')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textButton(
                        borderRadius: BorderRadius.circular(40),
                        title: 'C',
                        textColor: darkMode ? darkColoredText : coloredText),
                    textButton(title: '('),
                    textButton(title: ')'),
                    iconButton(
                      icon: CupertinoIcons.divide,
                      iconSize: 35,
                      iconColor: darkMode ? darkColoredText : coloredText,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textButton(title: '7'),
                    textButton(title: '8'),
                    textButton(title: '9'),
                    iconButton(
                      icon: CupertinoIcons.multiply,
                      iconSize: 35,
                      iconColor: darkMode ? darkColoredText : coloredText,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textButton(title: '4'),
                    textButton(title: '5'),
                    textButton(title: '6'),
                    iconButton(
                      icon: CupertinoIcons.minus,
                      iconSize: 35,
                      iconColor: darkMode ? darkColoredText : coloredText,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textButton(title: '1'),
                    textButton(title: '2'),
                    textButton(title: '3'),
                    iconButton(
                      icon: CupertinoIcons.plus,
                      iconSize: 35,
                      iconColor: darkMode ? darkColoredText : coloredText,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textButton(title: '0'),
                    iconButton(
                        borderRadius: BorderRadius.circular(20),
                        icon: CupertinoIcons.app_fill,
                        iconColor: darkMode ? Colors.white : Colors.black,
                        iconSize: 10),
                    iconButton(
                      icon: Icons.backspace_outlined,
                      iconSize: 35,
                      iconColor: darkMode ? darkColoredText : coloredText,
                    ),
                    iconButton(
                      icon: CupertinoIcons.equal,
                      iconSize: 35,
                      iconColor: darkMode ? darkColoredText : coloredText,
                    )
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconButton({
    double padding = 17,
    required IconData icon,
    required Color? iconColor,
    required double? iconSize,
    BorderRadius? borderRadius,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ButtonContainer(
        darkMode: darkMode,
        borderRadius: borderRadius ??= BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        child: SizedBox(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          )),
        ),
      ),
    );
  }

  Widget ovalButton({required String title, double padding = 17}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ButtonContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(50),
        padding:
            EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        child: SizedBox(
          width: padding * 2,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget switchMode() {
    return GestureDetector(
      onTap: () {
        setState(() {
          darkMode ? darkMode = false : darkMode = true;
        });
      },
      child: ButtonContainer(
        darkMode: darkMode,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : coloredText,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? darkColoredText : Colors.grey,
            ),
          ]),
        ),
      ),
    );
  }

  Widget textButton({
    required String title,
    Color? textColor,
    double padding = 17,
    BorderRadius? borderRadius,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ButtonContainer(
        darkMode: darkMode,
        borderRadius: borderRadius ??= BorderRadius.circular(20),
        padding: EdgeInsets.all(padding),
        child: SizedBox(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: textColor ??= (darkMode ? Colors.white : Colors.black),
                fontSize: 30),
          )),
        ),
      ),
    );
  }
}

class ButtonContainer extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const ButtonContainer({
    super.key,
    this.darkMode = false,
    required this.child,
    required this.borderRadius,
    required this.padding,
  });

  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: darkMode ? colorDark : colorLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color:
                          darkMode ? Colors.black54 : Colors.blueGrey.shade300,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                        color: darkMode
                            ? Colors.blueGrey.shade800
                            : Colors.blueGrey.shade50,
                        offset: const Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0)
                  ]),
        child: widget.child,
      ),
    );
  }
}
