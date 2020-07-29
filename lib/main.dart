import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 34.0 : 12.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue :Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
          //skip
          Container(
            height: 600.0,
            child: PageView(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage(
                            'images/corona2.jpg',
                          ),
                          height: 350.0,
                          width: 350.0,
                        ),
                      ),
                      Center(
                        child: Text(
                          'High Temperature is a risk',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'CM Sans Serif',
                            fontSize: 26.0,
                            height: 1.3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage(
                            'images/corona4.jpg',
                          ),
                          height: 350.0,
                          width: 350.0,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Wear mask to protect\n you and your family',
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            color: Colors.black,
                            fontFamily: 'CM Sans Serif',
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 23),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage(
                            'images/corona5.jpg',
                          ),
                          height: 350.0,
                          width: 350.0,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Maintain social distancing\nwhile going out',
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            color: Colors.black,
                            fontFamily: 'CM Sans Serif',
                            fontSize: 26.0,
                            height: 1.3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Color.fromRGBO(90, 135, 255, 1),
                  ]
                ),
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8,left: 25,right: 25),
                child: Text(
                  'Know More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          _currentPage != _numPages - 1
              ? Expanded(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: FlatButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child:  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Skip Tour',
                        style: TextStyle(
                          color:   Color.fromRGBO(90, 135, 255, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Next',
                        style: TextStyle(
                          color:   Color.fromRGBO(90, 135, 255, 1),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
              : Text(''),
        ],
      ),
    );
  }
}

