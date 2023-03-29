import 'package:attendence_checker/attendence/attendence_bloc.dart';
import 'package:attendence_checker/attendence/models/attendant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendenceBloc(),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || value == null) {
                  return 'Name is required';
                }
              },
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              validator: (value) {
                final regex = RegExp(r'^\d+$');

                if (value!.isEmpty || value == null) {
                  return 'Age is required';
                }

                if (!regex.hasMatch(value)) {
                  return 'Age must be a number';
                }
              },
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    context.read<AttendenceBloc>().add(
                          AttendantAddEvent(
                            attendant: Attendant(
                              _nameController.text,
                              int.parse(_ageController.text),
                            ),
                          ),
                        );

                    Navigator.pop(context);
                  },
                  color: Colors.indigo,
                  splashColor: Colors.white54,
                  child: const Text(
                    'Check in',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
