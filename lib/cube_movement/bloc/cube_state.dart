import 'package:flutter/material.dart';

class CubeState {
  Alignment alignment;

  CubeState({required this.alignment});

  CubeState copyWith({Alignment? alignment}) {
    return CubeState(alignment: alignment ?? this.alignment);
  }
}
