import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTextStyle {
  static final TextStyle bodyLarge = GoogleFonts.poppins( 
    fontSize: 20, 
    fontWeight: FontWeight.bold, 
    color: Colors.white
  );
    static final  TextStyle bodyMedium = GoogleFonts.poppins( 
    fontSize: 14, 
    fontWeight: FontWeight.w500, 
    color: Colors.white
  );
  static final TextStyle bodySmall = GoogleFonts.poppins( 
    fontSize: 8, 
    fontWeight: FontWeight.w500, 
    color: Colors.black
  );
}
