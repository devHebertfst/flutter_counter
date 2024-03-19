  import 'package:flutter/material.dart';

  void main() {
    runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));
  }

  class MyApp extends StatefulWidget {
    const MyApp({super.key});

    @override
    State<MyApp> createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {

    int _count = 0;
    String _msg = 'Entrada Permitida';

    void _changePeople(int delta) {
      setState(() {
        _count += delta;
        if (_count >= 20) {
          _msg = "Lotado, não pode entrar.";
          _count = 20;
        } else if (_count < 20 && _count >= 0) {
          _msg = "Entrada Permitida";
        } else {
          _count = 0;
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Counter App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
          centerTitle: true,
          backgroundColor: Colors.brown[500],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Text(
                  _msg,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$_count',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                      ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }
