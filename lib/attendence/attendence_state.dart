part of 'attendence_bloc.dart';

abstract class AttendenceState extends Equatable {
  List<Attendant> list = [];
  late Attendant? selectedAttendent;

  AttendenceState({required this.list, this.selectedAttendent});
}

class AttendenceInitial extends AttendenceState {
  AttendenceInitial({required super.list});

  @override
  List<Object> get props => [list];
}

class AttendantAddState extends AttendenceState {
  AttendantAddState({required super.list});

  @override
  List<Object?> get props => [list];
}

class AttendantEditState extends AttendenceState {
  AttendantEditState({required super.list});

  @override
  List<Object?> get props => [list];
}

class AttendantSelectState extends AttendenceState {
  AttendantSelectState({required super.list, required super.selectedAttendent});


  @override
  List<Object?> get props => [list];
}