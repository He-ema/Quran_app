import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AzkarItem extends StatefulWidget {
  const AzkarItem(
      {super.key,
      required this.text,
      required this.numberOfRepetation,
      @required this.hint});
  final String text;
  final int numberOfRepetation;
  final String? hint;

  @override
  State<AzkarItem> createState() => _AzkarItemState();
}

class _AzkarItemState extends State<AzkarItem> {
  int currentNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration:
                const BoxDecoration(color: Color(0xffDEE2E6), boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: Offset(6, 6),
                  blurStyle: BlurStyle.solid)
            ]),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.hint != null
                      ? Column(
                          children: [
                            const Divider(
                              color: Colors.black,
                            ),
                            Text(
                              widget.hint!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: GestureDetector(
                      onTap: () {
                        if (currentNumber < widget.numberOfRepetation) {
                          currentNumber++;
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              spreadRadius: 1,
                            )
                          ],
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: currentNumber != widget.numberOfRepetation
                              ? Text(
                                  '$currentNumber/${widget.numberOfRepetation}',
                                  style: const TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              : Icon(
                                  FontAwesomeIcons.check,
                                  size: 48,
                                  color: Colors.amber[100],
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
          left: 55,
          top: -60,
          child: Image.asset(
            'assets/images/shape2.png',
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.width * 0.60,
          ),
        ),
        Positioned(
          left: 55,
          bottom: -20,
          child: Image.asset(
            'assets/images/shape3.png',
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.width * 0.40,
          ),
        ),
      ],
    );
  }
}
