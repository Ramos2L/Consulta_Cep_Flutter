import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_cep_cubit/pages/cubit/searchcep_cubit.dart';
import 'package:search_cep_cubit/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BlocProvider<SearchcepCubit>(
        create: (context) => SearchcepCubit(), 
        child: Home()
      )
    );
  }
}