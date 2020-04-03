import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../reusable.dart';
import '../constant.dart';
import '../authhh/login.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('img/1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoignPage(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: (orientation == Orientation.portrait) ? 100 : 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: getStartedStyle,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (orientation == Orientation.portrait) ? 400.0 : 150,
            left: (orientation == Orientation.portrait) ? 10 : 60,
            child: Container(
              width: (orientation == Orientation.portrait) ? 400 : 800,
              height: 100,
              child: CarouselSlider(
                items: [
                  ReusableContainerInCarousel(),
                  ReusableContainerInCarousel(),
                  ReusableContainerInCarousel(),
                  ReusableContainerInCarousel(),
                  ReusableContainerInCarousel(),
                ],
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                autoPlayCurve: Curves.easeInBack,
                pauseAutoPlayOnTouch: Duration(seconds: 1),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
