import 'package:attendence_checker/attendence/attendence_bloc.dart';
import 'package:attendence_checker/attendence/models/attendant.dart';
import 'package:attendence_checker/attendence/views/attendant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AttendenceList extends StatelessWidget {
  const AttendenceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendenceBloc, AttendenceState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    splashColor: Colors.grey,
                    highlightColor: Colors.grey,
                    onTap: () => Navigator.pushNamed(
                        context, AttendantScreen.routeName,
                        arguments: index),
                    child: Ink(
                      child: Card(
                        elevation: 20,
                        color: Colors.indigo,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.list[index].name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              DateFormat('HH:mm')
                                  .format(state.list[index].checkInTime),
                              style: const TextStyle(color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: state.list.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
            )
          ],
        );
      },
    );
  }
}
