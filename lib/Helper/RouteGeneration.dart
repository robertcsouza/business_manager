import 'package:business_manager/Screens/Cadastro.dart';
import 'package:business_manager/Screens/Home.dart';
import 'package:business_manager/Screens/Perfil.dart';
import 'package:business_manager/Screens/main.dart';
import 'package:flutter/material.dart';



class RouteGenerator{

  static  const ROUTE_LOGIN = "/login";
  static  const ROUTE_CADASTRO = "/cadastro";
  static  const ROUTE_HOME = "/home";
  static  const ROUTE_CONFIGURACOES = "/Configuracoes";
  static  const ROUTE_PERFIL = "/perfil";


  static Route <dynamic> GeneratorRoute(RouteSettings settings){

    final args = settings.arguments;


    switch(settings.name){

      case "/":
        return MaterialPageRoute(
            builder: (_) => Busisness()
        );

      case ROUTE_CADASTRO:
        return MaterialPageRoute(
            builder: (_) => Cadastro()
        );
      case ROUTE_HOME:
        return MaterialPageRoute(
            builder: (_) => Home()
        );
      case ROUTE_PERFIL:
        return MaterialPageRoute(
            builder: (_) =>Perfil()
        );
      default:
        _erroRota();
    }

  }



  static Route <dynamic> _erroRota(){

    return MaterialPageRoute(

        builder: (_){

          Scaffold(
            appBar: AppBar(title: Text("Tela nao encontrada !!!"),),
            body: Text("Tela nao encontrada"),

          );

        }

    );


  }


}