import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var carouselTitleStyle = GoogleFonts.questrial(
  fontWeight: FontWeight.w600,
  color: Colors.white,
  fontSize: 40.0,
  shadows: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 4.0,
    )
  ],
);

var carouselSubTitleStyle = GoogleFonts.satisfy(
  fontWeight: FontWeight.w300,
  shadows: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 2.0,
    )
  ],
  color: Colors.white,
  fontSize: 24.0,
);

var getStartedStyle = GoogleFonts.raleway(
  fontSize: 25.0,
  letterSpacing: 2.0,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

var inActiveColor = Color(0xFFFFEFF3);
var activeColor = Color(0xFFFF688A);

var gridText = GoogleFonts.pTSans(
  color: Colors.white,
  fontSize: 30,
  shadows: [
    BoxShadow(color: Colors.black, blurRadius: 4.0),
  ],
);

var richText = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: 25.0,
);
var richText2 = GoogleFonts.roboto(
  color: activeColor,
  fontSize: 25.0,
);

var omarBakry = GoogleFonts.pacifico(
  color: activeColor,
  fontSize: 20.0,
);

var discoverStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 40.0,
);

var textFiledStyle = InputDecoration(
  hintText: 'Enter your E-mail',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFF7D59), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFFF7D59), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);

var containerDecorationInTravelScreen = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(35),
    topRight: Radius.circular(35),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 2,
    ),
  ],
);

var costStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 30,
);
