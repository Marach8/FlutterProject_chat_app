import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


class IndexCubit extends Cubit<int>{
  IndexCubit(): super(1);
  void newIndexState(int index) => emit(index);
}