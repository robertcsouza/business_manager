import 'package:business_manager/Model/Usuario.dart';
import 'package:business_manager/Helper/RouteGeneration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}



class _CadastroState extends State<Cadastro> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _controllerNome = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerSenha = new TextEditingController();
  String _mensagem = "";


  void _cadastrarUsuario(){

    Usuario usuario = Usuario();
    usuario.nome = _controllerNome.text;
    usuario.email = _controllerEmail.text;
    usuario.senha = _controllerSenha.text;
    usuario.urlImagem = "";

    FirebaseAuth.instance.
    createUserWithEmailAndPassword
      (email: usuario.email.trim() , password: usuario.senha.trim() )
        .then((FirebaseUser){
      setState(() {

         _salvarDados(usuario.nome);
         _mensagem = "sucesso ao Cadastrar!!";
      });


    }).catchError((error) {
      setState(() {
        _mensagem = "Falha ao cadastrar " + error;
      });
    });

  }


  void _salvarDados(String nome) async{

    Firestore db = Firestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser user = await auth.currentUser();

    await db.
    collection("usuarios").
    document(user.uid).
    setData({"email":user.email,"nome":nome,"urlImagem":""});

    Navigator.pushNamed(context, RouteGenerator.ROUTE_HOME);


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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _controllerNome,
                    decoration:
                    InputDecoration(border: InputBorder.none,
                        icon: Icon(Icons.account_box),
                        hintText: 'Nome',hintStyle: TextStyle( fontSize: 14,color: Colors.grey)),
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
                elevation: 2,
                shape:  RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)
                ),
                color: Colors.blue,
                onPressed: (){
                  _cadastrarUsuario();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0,vertical: 10),
                  child: Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 14, color: Colors.white)
                  ),
                ),),
            ),
            Text(
              _mensagem
            )
          ],
        ),
      ),

    );
  }
}
