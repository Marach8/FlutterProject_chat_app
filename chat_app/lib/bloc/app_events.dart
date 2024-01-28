import 'package:flutter/material.dart';

@immutable 
abstract class AppEvent{
  const AppEvent();
}

@immutable 
class PageViewsAppEvent extends AppEvent{
  final int pageIndex;
  
  const PageViewsAppEvent({
    required this.pageIndex
  });
}