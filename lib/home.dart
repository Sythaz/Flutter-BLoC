import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random APP"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Container(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Joni Sumanto",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("jonisumanto@gmail.com"),
            SizedBox(height: 10),
            Text("============== MAKANAN =============="),
            SizedBox(height: 10),
            Text("Mie Ayam"),
            SizedBox(height: 5),
            Text("5 Porsi"),
            SizedBox(height: 5),
            Text("Tingkat Kesulitan: Rumit"),
          ],
        ),
      ),
    );
  }
}
