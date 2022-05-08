import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF213A4D),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset('assets/images/search.png'),
          ),
        ],

      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
              child:
              Container(
                width: double.infinity,
                  child: Image.asset('assets/images/slider.png',
                      fit: BoxFit.cover),
              ),
          ),
          Expanded(
            flex: 3,
              child: Container(
                color: Color(0xFF213A4D),
              ),
          ),
          Expanded(
            flex: 3,
              child: Container(
                color: Color(0xFF213A4D),
              ),
          ),
        ],
      ),
    );
  }
}
