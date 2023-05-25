// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class bitcoin extends StatefulWidget {
  const bitcoin({Key? key}) : super(key: key);

  @override
  _bitcoinState createState() => _bitcoinState();
}

String _preco = "0";

class _bitcoinState extends State<bitcoin> {
  void _recuperarPreco() async{
  
  var url = Uri.parse("https://blockchain.info/ticker");

  http.Response response = await http.get(url);
  Map<String, dynamic> retorno = json.decode(response.body);
  setState((){
    _preco = retorno["BRL"]['buy'].toString();
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("imagens/bitcoin.png"),
              SizedBox(
                height: 10,
              ),
              Text(
                "R\$  $_preco",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {_recuperarPreco();},
                  style: ButtonStyle( 
                      backgroundColor: MaterialStatePropertyAll(Colors.white,)),
                  child: const Text(
                    "Atualizar",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
