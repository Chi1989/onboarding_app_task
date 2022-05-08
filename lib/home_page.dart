import 'package:flutter/material.dart';
import 'package:onboarding_app_task/next_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = [1, 3.3, 3];
  final textColor = Color(0xFFFB6580);
  final pageController = PageController();
  var currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2D2C3C),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NextPage()),
              );
            },
              child: Text('skip',
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                flex: 5,
                child: PageView.builder(
                  controller: pageController,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index){
                  return Column(
                    children: [
                      Expanded(
                          child: Image.asset('assets/images/radio.png',
                            fit: BoxFit.cover,),
                      ),
                      Text('Tune Your Radio',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna $index',
                          style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  );
                },
                itemCount: 4,
                onPageChanged: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                )
            ),
            Expanded(
                flex: 1,
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: (){
                        pageController.animateToPage(
                            currentIndex - 1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeIn
                        );
                      },
                        child: Text('Previous', style: TextStyle(color: textColor),
                        ),
                      ),
                      _buildIndicator(),
                      TextButton(onPressed: () {
                        pageController.animateToPage(
                        currentIndex + 1,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn
                      );
                      },
                        child: Text('Next', style: TextStyle(color: textColor),

                      ),
                      ),
                    ],
                  ),
                )
            )
          ],
        )
    );
  }

 Widget _buildIndicator(){
 final list = <Widget>[];
 for(int i=0; i<4;i++) {
   list.add(Container(
     margin: EdgeInsets.symmetric(horizontal: 4),
     width:i == currentIndex ? 13 : 10,
     height:i == currentIndex ? 13 : 10,
     decoration: BoxDecoration(
       shape: BoxShape.circle,
       color:i==currentIndex? textColor : Colors.black45,
     ),
   ),
   );
 }
return Row(
  children: list,
);
}

}

