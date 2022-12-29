import 'package:course/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomButton({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Icon(
            icon,
            color: Palette.buttonTextColor,
          ),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Palette.buttonTextColor),
          ),
        ),
        label: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Palette.buttonTextColor,
          ),
        ),
      ),
    );
  }
}
