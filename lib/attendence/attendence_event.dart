part of 'attendence_bloc.dart';

abstract class AttendenceEvent extends Equatable {
  const AttendenceEvent();
}

class AttendantAddEvent extends AttendenceEvent {
  final Attendant attendant;

  const AttendantAddEvent({required this.attendant});

  @override
  List<Object?> get props => [attendant];

  AttendantAddEvent copyWith({Attendant? attendant}) {
    return AttendantAddEvent(
      attendant: attendant ?? this.attendant,
    );
  }
}

class AttendantEditEvent extends AttendenceEvent {
  final Attendant attendantChanges;
  final int attendantIndex;

  const AttendantEditEvent(
      {required this.attendantChanges, required this.attendantIndex});

  @override
  List<Object?> get props => [attendantChanges, attendantIndex];

  AttendantEditEvent copyWith({Attendant? attendant}) {
    return AttendantEditEvent(
      attendantChanges: attendantChanges,
      attendantIndex: attendantIndex,
    );
  }
}
