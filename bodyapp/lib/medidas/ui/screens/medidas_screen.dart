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
            Positioned(
              // Gordura
              right: 28.5,
              top: height - 550,
              child: Column(
                children: [
                  SizedBox(
                    width: 90,
                    height: 95,
                    child: CustomPaint(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 8, top: 16),
                        child: MeasureLabelWidget(
                          label: 'Gordura',
                          value: '170',
                        ),
                      ),
                      painter: semiCirculo(
                          progress: 0.7,
                          primaryColor: Colors.green,
                          secondColor: Colors.red,
                          thirdColor: Colors.lightBlue,
                          fourtColor: Colors.blue,
                          width: 6.0),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              // IMC
              right: 28.5,
              top: height - 425,
              child: Column(
                children: [
                  SizedBox(
                    width: 90,
                    height: 95,
                    child: CustomPaint(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 8, top: 16),
                        child: MeasureLabelWidget(
                          label: 'IMC',
                          value: '22',
                        ),
                      ),
                      painter: semiCirculo(
                          progress: 0.7,
                          primaryColor: Colors.green,
                          secondColor: Colors.red,
                          thirdColor: Colors.lightBlue,
                          fourtColor: Colors.blue,
                          width: 6.0),
                    ),
                  ),
                ],
              ),
            ),
            NestedMeasureWidget(
              top: height - 610.5,
              left: 0,
              width: width * .5,
              label: 'Pescoço',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: height - 560.5,
              left: 0,
              width: width * .6,
              label: 'Peito',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: height - 520.5,
              left: 59.5,
              width: width * .3,
              label: 'Bíceps',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: height - 470.5,
              left: 8.5,
              width: width * .6,
              label: 'Cintura',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: height - 420.5,
              left: 20.5,
              width: width * .45,
              label: 'Quadril',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: height - 345.5,
              left: 8.5,
              width: width * .6,
              label: 'Coxa',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: height - 235.5,
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

class semiCirculo extends CustomPainter {
  const semiCirculo({
    required this.progress,
    required this.primaryColor,
    required this.secondColor,
    required this.thirdColor,
    required this.fourtColor,
    required this.width,
  })  : assert(progress != null),
        assert(primaryColor != null),
        assert(secondColor != null),
        assert(thirdColor != null),
        assert(fourtColor != null),
        assert(width != null),
        super();

  final double progress;
  final Color primaryColor;
  final Color secondColor;
  final Color thirdColor;
  final Color fourtColor;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromLTWH(.2, 1.0, size.width, size.height);
    final gradient = new SweepGradient(
      startAngle: 3 * pi / 2,
      endAngle: 7 * pi / 2,
      tileMode: TileMode.repeated,
      colors: [primaryColor, secondColor, thirdColor, fourtColor],
    );

    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - (width / 2);
    final startAngle = pi;
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius),
        startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
