import 'each_data.dart';

class BarData {
  final double sunA;
  final double monA;
  final double tueA;
  final double wedA;
  final double thuA;
  final double friA;
  final double satA;

  BarData(this.sunA, this.monA, this.tueA, this.wedA, this.thuA, this.friA,
      this.satA);

  List<EachBar> barData = [];

  void initilizeBar() {
    barData = [
      EachBar(0,sunA),
      EachBar(1,monA),
      EachBar(2,tueA),
      EachBar(3,wedA),
      EachBar(4,thuA),
      EachBar(5,friA),
      EachBar(6,satA),
    ];
  }
}