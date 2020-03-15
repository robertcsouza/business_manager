import 'package:business_manager/Helper/RouteGeneration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:30.0,bottom: 10),
                    child: CircleAvatar(
                      minRadius: 40,
                      maxRadius: 40,
                      backgroundImage: NetworkImage("https://www.oneworldplayproject.com/wp-content/uploads/2016/03/avatar-1024x1024.jpg"),
                    ),
                  ),
                  Text("Nome do funcionario",style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("Cargo",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14
                    ),),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, RouteGenerator.ROUTE_PERFIL);
                },
                leading: Icon(Icons.person),
                title: Text("Perfil",style:  TextStyle(
                    fontSize: 13,
                    color: Colors.black54
                ),),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RouteGenerator.ROUTE_MATERIAL);
              },
              leading: Icon(Icons.check_circle),
              title: Text("Solicitar Material",
                style: TextStyle(
                fontSize: 13,
                color: Colors.black54
              ),),

            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.block),
              title: Text("Chamados Em aberto",style:  TextStyle(
                  fontSize: 13,
                  color: Colors.black54
              ),),

            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.settings),
              title: Text("Configurações",style:  TextStyle(
                  fontSize: 13,
                  color: Colors.black54
              ),),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.arrow_back),
              title: Text("Sair", style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54
              )),
            ),
          ],
        ),
      )
    );
  }
}
