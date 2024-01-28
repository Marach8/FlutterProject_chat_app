import 'package:bloc/bloc.dart';
import 'package:chat_app/bloc/app_events.dart';
import 'package:chat_app/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState>{
  AppBloc():super(
    const AppStateLoggedIn(pageIndex: 0)
  ){
    on<PageViewsAppEvent>((event, emit){
      emit(
        AppStateLoggedIn(pageIndex: event.pageIndex)
      );
    });
  }
}