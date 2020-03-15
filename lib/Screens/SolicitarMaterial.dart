import 'package:business_manager/Model/CustomShapeClipper.dart';
import 'package:custom_horizontal_calendar/date_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_horizontal_calendar/custom_horizontal_calendar.dart';

class SolicitarMaterial extends StatefulWidget {
  @override
  _SolicitarMaterialState createState() => _SolicitarMaterialState();
}

class _SolicitarMaterialState extends State<SolicitarMaterial> {
  TextEditingController _controllerNome = TextEditingController();
  var chosen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitar Material"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: CustonShapeClipper(),
              child: Container(
                height: 300.0,
                color: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.image,
                    size: 120,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Icon(
                    Icons.image,
                    size: 120,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Icon(
                    Icons.image,
                    size: 120,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 150, right: 16),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      child: TextField(
                        controller: _controllerNome,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.person),
                            hintText: 'Tec. Responsavel',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16, right: 16),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      child: TextField(
                        controller: _controllerNome,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.location_on),
                            hintText: 'Local',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 18,
                    right: 16,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: CustomHorizontalCalendar(
                        onDateChoosen: (date) {
                          setState(() {
                            chosen = date;
                          });
                        },
                        inintialDate: DateTime.now(),
                        height: 70,
                        builder: (context, i, d, width) {
                          if (i != 2)
                            return DateRow(
                              d,
                              width: width,
                            );
                          else
                            return DateRow(
                              d,
                              background: Colors.blue,
                              selectedDayStyle: TextStyle(color: Colors.white),
                              selectedDayOfWeekStyle:
                                  TextStyle(color: Colors.white),
                              selectedMonthStyle:
                                  TextStyle(color: Colors.white),
                              width: width,
                            );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 16, right: 16, bottom: 16),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      child: TextField(
                        minLines: 5,
                        maxLines: 10,
                        controller: _controllerNome,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Descrição',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50, top: 16,left: 16,right: 16),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(

                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),

                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Enviar".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
