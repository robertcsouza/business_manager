
import 'package:business_manager/Screens/Cadastro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:business_manager/Helper/RouteGeneration.dart';


void main() => runApp(MaterialApp(
  home: Busisness(),
  initialRoute: "/",
  onGenerateRoute: RouteGenerator.GeneratorRoute,
));


class Busisness extends StatefulWidget {
  @override
  _BusisnessState createState() => _BusisnessState();
}




class _BusisnessState extends State<Busisness> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagem = "";

  Future _verificaUsuarioLogado() async{

    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser user = await auth.currentUser();

    if(user != null){

      Navigator.pushNamed(context, RouteGenerator.ROUTE_HOME);


    }
  }


  Future _login() async{

    FirebaseAuth autenticacao = FirebaseAuth.instance;
    FirebaseUser user = await  autenticacao.
    signInWithEmailAndPassword(email: _controllerEmail.text.trim(), password: _controllerSenha.text.trim());
    //chama a proxima tela
    if( user.uid != null){

      Navigator.pushNamed(context, RouteGenerator.ROUTE_HOME);


    }else{
      setState(() {
        _mensagem ="problema ao efetuar login";
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verificaUsuarioLogado();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/2.5,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color:Colors.blue ,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(110),
                      ),
                    ),
                  ),

                  Container(

                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/7),
                    child: Container(
                      width: 100,
                        height: 100,
                        child: Image.asset("images/logo.png"),
                    ),
                  ),
                ],

              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:16.0),
                child: Text(
                    "Seu jeito de gerenciar !",style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0,top: 16, right: 32),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
                    child: TextField(
                      controller: _controllerEmail,
                      decoration:
                      InputDecoration(border: InputBorder.none,
                          icon: Icon(Icons.person),
                          hintText: 'E-mail',hintStyle: TextStyle( fontSize: 14,color: Colors.grey)),
                    ),
                  ),
                ),

              ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0,top: 16, right: 32),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _controllerSenha,
                    obscureText: true,
                    decoration:
                    InputDecoration(border: InputBorder.none,
                        icon: Icon(Icons.lock),
                        hintText: 'Senha',hintStyle: TextStyle( fontSize: 14,color: Colors.grey)),
                  ),
                ),
              ),

            ),
                Padding(
                  padding: const EdgeInsets.only(top:32.0,left: 16,right:16),
                  child: RaisedButton(
                    elevation: 8,
                    shape:  RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)
                    ),
                  color: Colors.blue,
                  onPressed: (){
                      _login();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0,vertical: 10),
                    child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 14, color: Colors.white)
                    ),
                  ),),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RouteGenerator.ROUTE_CADASTRO);
                  },
                  child: Text("Nao tem uma conta? Cadastre-se",style: TextStyle(
                    color: Colors.grey
                  ),),
                ),
                Text(
                  _mensagem
                ),
              ],
            ),
      ),

    );
  }
}

