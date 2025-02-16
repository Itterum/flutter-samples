import 'package:flutter/material.dart';

import 'buttons_widget.dart';

class AlignmentNotifier extends ChangeNotifier {
  Alignment _alignment;

  AlignmentNotifier(this._alignment);

  Alignment get alignment => _alignment;

  void moveUp() {
    switch (_alignment) {
      case Alignment.topCenter:
      case Alignment.topLeft:
      case Alignment.topRight:
        return;
      case Alignment.center:
        _alignment = Alignment.topCenter;
        break;
      case Alignment.bottomCenter:
        _alignment = Alignment.center;
        break;
      case Alignment.centerRight:
        _alignment = Alignment.topRight;
        break;
      case Alignment.bottomRight:
        _alignment = Alignment.centerRight;
        break;
      case Alignment.centerLeft:
        _alignment = Alignment.topLeft;
        break;
      case Alignment.bottomLeft:
        _alignment = Alignment.centerLeft;
        break;
    }

    notifyListeners();
  }

  void moveDown() {
    switch (_alignment) {
      case Alignment.bottomCenter:
      case Alignment.bottomLeft:
      case Alignment.bottomRight:
        return;
      case Alignment.center:
        _alignment = Alignment.bottomCenter;
        break;
      case Alignment.topCenter:
        _alignment = Alignment.center;
        break;
      case Alignment.topLeft:
        _alignment = Alignment.centerLeft;
        break;
      case Alignment.topRight:
        _alignment = Alignment.centerRight;
        break;
      case Alignment.centerRight:
        _alignment = Alignment.bottomRight;
        break;
      case Alignment.centerLeft:
        _alignment = Alignment.bottomLeft;
        break;
    }

    notifyListeners();
  }

  void moveLeft() {
    switch (_alignment) {
      case Alignment.topLeft:
      case Alignment.centerLeft:
      case Alignment.bottomLeft:
        return;
      case Alignment.center:
        _alignment = Alignment.centerLeft;
        break;
      case Alignment.topCenter:
        _alignment = Alignment.topLeft;
        break;
      case Alignment.bottomCenter:
        _alignment = Alignment.bottomLeft;
        break;
      case Alignment.topRight:
        _alignment = Alignment.topCenter;
        break;
      case Alignment.centerRight:
        _alignment = Alignment.center;
        break;
      case Alignment.bottomRight:
        _alignment = Alignment.bottomCenter;
        break;
    }

    notifyListeners();
  }

  void moveRight() {
    switch (_alignment) {
      case Alignment.topRight:
      case Alignment.centerRight:
      case Alignment.bottomRight:
        return;
      case Alignment.center:
        _alignment = Alignment.centerRight;
        break;
      case Alignment.topCenter:
        _alignment = Alignment.topRight;
        break;
      case Alignment.bottomCenter:
        _alignment = Alignment.bottomRight;
        break;
      case Alignment.topLeft:
        _alignment = Alignment.topCenter;
        break;
      case Alignment.centerLeft:
        _alignment = Alignment.center;
        break;
      case Alignment.bottomLeft:
        _alignment = Alignment.bottomCenter;
        break;
    }

    notifyListeners();
  }
}

class CubePageWidget extends StatefulWidget {
  const CubePageWidget({super.key});

  @override
  CubePageWidgetState createState() => CubePageWidgetState();
}

class CubePageWidgetState extends State<CubePageWidget> {
  final _alignment = AlignmentNotifier(Alignment.center);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cube')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListenableBuilder(
              listenable: _alignment,
              builder:
                  (context, child) => Expanded(
                    child: CubeWidget(alignment: _alignment.alignment),
                  ),
            ),
            Expanded(
              child: Buttons(
                onUp: _alignment.moveUp,
                onDown: _alignment.moveDown,
                onLeft: _alignment.moveLeft,
                onRight: _alignment.moveRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CubeWidget extends StatelessWidget {
  const CubeWidget({super.key, required this.alignment});

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
