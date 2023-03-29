import 'package:attendence_checker/attendence/attendence_bloc.dart';
import 'package:attendence_checker/attendence/models/attendant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateForm extends StatefulWidget {
  const UpdateForm({
    super.key,
    required this.id,
    required this.attendant,
    required this.context,
  });

  final int id;
  final Attendant attendant;
  final BuildContext context;

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.attendant.name;
    _ageController.text = widget.attendant.age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendenceBloc(),
      child: ElevatedButton.icon(
        onPressed: () {
          showModalBottomSheet(
              constraints: const BoxConstraints(maxHeight: 500),
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
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
                        MaterialButton(
                          onPressed: () {
                            context.read<AttendenceBloc>().add(
                                  AttendantEditEvent(
                                      attendantChanges: Attendant(
                                        _nameController.text,
                                        int.parse(_ageController.text),
                                      ),
                                      attendantIndex: widget.id),
                                );

                            Navigator.pop(context);
                          },
                          color: Colors.indigo,
                          splashColor: Colors.white54,
                          child: const Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        icon: const Icon(Icons.edit),
        label: const Text(
          'Edit',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
