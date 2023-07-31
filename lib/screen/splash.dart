import 'package:flutter/material.dart';
import 'package:foodapi/screen/home_page.dart';

class SplashScrene extends StatefulWidget {
  const SplashScrene({Key? key}) : super(key: key);

  @override
  State<SplashScrene> createState() => _SplashScreneState();
}

class _SplashScreneState extends State<SplashScrene> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 150,
            width: 120,
            child: Image(
              image: AssetImage('images/splash.png'),
            ),
          ),
        ],
      ),
    );
  }
}
