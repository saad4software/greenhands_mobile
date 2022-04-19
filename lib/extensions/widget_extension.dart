import 'package:flutter/material.dart';

extension WidgetExtension on Widget{

  Future gotoScreen<T extends Widget>({required BuildContext context,required T screen, Function(T)? prepare}){

    final route = MaterialPageRoute(
      builder: (context)=> screen,
      settings: RouteSettings(name: (T).toString())
    );
    print(route.settings.name);
    prepare?.call(screen);
    return Navigator.push(context, route);
  }

  Future gotoSection<T extends Widget>({required BuildContext context,required T screen, Function(T)? prepare}){

    final route = MaterialPageRoute(
      builder: (context)=> screen,
      settings: RouteSettings(name: (T).toString())
    );
    print(route.settings.name);
    prepare?.call(screen);
    return Navigator.pushReplacement(context, route);
  }

  void goBack({required BuildContext context, String? screen}){
    if (screen != null){
      Navigator.of(context).popUntil((route){
        return route.settings.name == screen;
      });
    }
    else{
      Navigator.of(context).pop();
    }
  }

  void toast(BuildContext context, String txt){
    final snackBar = SnackBar(
      content: Text(txt),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

