

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class EventBloc extends Bloc<CalcEvents, int> {
  EventBloc() : super(0) {
    on<CalcEvents>((event, emit) {
      if (event is AddEvent) {
        emit(event.a + event.b);
      } else if (event is SubEvent) {
        emit(event.a - event.b);
      } else if (event is mulEvent) {
        emit((event.a / event.b) as int);
      } else if (event is divEvent) {
        emit(event.a * event.b);
      }
    });
  }
}