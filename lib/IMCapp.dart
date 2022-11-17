import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imc_sp/LeftMenu.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class IMCapp extends StatefulWidget {
  const IMCapp({super.key, required this.title});
 
 
 
  final String title;
  @override
  State<IMCapp> createState() => _IMCappState();
}
 
class _IMCappState extends State<IMCapp> {

 
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoImc = '';
  double _imc = 0.0;
  String infoText = '';
  Color textColor = Colors.white;
 
 
 
  void _resetarDados(){
    setState(() {
      controllerAltura.text = '';
      controllerPeso.text = '';
      resultadoImc = '';
      infoText = '';
      _imc = 0.0;
    });
   
  }
 
  void _calcularImc(){
    setState(() {
      _imc = (num.parse(controllerPeso.text) / ( num.parse(controllerAltura.text) * num.parse(controllerAltura.text)));
     
      resultadoImc = _imc.toStringAsFixed(2);
 
      if(_imc < 18.5){
        infoText = 'Sua situação: \n   Magreza';
        textColor = Colors.purple;
 
 
      }else if(_imc >= 18.5 && _imc <25.9){
        infoText = 'Sua situação:\n   Saudável';
        textColor = Colors.green;
 
      }else if(_imc >= 25.9 && _imc < 29.9){
        infoText = 'Sua situação:\n  Sobrepeso';
        textColor = Colors.orange;
 
      }else if(_imc >= 29.9){
        infoText = 'Sua situação:\n  Obesidade';
        textColor = Colors.pink;}
    });
  }
 

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: _resetarDados,
            icon: const Icon(Icons.refresh),
            )
        ],
      ),
      drawer: const LeftMenu(),
      body: Center(
        child: SingleChildScrollView( 
          padding: const EdgeInsets.all(16.0),
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

            const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: controllerPeso,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  hintText: 'Digite o seu peso',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)) 
                  )
                ),
              ),
            const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(), 
                controller: controllerAltura,
                decoration: const InputDecoration(
                  labelText: 'Altura ',
                  hintText: 'Digite a sua altura',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)) 
                  )
                ),
              ),
 
            //const SizedBox(height: 15,),
          //  Text(resultadoImc, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
 
            const SizedBox(height: 12,),
              Container(
                width: 100,
                child: ElevatedButton(
                  onPressed: (){
                    _calcularImc();
                    
                  },
                  child: const Text('Calcular')),
              ),
              Column(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.all(16.0),
                  child: Text(infoText, style: TextStyle(
                    color: textColor,
                    fontSize: 26,
                     ),
                   ),
                  ),
                ],
              ),
 
 
             
 
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.all(1.0),
                   // child: Scaffold(
                     // body: Center(
                        child: SfRadialGauge(
                        enableLoadingAnimation: true, //
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 45,
                            pointers: <GaugePointer>[
                            MarkerPointer(value: _imc, enableAnimation: true, markerType: MarkerType.triangle, markerHeight: 50, markerWidth: 30, markerOffset: 40, color: Colors.white,)
                          ], ranges: <GaugeRange>[
                            GaugeRange(startValue: 0, endValue: 18.5, color: Colors.purple, startWidth: 50, endWidth: 50),
                            GaugeRange(startValue: 18.5, endValue: 25.9, color: Colors.green, startWidth: 50, endWidth: 50),
                            GaugeRange(startValue: 25.9, endValue: 29.9, color: Colors.orange, startWidth: 50, endWidth: 50),
                            GaugeRange(startValue: 29.9, endValue: 45, color: Colors.pink, startWidth: 50, endWidth: 50),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              axisValue: _imc,
                              positionFactor: 0.10,
                              widget: Text(
                                _imc.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),
                              ),
                            )
                           ],
                          )
                        ],
                      ),
                   ),
                ],
              ),
 
            ],
          ),
        ),
      ),
      
    );
  }
}