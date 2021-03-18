import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart'; //para a ler e gravar dados de arquivos JSON para o app
void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget { //Stateful para apps que mudam o seu estado durante a execução
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
