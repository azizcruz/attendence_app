import 'package:attendence_checker/attendence/attendence_bloc.dart';
import 'package:attendence_checker/attendence/models/attendant.dart';
import 'package:attendence_checker/widgets/forms/update_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AttendantScreen extends StatefulWidget {
  static const String routeName = '/attendant-detail';
  final int id;
  const AttendantScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<AttendantScreen> createState() => _AttendantScreenState();
}

class _AttendantScreenState extends State<AttendantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AttendenceBloc, AttendenceState>(
                builder: (context, state) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: titleStyle(context),
                            ),
                            Text(
                              state.list[widget.id].name,
                              style: titleStyle(context),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text('Age: ', style: titleStyle(context)),
                            Text(
                              state.list[widget.id].age.toString(),
                              style: titleStyle(context),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              'Check in: ',
                              style: titleStyle(context),
                            ),
                            Text(
                              DateFormat('HH:mm')
                                  .format(state.list[widget.id].checkInTime),
                              style: titleStyle(context),
                            )
                          ],
                        ),
                      ]),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 18,
              ),
              BlocBuilder<AttendenceBloc, AttendenceState>(
                builder: (context, state) {
                  return UpdateForm(
                      id: widget.id,
                      attendant: state.list[widget.id],
                      context: context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle? titleStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium;
}
