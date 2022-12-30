import 'package:course/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class LessonCard extends StatelessWidget {
  final String createdAt;
  final String category;
  final String name;
  final int duration;
  final bool locked;

  const LessonCard({
    Key? key,
    required this.createdAt,
    required this.category,
    required this.name,
    required this.duration,
    required this.locked,
  }) : super(key: key);

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getDate(createdAt.substring(0, 10)),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        if(locked) const Icon(Icons.lock),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
String getDate(String dateTime) {
  DateTime date = DateTime.parse(dateTime);
  var formatter = DateFormat("d MMM, yyyy");
  String formattedDate = formatter.format(date);
  return formattedDate;
}
