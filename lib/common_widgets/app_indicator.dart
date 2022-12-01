import 'package:flutter/material.dart';

class AppIndicator extends StatelessWidget {
  late int _numberOfDots;
  late int _currentIndex;


  // const AppIndicator({
  //   Key? key,
  //   required this.numberOfDots,
  //   required this.currentIndex,
  // }) : super(key: key);

  AppIndicator({
    Key? key,
    required int numberOfDots,
    required int currentIndex,

  }) {
    _numberOfDots = numberOfDots;
    _currentIndex = currentIndex;
    generateIndicatorDots();
  }

  List<Widget> indicatorDots = [];

  // void generateIndicatorDots() {
  //   for (int i = 0; i < _numberOfDots; i++) {
  //     indicatorDots.add(
  //       IndicatorDot(
  //         color: _currentIndex == i ? Colors.white : Colors.grey,
  //         width:  _currentIndex == i ? 24.0 : 16.0,
  //       ),
  //     );
  //   }
  // }

  void generateIndicatorDots() {
    for (int i = 0; i < _numberOfDots; i++) {
      indicatorDots.add(
        IndicatorDot(
          color: _currentIndex == i ? Colors.white : Colors.grey,
          width: _currentIndex == i ? 24.0 : 16.0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicatorDots,
      // children: indicatorDots.asMap().entries.map((entry){
      //   return IndicatorDot(
      //     color: _currentIndex == entry.key ? Colors.white : Colors.grey,
      //     width: _currentIndex == entry.key ? 24.0 : 16.0,
      //   );
      // }).toList(),
    );
  }

}

class IndicatorDot extends StatefulWidget {
  final Color color;
  final double width;

  const IndicatorDot({
    Key? key,
    required this.color,
    required this.width,
  }) : super(key: key);

  @override
  _IndicatorDotState createState() => _IndicatorDotState();
}

class _IndicatorDotState extends State<IndicatorDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //duration: Duration(seconds: 500),
      width: widget.width,
      height: 2,
      margin: EdgeInsets.only(right: 2.0),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}




