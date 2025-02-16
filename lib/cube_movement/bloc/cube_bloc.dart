import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cube_event.dart';
import 'cube_state.dart';

class CubeBloc extends Bloc<CubeEvent, CubeState> {
  CubeBloc() : super(CubeState(alignment: Alignment.center)) {
    on<MoveUpArrowPressed>(_onMoveUp);
    on<MoveDownArrowPressed>(_onMoveDown);
    on<MoveLeftArrowPressed>(_onMoveLeft);
    on<MoveRightArrowPressed>(_onMoveRight);
  }

  void _onMoveUp(MoveUpArrowPressed event, Emitter<CubeState> emit) {
    switch (state.alignment) {
      case Alignment.topCenter:
      case Alignment.topLeft:
      case Alignment.topRight:
        return;
      case Alignment.center:
        emit(state.copyWith(alignment: Alignment.topCenter));
        break;
      case Alignment.bottomCenter:
        emit(state.copyWith(alignment: Alignment.center));
        break;
      case Alignment.centerRight:
        emit(state.copyWith(alignment: Alignment.topRight));
        break;
      case Alignment.bottomRight:
        emit(state.copyWith(alignment: Alignment.centerRight));
        break;
      case Alignment.centerLeft:
        emit(state.copyWith(alignment: Alignment.topLeft));
        break;
      case Alignment.bottomLeft:
        emit(state.copyWith(alignment: Alignment.centerLeft));
        break;
    }
  }

  void _onMoveDown(MoveDownArrowPressed event, Emitter<CubeState> emit) {
    switch (state.alignment) {
      case Alignment.bottomCenter:
      case Alignment.bottomLeft:
      case Alignment.bottomRight:
        return;
      case Alignment.center:
        emit(state.copyWith(alignment: Alignment.bottomCenter));
        break;
      case Alignment.topCenter:
        emit(state.copyWith(alignment: Alignment.center));
        break;
      case Alignment.topLeft:
        emit(state.copyWith(alignment: Alignment.centerLeft));
        break;
      case Alignment.topRight:
        emit(state.copyWith(alignment: Alignment.centerRight));
        break;
      case Alignment.centerRight:
        emit(state.copyWith(alignment: Alignment.bottomRight));
        break;
      case Alignment.centerLeft:
        emit(state.copyWith(alignment: Alignment.bottomLeft));
        break;
    }
  }

  void _onMoveLeft(MoveLeftArrowPressed event, Emitter<CubeState> emit) {
    switch (state.alignment) {
      case Alignment.topLeft:
      case Alignment.centerLeft:
      case Alignment.bottomLeft:
        return;
      case Alignment.center:
        emit(state.copyWith(alignment: Alignment.centerLeft));
        break;
      case Alignment.topCenter:
        emit(state.copyWith(alignment: Alignment.topLeft));
        break;
      case Alignment.bottomCenter:
        emit(state.copyWith(alignment: Alignment.bottomLeft));
        break;
      case Alignment.topRight:
        emit(state.copyWith(alignment: Alignment.topCenter));
        break;
      case Alignment.centerRight:
        emit(state.copyWith(alignment: Alignment.center));
        break;
      case Alignment.bottomRight:
        emit(state.copyWith(alignment: Alignment.bottomCenter));
        break;
    }
  }

  void _onMoveRight(MoveRightArrowPressed event, Emitter<CubeState> emit) {
    switch (state.alignment) {
      case Alignment.topRight:
      case Alignment.centerRight:
      case Alignment.bottomRight:
        return;
      case Alignment.center:
        emit(state.copyWith(alignment: Alignment.centerRight));
        break;
      case Alignment.topCenter:
        emit(state.copyWith(alignment: Alignment.topRight));
        break;
      case Alignment.bottomCenter:
        emit(state.copyWith(alignment: Alignment.bottomRight));
        break;
      case Alignment.topLeft:
        emit(state.copyWith(alignment: Alignment.topCenter));
        break;
      case Alignment.centerLeft:
        emit(state.copyWith(alignment: Alignment.center));
        break;
      case Alignment.bottomLeft:
        emit(state.copyWith(alignment: Alignment.bottomCenter));
        break;
    }
  }
}
