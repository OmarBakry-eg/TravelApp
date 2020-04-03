import 'package:flutter/material.dart';
import 'constant.dart';
import 'screens/travelplace.dart';
import 'model/user.dart';
import 'package:provider/provider.dart';

bool isActive1;
bool isActive2 = false;
bool isActive3 = false;
bool isActive4 = false;

class ReusableContainerInCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 140,
      child: Column(
        children: <Widget>[
          Text(
            'Here Title Text',
            style: carouselTitleStyle,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Here Some Subtitle Texr',
            style: carouselSubTitleStyle,
          ),
        ],
      ),
    );
  }
}

class ReusableContainerInHomePageScreen extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  ReusableContainerInHomePageScreen({this.text, this.color, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class ReusableGridContainer extends StatelessWidget {
  final String cityName;
  final String imgUrl;
  final String countryName;
  final IconData iconData;
  ReusableGridContainer(
      {this.cityName, this.imgUrl, this.countryName, this.iconData});
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceYouWantToTravel(
              countryName: countryName,
              cityName: cityName,
              imgUrl: imgUrl,
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image(
                image: AssetImage(imgUrl),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: (orientation == Orientation.portrait) ? 200.0 : 160.0,
              left: 10,
              child: Text(
                cityName,
                style: gridText,
              ),
            ),
            Positioned(
              top: (orientation == Orientation.portrait) ? 240.0 : 200.0,
              left: 20,
              child: Text(
                countryName,
                style: gridText.copyWith(
                    fontWeight: FontWeight.w200, fontSize: 18.0),
              ),
            ),
            Positioned(
              top: 10,
              left: (orientation == Orientation.portrait) ? 150 : 350,
              child: Consumer<User>(
                builder: (context, user, child) => IconButton(
                  icon: Icon(
                    user.isFav ? Icons.favorite : Icons.favorite_border,
                    size: 40.0,
                    color: Colors.red,
                  ),
                  onPressed: user.handelFav,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RichTextT extends StatelessWidget {
  final String txt1;
  final String txt2;
  final style;
  RichTextT({this.txt1, this.txt2, this.style});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: txt1,
            style: richText,
          ),
          TextSpan(
            text: txt2,
            style: style,
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.colour, @required this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableContainerInTravelScreen extends StatelessWidget {
  final IconData iconData;
  final String text;
  ReusableContainerInTravelScreen({this.iconData, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.deepOrange,
          ),
          Text(text),
        ],
      ),
    );
  }
}

class ReusableGetDet extends StatelessWidget {
  final IconData iconData;
  final Function onTap;
  ReusableGetDet({this.iconData, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: inActiveColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            iconData,
            color: activeColor,
            size: 20,
          ),
        ),
        width: 20,
        height: 20,
      ),
      onTap: onTap,
    );
  }
}

class ReusableContainerColumnInTravelScreen extends StatelessWidget {
  final String imgUrl;
  ReusableContainerColumnInTravelScreen({this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage(imgUrl),
                height: 200,
                width: 200,
              ),
              Text(
                'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                textAlign: TextAlign.center,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
