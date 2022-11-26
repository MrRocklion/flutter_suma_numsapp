import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // declaramos nuestras variables
  int num1 = 0;
  int num2 = 0;
  String resultado = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 170,
              child: Column(
                children: [
                  Text("Resultado:",style: TextStyle(fontSize: 20),),
                  Text(this.resultado,style: TextStyle(fontSize: 90),),

                ],
              ),
            ),
            Container(
              height: 300,
              padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Ingresa Un numero"),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'number 1'
                    ),
                    onChanged: (text){
                      try {
                        setState(() {
                          this.num1 = int.parse(text);
                        });
                      } catch(e) {
                        alertError(context,e);

                      }
                    },
                  ),
                  Text("Ingresa Otro numero"),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'number 2'
                    ),
                    onChanged: (text){
                      try {
                        setState(() {
                          this.num2 = int.parse(text);
                        });
                      } catch(e) {
                        alertError(context,e);

                      }
                    },

                  ),
                  OutlinedButton(onPressed: calcularNums,style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(60),),child: const Text('Calcular')),
                ],

              ),
            ),

          ],
        ),
      ),
    );
  }
  void calcularNums () {
    try{
      int res = this.num1 + this.num2;
      setState(() {
        this.resultado = res.toString();
      });
    }catch(e){
    print(e);
    }
  }
  void alertError(BuildContext context,error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content:  Text("Error Escribiste Un caracter: $error"),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

