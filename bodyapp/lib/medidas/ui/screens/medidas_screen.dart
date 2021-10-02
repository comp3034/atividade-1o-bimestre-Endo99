import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MedidasScreen extends StatelessWidget {
  const MedidasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidas'),
        centerTitle: true,
        backgroundColor: Color(0XFF008B8B),
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              child: Positioned(
                height: height - 64,
                child: Image.asset(
                  'assets/images/women-silhouette.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: width * .3,
              child: Text('atualizado em ${DateTime.now()}'),
            ),
            Positioned(
              right: 48,
              top: 48,
              child: Row(
                children: [
                  MeasureLabelWidget(
                    label: 'Altura',
                    value: '170',
                    measure: 'cm',
                  ),
                  SizedBox(width: 16),
                  MeasureLabelWidget(
                    label: 'Peso',
                    value: '70',
                    measure: 'kg',
                  ),
                ],
              ),
            ),
            NestedMeasureWidget(
              top: 148.5,
              left: 0,
              width: width * .5,
              label: 'Pescoço',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 148.5 + 48,
              left: 0,
              width: width * .6,
              label: 'Peito',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 151.5 + 75.5,
              left: 59.5,
              width: width * .3,
              label: 'Bíceps',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 148.5 + 150,
              left: 8.5,
              width: width * .6,
              label: 'Cintura',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 148.5 + 180.5,
              left: 20.5,
              width: width * .45,
              label: 'Quadril',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 148.5 + 260.5,
              left: 8.5,
              width: width * .6,
              label: 'Coxa',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 148.5 + 370.5,
              left: 8.5,
              width: width * .6,
              label: 'Panturilha',
              value: '95',
              measure: ' cm',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class NestedMeasureWidget extends StatelessWidget {
  NestedMeasureWidget({
    Key? key,
    required this.width,
    this.top = 0,
    this.left = 0,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  final double width;
  final double top;
  final double left;
  final String label;
  final String value;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8),
                  child: DottedLine(
                    dashGapLength: 8,
                  ),
                ),
              ),
            ),
            MeasureLabelWidget(
              label: '$label',
              value: '$value',
              measure: '$measure',
            ),
          ],
        ),
      ),
    );
  }
}

class MeasureLabelWidget extends StatelessWidget {
  final String label;
  final String value;
  final String measure;

  const MeasureLabelWidget({
    Key? key,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        RichText(
          text: TextSpan(
            text: '$value',
            style: TextStyle(
              fontSize: 36,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: ' $measure',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SemiCirculo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      pi,
      pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
