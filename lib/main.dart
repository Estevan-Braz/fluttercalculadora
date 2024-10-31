import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
        child: Calculadora(),
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _numero1 = '';
  String _operacao = '';
  String _numero2 = '';
  String _resultado = '';

  void clicou(String valor) {
    if (valor == 'CLEAR') {
      setState(() {
        _numero1 = '';
        _operacao = '';
        _numero2 = '';
        _resultado = '';
      });
    } else if (valor == '=') {
      if (_numero1 != '' && _operacao != '' && _numero2 != '') {
        double num1 = double.parse(_numero1);
        double num2 = double.parse(_numero2);
        double resultado = 0;
        if (_operacao == '+')
          resultado = num1 + num2;
        else if (_operacao == '-')
          resultado = num1 - num2;
        else if (_operacao == '/')
          resultado = num1 / num2;
        else if (_operacao == '*') resultado = num1 * num2;

        setState(() {
          _resultado = ' = $resultado';
        });
      }
    } else if ((valor == '+' || valor == '-' || valor == '/' || valor == '*') &&
        _numero1 != '') {
      setState(() {
        _operacao = valor;
      });
    } else if (_operacao == '') {
      setState(() {
        _numero1 += valor;
      });
    } else {
      setState(() {
        _numero2 += valor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Visor(valor: _numero1, comprimento: 90),
              Visor(valor: _operacao, comprimento: 30),
              Visor(valor: _numero2, comprimento: 90),
              Visor(valor: _resultado, comprimento: 90),
            ],
          ),
          Row(
            children: [
              Botao(valor: "0", funcao: clicou),
              Botao(valor: "1", funcao: clicou),
              Botao(valor: "2", funcao: clicou),
              Botao(valor: "3", funcao: clicou),
              Botao(valor: "4", funcao: clicou),
            ],
          ),
          Row(
            children: [
              Botao(valor: "5", funcao: clicou),
              Botao(valor: "6", funcao: clicou),
              Botao(valor: "7", funcao: clicou),
              Botao(valor: "8", funcao: clicou),
              Botao(valor: "9", funcao: clicou),
            ],
          ),
          Row(
            children: [
              Botao(valor: "+", funcao: clicou),
              Botao(valor: "-", funcao: clicou),
              Botao(valor: "/", funcao: clicou),
              Botao(valor: "*", funcao: clicou),
              Botao(valor: "=", funcao: clicou),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => clicou("CLEAR"), child: Text("CLEAR")),
            ],
          ),
        ],
      ),
    );
  }
}

class Botao extends StatelessWidget {
  final String valor;
  final Function funcao;
  const Botao({super.key, required this.valor, required this.funcao});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            fixedSize: const Size(50, 50),
          ),
          onPressed: () => funcao(valor),
          child: Text(valor),
        ));
  }
}

class Visor extends StatelessWidget {
  final String valor;
  final double comprimento;
  const Visor({super.key, required this.valor, required this.comprimento});
  Widget build(BuildContext context) {
    return Container(
      width: comprimento,
      height: 50,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: Text(valor),
    );
  }
}
