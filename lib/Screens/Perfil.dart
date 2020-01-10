import 'package:business_manager/Screens/DrawerMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  bool isSwitched = true;
  _showAlertDialog(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {  Navigator.pop(context); },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Digite Nome", style: TextStyle(
        fontSize: 13
      ),),
      content: TextField(

      ),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Perfil"),
       elevation: 0,

     ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                color: Colors.blue
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:40.0),
                    child: Center(
                      child: CircleAvatar(
                        minRadius: 40,
                        maxRadius: 40,
                        backgroundImage: NetworkImage("https://www.oneworldplayproject.com/wp-content/uploads/2016/03/avatar-1024x1024.jpg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                    child: FlatButton(
                      child: Text("Nome do funcionario", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white
                      ),),
                      onPressed: (){
                        _showAlertDialog(context);
                      },
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text("Cargo", style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                      ),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,32,16,32),
                        child: Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            border:  Border.all(color: Colors.white,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(

                              children: <Widget>[
                                Icon(Icons.call,color: Colors.white, size: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:8.0),
                                  child: Text(
                                    "32",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                                Text(
                                  "Chamados atendidos",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                            border:  Border.all(color: Colors.white,width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: Column(

                          children: <Widget>[
                            Icon(Icons.trending_up,color: Colors.white, size: 30,),
                            Padding(
                              padding: const EdgeInsets.only(bottom:8.0),
                              child: Text(
                                "66%",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                              ),
                              ),
                            ),
                            Text(
                              "Aproveitamento",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                      fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                              border:  Border.all(color: Colors.white,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Column(

                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.thumbs_up_down,color: Colors.white, size: 30,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:8.0),
                                child: Text(
                                  "98%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              Text(
                                "Satisfação",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

             Center(
               child: Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.only(top: 30),
                 child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         Text("Disponivel",style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 14,
                             color: Colors.grey
                         ),),
                         Switch(
                           value: isSwitched,
                           onChanged: (value) {
                             setState(() {
                               isSwitched = value;
                             });
                           },
                           activeTrackColor: Colors.lightBlue,
                           activeColor: Colors.blue,
                         ),
                       ],
                     ),

               ),
             ),
          ],
        ),
      ),
    );
  }
}
