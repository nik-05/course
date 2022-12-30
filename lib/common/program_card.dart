import 'package:course/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramCard extends StatelessWidget {
  final String category;
  final String name;
  final int lesson;

  const ProgramCard(
      {Key? key,
      required this.category,
      required this.name,
      required this.lesson})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 242,
        height: 280,
        decoration: BoxDecoration(
          color: Palette.secondaryBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
                width: 242,
                height: 140,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                        category.toUpperCase(),
                        style: GoogleFonts.inter(
                          color: Palette.buttonTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '$lesson lessons',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
