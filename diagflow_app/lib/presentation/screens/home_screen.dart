import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/logo.png',
              width: 150, 
              height: 150,
            ),
            SizedBox(
                height: 20), 
            Text(
              'Bienvenido al chat bot de Wissen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:
                    Colors.deepPurple, 
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
                height: 20), 
            ElevatedButton(
              onPressed: () {
                context.go('/chat');
              },
              child: Text('Vamos!'),
            ),
          ],
        ),
      ),
    );
  }
}
