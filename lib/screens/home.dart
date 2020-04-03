import 'package:flutter/material.dart';
import '../constant.dart';
import '../reusable.dart';
import '../model/list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int container = 1;
  bool isPressed1;
  bool isPressed2 = false;
  int index = 1;
  handelContainer1() {
    setState(() {
      if (isActive1 == false) {
        isActive1 = true;
        container = 1;
      } else {
        isActive1 = false;
      }
      if (container == 1) {
        isActive1 = true;
        isActive2 = false;
        isActive3 = false;
        isActive4 = false;
      }
    });
  }

  handelContainer2() {
    setState(() {
      if (isActive2 == false) {
        isActive2 = true;
        container = 2;
      } else {
        isActive2 = false;
      }
      if (container == 2) {
        isActive2 = true;
        isActive1 = false;
        isActive3 = false;
        isActive4 = false;
      }
    });
  }

  handelContainer3() {
    setState(() {
      if (isActive3 == false) {
        isActive3 = true;
        container = 3;
      } else {
        isActive3 = false;
      }
      if (container == 3) {
        isActive3 = true;
        isActive1 = false;
        isActive2 = false;
        isActive4 = false;
      }
    });
  }

  handelContainer4() {
    setState(() {
      if (isActive4 == false) {
        isActive4 = true;
        container = 4;
      } else {
        isActive4 = false;
      }
      if (container == 4) {
        isActive4 = true;
        isActive2 = false;
        isActive3 = false;
        isActive1 = false;
      }
    });
  }

  handelIsPressed1() {
    setState(() {
      if (isPressed1 == false) {
        isPressed1 = true;
        index = 1;
      } else {
        isPressed1 = false;
      }
      if (index == 1) {
        isPressed1 = true;
        isPressed2 = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isActive1 = true;
    isPressed1 = true;
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                      color: isPressed1 ? activeColor : Colors.black,
                    ),
                    onPressed: handelIsPressed1,
                    tooltip: 'Home',
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: isPressed1 ? activeColor : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichTextT(
          txt1: 'TRAVEL',
          txt2: 'ER',
          style: richText2,
        ),
        leading: Icon(
          Icons.reorder,
          color: Colors.black,
          size: 40,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Container(
              width: double.infinity,
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    child: ReusableContainerInHomePageScreen(
                      text: 'Popular',
                      color: (isActive1) ? activeColor : inActiveColor,
                      textColor: (isActive1) ? Colors.white : activeColor,
                    ),
                    onTap: handelContainer1,
                  ),
                  SizedBox(
                    width: (orientation == Orientation.portrait) ? 20.0 : 100,
                  ),
                  GestureDetector(
                    child: ReusableContainerInHomePageScreen(
                      text: 'Japan',
                      color: (isActive2) ? activeColor : inActiveColor,
                      textColor: (isActive2) ? Colors.white : activeColor,
                    ),
                    onTap: handelContainer2,
                  ),
                  SizedBox(
                    width: (orientation == Orientation.portrait) ? 20.0 : 100,
                  ),
                  GestureDetector(
                    child: ReusableContainerInHomePageScreen(
                      text: 'Greece',
                      textColor: (isActive3) ? Colors.white : activeColor,
                      color: (isActive3) ? activeColor : inActiveColor,
                    ),
                    onTap: handelContainer3,
                  ),
                  SizedBox(
                    width: (orientation == Orientation.portrait) ? 20.0 : 100,
                  ),
                  GestureDetector(
                    child: ReusableContainerInHomePageScreen(
                      text: 'Indonesia',
                      color: (isActive4) ? activeColor : inActiveColor,
                      textColor: (isActive4) ? Colors.white : activeColor,
                    ),
                    onTap: handelContainer4,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 60, left: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFFF7F9),
                      hintText: 'Search..',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide:
                            BorderSide(color: Color(0xFFFFF7F9), width: 1),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: (orientation == Orientation.portrait) ? 290.0 : 690,
                  child: Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: activeColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: (orientation == Orientation.portrait) ? 10 : 30),
            child: Text(
              'Discover',
              style: discoverStyle,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Container(
              width: double.infinity,
              height: (container == 1) ? 430 : 300,
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio:
                    (orientation == Orientation.portrait) ? 3 / 4 : 16 / 9,
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 2,
                children: (container == 1)
                    ? list
                    : <Widget>[
                        (container == 2)
                            ? ReusableGridContainer(
                                cityName: 'Tokuo',
                                imgUrl: 'img/jap.jpg',
                                countryName: 'Japan',
                              )
                            : (container == 3)
                                ? ReusableGridContainer(
                                    cityName: 'Oia',
                                    imgUrl: 'img/greece.jpg',
                                    countryName: 'Greece',
                                  )
                                : (container == 4)
                                    ? ReusableGridContainer(
                                        cityName: 'Bali',
                                        imgUrl: 'img/ind.jpg',
                                        countryName: 'Indonesia',
                                      )
                                    : Center(),
                      ],
              ),
            ),
          ),
          Center(
            child: RichTextT(
              txt1: 'Powered By ',
              txt2: 'Omar Bakry',
              style: omarBakry,
            ),
          ),
        ],
      ),
    );
  }
}
