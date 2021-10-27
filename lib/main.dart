import 'dart:io';
import 'dart:convert';
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

  List _toDoList = []; //lista de dados para o arquivo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar - barra superior do aplicativo
      appBar: AppBar(
        //tittle - titulo da appBar
        title: Text("Lista de Tarefas"),
        //backgroundColor - cor barra superior
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
    );
  }

  //ASYNC - são funções assincronas, ultilizadas quando não se retorna dados instantaneamente
  //AWAIT - utlilizado para se esperar receber aquele dado

  Future<File> _getFile() async{  // pega o arquivo do diretorio
    final directory = await getApplicationDocumentsDirectory(); //cria um diretorio
    return File("${directory.path}/data.jason"); //retorna o arquivo data.jason desse diretorio
  }

  Future<File> _saveData() async{
    String data = json.encode(_toDoList); // recebe os dados da lista em formato jason e adciona na variável data

    final file = await _getFile(); //pega o arquivo
    return file.writeAsString(data); // escreve os dados em forma de String dentro do arquivo
  }

  Future<String> _readData() async{
    try{
      final file = await _getFile(); //pega o arquivo

      return file.readAsString(); // Está lendo os dados como String
    }catch(e){
      return null;
    }
  }
}