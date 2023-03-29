import 'package:attendence_checker/attendence/attendence_bloc.dart';
import 'package:attendence_checker/attendence/models/attendant.dart';
import 'package:attendence_checker/attendence/views/attendant.dart';
import 'package:attendence_checker/attendence/views/attendence_list.dart';
import 'package:attendence_checker/widgets/forms/add_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AttendenceBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => const HomePage(),
              );

            case AttendantScreen.routeName:
              final args = settings.arguments as int;

              return MaterialPageRoute(
                builder: (context) => AttendantScreen(
                  id: args,
                ),
              );
          }
          return null;
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check in attendance'),
        centerTitle: true,
      ),
      body: const AttendenceList(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [const AddForm()]),
                  );
                });
          },
          child: const Icon(Icons.add)),
    );
  }
}
