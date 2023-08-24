import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  String resultadoTela = "";

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(bottomRight: Radius.elliptical(100, 50))),
        title: const Text("IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30, top: 30),
                width: 120,
                height: 120,
                child: const Image(
                  image: AssetImage("images/imc_image.png"),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Peso kg",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      labelText: "Altura m",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    double peso = double.parse(pesoController.text);
                    double altura = double.parse(alturaController.text);
                    double resultado = peso / (altura * altura);

                    setState(() {
                      if (resultado < 18.5) {
                        resultadoTela =
                            "${resultado.toStringAsPrecision(3)}, Abaixo do peso!";
                      } else if (resultado <= 24.9) {
                        resultadoTela =
                            "${resultado.toStringAsPrecision(3)}, Peso Ideal!";
                      } else if (resultado <= 29.9) {
                        resultadoTela =
                            "${resultado.toStringAsPrecision(3)}, Levemente Acima\n do Peso!";
                      } else if (resultado <= 34.9) {
                        resultadoTela =
                            "${resultado.toStringAsPrecision(3)}, Obesidade 1!";
                      } else if (resultado <= 39.9) {
                        resultadoTela =
                            "${resultado.toStringAsPrecision(3)}, Obesidade 2 (Severa)!";
                      } else {
                        resultadoTela =
                            "${resultado.toStringAsPrecision(3)}, Obesidade 3 (Mórbida)!";
                      }
                    });
                  },
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  resultadoTela,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
