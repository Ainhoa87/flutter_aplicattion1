import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Este es un contador de hidratación diaria que permite a los usuarios llevar un registro de la cantidad de vasos de agua que han consumido a lo largo del día.
//La aplicación presenta una interfaz visualmente atractiva con un diseño moderno y colores suaves, lo que hace que la experiencia del usuario sea agradable y motivadora.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Hidratación Diaria',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador de Hidratación Diaria'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color(0xFFEAF7FF),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E9F),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 170,
                                    height: 220,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(28),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blue.withAlpha(
                                            (255 * 0.12).round(),
                                          ),
                                          blurRadius: 18,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 22,
                                    child: Container(
                                      width: 130,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF5DADEC),
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 250,
                                            ),
                                            width: 124,
                                            height:
                                                0.0 +
                                                (_counter * 12.0).clamp(
                                                  0.0,
                                                  144.0,
                                                ),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF5AC8FA),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    child: Container(
                                      width: 90,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withAlpha(
                                          (255 * 0.8).round(),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 28),
                              Text(
                                'Vasos de agua',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$_counter',
                                style: const TextStyle(
                                  fontSize: 54,
                                  color: Color(0xFF1B5E9F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 24,
                  bottom: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      'https://cataas.com/cat?width=300&height=300',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Restar vaso',
                backgroundColor: const Color(0xFF5DADEC),
                child: const Icon(Icons.remove, size: 28),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Añadir vaso',
                backgroundColor: const Color(0xFF1B5E9F),
                child: const Icon(Icons.add, size: 32),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
