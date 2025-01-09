import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent{}

class CounterDecrementPressed extends CounterEvent{}

class CounterResetPressed extends CounterEvent{}

//abstract class demek soyut yani örneklenemez nesne oluşturulamaz