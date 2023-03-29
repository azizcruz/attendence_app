import 'dart:async';

import 'package:attendence_checker/attendence/models/attendant.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'attendence_event.dart';
part 'attendence_state.dart';

class AttendenceBloc extends Bloc<AttendenceEvent, AttendenceState> {
  AttendenceBloc() : super(AttendenceInitial(list: const [])) {
    on<AttendantAddEvent>((event, emit) {
      emit(AttendantAddState(list: [...state.list, event.attendant]));
    });

    on<AttendantEditEvent>((event, emit) {
      final newState = List<Attendant>.from(state.list);
      newState[event.attendantIndex] = event.attendantChanges;

      emit(AttendantEditState(list: newState));
    });
  }
}
