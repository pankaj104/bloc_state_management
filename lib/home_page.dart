import 'package:bloc_state_management/bloc/network_bloc.dart';
import 'package:bloc_state_management/bloc/network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state){
            if (state is ConnectionGainedState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Connected! "),
              backgroundColor: Colors.green,
              ));
            }

            else if (state is ConnectionLostState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Got Lost! "),
              backgroundColor:  Colors.red,
              ));
            };
          },
          builder: (context, state) {
            if (state is ConnectionLostState) return Center(child: Text("No Internet Connection", style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold
            ),));
           else if (state is ConnectionGainedState)
              return Center(child: Text("You're Connected to Internet", style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.bold),));
            else
              return Center(child: Text("Loading... "));
          },
        ),
      ),
    );
  }
}