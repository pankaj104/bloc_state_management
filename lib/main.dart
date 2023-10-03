
import 'package:bloc_state_management/bloc/network_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc State Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  HomeScreen(),
        ),
      );
  }
}

