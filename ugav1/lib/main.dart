import 'package:flutter/material.dart';
import './login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UGA',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final imagePath = orientation == Orientation.portrait
        ? 'assets/images/background_portrait.png'
        : 'assets/images/background_landscape.png';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            orientation == Orientation.portrait
                ? Positioned(
                    top: 200,
                    left: 125,
                    child: SizedBox(
                      height: 125,
                      child: Image.asset('assets/images/uga_logo.png'),
                    ),
                  )
                : Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 125,
                      child: Image.asset('assets/images/uga_logo.png'),
                    ),
                  ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(36, 43, 56, 1)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Continuer', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
