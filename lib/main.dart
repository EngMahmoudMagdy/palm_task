import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_task/features/data_list/presentation/bloc/home_cubit.dart';
import 'package:palm_task/features/data_list/presentation/pages/home_page.dart';
import 'package:palm_task/injection_container.dart';

void main() async {
  //Initialization of Dependency Injection tool
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Providing the only Home Cubit instance to
    return BlocProvider(
      create: (context) => di<HomeCubit>(),
      child: MaterialApp(
        title: 'Palm Outsourcing Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const HomePage(),
      ),
    );
  }
}
