import 'dart:async';

import 'package:bloc_state_management/bloc/network_event.dart';
import 'package:bloc_state_management/bloc/network_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc <InternetEvent, InternetState> {

  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription ;

  InternetBloc() : super(ConnectionInitialState())  {

    on <InternetLostEvent> ((event, emit) => emit (ConnectionLostState()));
    on <InternetGainedEvent> ((event, emit) => emit (ConnectionGainedState()));

    _connectivity.onConnectivityChanged.listen((result) {

      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet)
        {
          add(InternetGainedEvent());
        }
      else{
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close(){
    connectivitySubscription?.cancel();
    return super.close();
  }

}