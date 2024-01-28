import 'package:flutter/material.dart';

@immutable 
abstract class AppState{
  const AppState();
}

@immutable 
class AppStateLoggedIn extends AppState{
  final int pageIndex;

  const AppStateLoggedIn({
    required this.pageIndex
  });

  @override 
  bool operator ==(covariant AppStateLoggedIn other)
    => identical(this, other) &&
    pageIndex == other.pageIndex;
    
  @override 
  int get hashCode => Object.hashAll([pageIndex]);
}