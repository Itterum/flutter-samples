import 'package:flutter/material.dart';

import 'cube_bloc.dart';
import 'cube_event.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.cubeBloc});

  final CubeBloc cubeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cubeBloc.add(MoveUpArrowPressed());
                  },
                  child: const Icon(Icons.arrow_upward),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cubeBloc.add(MoveLeftArrowPressed());
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: () {
                    cubeBloc.add(MoveRightArrowPressed());
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cubeBloc.add(MoveDownArrowPressed());
                  },
                  child: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
