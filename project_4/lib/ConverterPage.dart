import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final TextEditingController _amountController = TextEditingController();
  final double rate = 120.0;
  double _converterResult = 0.0;
  
  @override
  void dispose(){
    _amountController.dispose();
    super.dispose();
  }

  void _convertCurrency() {
    setState(() {
      final text = _amountController.text.trim();
      if (text.isEmpty) {
        _converterResult = 0.0;
        return;
      }
      double amount = double.tryParse(text) ?? 0.0;
      _converterResult = amount * rate;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Converter", 
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(50),
          child: Container(
            height: 500,
            width: 500,
            decoration:BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('USD'), 
                    Icon(Icons.swap_horiz), 
                    Text('BDT')
                  ],
                ),

                TextField(
                  textAlign: TextAlign.center,
                  controller: _amountController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: Text('Enter Amount'),
                    hintText: "amount",
                    prefixIcon: Icon(Icons.attach_money),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                  ),
                ),                


                ElevatedButton(onPressed: _convertCurrency, child: Text('Convert')),
                const SizedBox(height: 20),
                Text(
                  'Result: {$_converterResult} BDT',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}