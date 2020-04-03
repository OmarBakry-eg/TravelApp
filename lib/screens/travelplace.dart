import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/reusable.dart';
import '../constant.dart';
import '../model/user.dart';

class PlaceYouWantToTravel extends StatefulWidget {
  final String imgUrl;
  final String cityName;
  final String countryName;
  PlaceYouWantToTravel({this.countryName, this.imgUrl, this.cityName});
  @override
  _PlaceYouWantToTravelState createState() => _PlaceYouWantToTravelState();
}

class _PlaceYouWantToTravelState extends State<PlaceYouWantToTravel> {
  int cost = Random().nextInt(650) + 450;
  int rate = Random().nextInt(10) + 1;
  int day = Random().nextInt(10) + 1;
  int hours = Random().nextInt(20) + 1;
  int distance = Random().nextInt(5000) + 200;
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage(widget.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 30,
                    top: (orientation == Orientation.portrait) ? 30 : 100),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          decoration: containerDecorationInTravelScreen,
                          child: SizedBox.expand(
                            child: ListView(
                              controller: scrollController,
                              children: <Widget>[
                                Container(
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    fit: StackFit.loose,
                                    children: <Widget>[
                                      Positioned(
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration:
                                              containerDecorationInTravelScreen
                                                  .copyWith(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                            child: Consumer<User>(
                                              builder: (context, user, child) =>
                                                  IconButton(
                                                icon: Icon(
                                                  user.isFav
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  size: 35,
                                                  color: Colors.red,
                                                ),
                                                onPressed: user.handelFav,
                                              ),
                                            ),
                                          ),
                                        ),
                                        left: (orientation ==
                                                Orientation.portrait)
                                            ? 320
                                            : 700,
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Icon(
                                          Icons.keyboard_arrow_up,
                                          color: Colors.black54,
                                          size: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  width: 70,
                                  height: 70,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                          (orientation == Orientation.portrait)
                                              ? 0
                                              : 30),
                                  child: Text(
                                    '  ${widget.cityName}, ${widget.countryName}',
                                    style: discoverStyle.copyWith(
                                        fontSize: (orientation ==
                                                Orientation.portrait)
                                            ? 25.0
                                            : 35.0),
                                  ),
                                ),
                                SizedBox(
                                  height: (orientation == Orientation.portrait)
                                      ? 20.0
                                      : 40.0,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      ReusableContainerInTravelScreen(
                                        text: rate.toString(),
                                        iconData: Icons.star,
                                      ),
                                      ReusableContainerInTravelScreen(
                                        text: ' $hours Hours',
                                        iconData: Icons.access_time,
                                      ),
                                      ReusableContainerInTravelScreen(
                                        text: ' $distance km',
                                        iconData: Icons.location_on,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: (orientation ==
                                                    Orientation.portrait)
                                                ? 40
                                                : 200),
                                        child: Container(
                                          width: 140,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: inActiveColor,
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              ReusableGetDet(
                                                iconData: Icons.minimize,
                                                onTap: () {
                                                  setState(() {
                                                    rate--;
                                                  });
                                                },
                                              ),
                                              Text(
                                                rate.toString(),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              ReusableGetDet(
                                                iconData: Icons.add,
                                                onTap: () {
                                                  setState(() {
                                                    rate++;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.deepOrange,
                                      ),
                                      Text(' $day Days'),
                                      Spacer(
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  height: 20,
                                  child: TabBar(
                                    indicatorWeight: 2.0,
                                    indicatorColor: activeColor,
                                    tabs: [
                                      Tab(
                                        text: 'Description',
                                      ),
                                      Tab(
                                        text: 'Facility',
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: (MediaQuery.of(context).size.height) *
                                      0.5,
                                  child: TabBarView(
                                    children: [
                                      ReusableContainerColumnInTravelScreen(
                                        imgUrl: 'img/travel.png',
                                      ),
                                      ReusableContainerColumnInTravelScreen(
                                        imgUrl: 'img/travel2.png',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Align(
                alignment: (orientation == Orientation.portrait)
                    ? Alignment.bottomCenter
                    : Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  height: (orientation == Orientation.portrait) ? 100 : 80,
                  decoration: (orientation == Orientation.portrait)
                      ? containerDecorationInTravelScreen.copyWith(
                          color: Theme.of(context).primaryColor)
                      : containerDecorationInTravelScreen.copyWith(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(35),
                            bottomLeft: Radius.circular(35),
                          ),
                        ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: '\$ $cost\n', style: costStyle),
                              TextSpan(
                                text: 'Average Cost',
                                style: costStyle.copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              35,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Book a Tour',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
