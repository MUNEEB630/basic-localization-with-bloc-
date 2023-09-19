import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  Locale?  _appLocale;
  Locale? get appLocale => _appLocale;


  void changeLang(Locale type)async{
    final sp = await SharedPreferences.getInstance();
    _appLocale=type;
    if(type==const Locale('en')){
      await sp.setString("language", 'en');
    }else{
      await sp.setString("language", 'es');
    }
    emit(AppLangUpdate());
  }

}
