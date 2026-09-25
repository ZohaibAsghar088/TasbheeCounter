import 'package:flutter/material.dart';

void main() {
  runApp(const TasbihApp());
}

// Parent class
class Counter {
  int count = 0;

  void increment() {
    count++;
  }

  void reset() {
    count = 0;
  }
}

// Child class
class TasbihCounter extends Counter {
  String selectedTasbih = "SubhanAllah";

  void changeTasbih(String tasbih) {
    selectedTasbih = tasbih;
    reset();
  }
}

// Main App
class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasbih Counter',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const TasbihHomePage(),
    );
  }
}

// Stateful screen
class TasbihHomePage extends StatefulWidget {
  const TasbihHomePage({super.key});

  @override
  State<TasbihHomePage> createState() => _TasbihHomePageState();
}

class _TasbihHomePageState extends State<TasbihHomePage> {
  final TasbihCounter counter = TasbihCounter();

  void increaseCount() {
    setState(() {
      counter.increment();
    });
  }

  void resetCount() {
    setState(() {
      counter.reset();
    });
  }

  void selectTasbih(String value) {
    setState(() {
      counter.changeTasbih(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tasbih Counter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selected Tasbih",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            DropdownButton<String>(
              value: counter.selectedTasbih,
              items: const [
                DropdownMenuItem(
                  value: "SubhanAllah",
                  child: Text("SubhanAllah"),
                ),
                DropdownMenuItem(
                  value: "Alhamdulillah",
                  child: Text("Alhamdulillah"),
                ),
                DropdownMenuItem(
                  value: "Allahu Akbar",
                  child: Text("Allahu Akbar"),
                ),
                DropdownMenuItem(
                  value: "Astaghfirullah",
                  child: Text("Astaghfirullah"),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  selectTasbih(value);
                }
              },
            ),

            const SizedBox(height: 40),

            // Counter display
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: Colors.green),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      counter.selectedTasbih,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "${counter.count}",
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Count button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: increaseCount,
                child: const Text(
                  "COUNT",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Reset button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                onPressed: resetCount,
                child: const Text("RESET", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
