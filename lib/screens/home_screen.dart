import 'package:course/api/api.dart';
import 'package:course/common/custom_button.dart';
import 'package:course/common/event_card.dart';
import 'package:course/common/lesson_card.dart';
import 'package:course/common/program_card.dart';
import 'package:course/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/lesson_model.dart';
import '../models/program_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProgramModel>? programs;
  List<LessonModel>? lessons;

  @override
  void initState() {
    // TODO: implement initState
    getPrograms();
    getLessons();
    super.initState();
  }

  void getPrograms() async {
    programs = await API().getPrograms();
    setState(() {});
  }

  void getLessons() async {
    lessons = await API().getLessons();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.short_text,
            color: Palette.appBarIconColor,
            size: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.question_answer_outlined,
              color: Palette.appBarIconColor,
              size: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.notifications,
              color: Palette.appBarIconColor,
              size: 25,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedIconTheme:
            const IconThemeData(color: Palette.bottomNavigatorUnselected),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Hub'),
          BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline_rounded), label: 'Chat'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 13,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              label: 'Profile'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Priya!',
                            style: GoogleFonts.lora(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff08090A),
                              height: 2,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'What do you wanna learn today?',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              height: 1,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff6D747A),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 150,
                          child: CustomButton(
                            text: 'Programs',
                            icon: Icons.collections_bookmark_rounded,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: CustomButton(
                            text: 'Get help',
                            icon: Icons.help,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 150,
                          child: CustomButton(
                            text: 'Learn',
                            icon: Icons.menu_book_outlined,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: CustomButton(
                            text: 'DD Tracker',
                            icon: Icons.art_track,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    if (programs != null && programs!.isNotEmpty)
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Programs for you',
                                    style: GoogleFonts.lora(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'View all',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Palette.textSecondaryColor,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_right_alt,
                                        color:
                                            Palette.bottomNavigatorUnselected,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 280,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: programs!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: ProgramCard(
                                        category: programs![index].category,
                                        name: programs![index].name,
                                        lesson: programs![index].lesson),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Events and Experiences',
                                  style: GoogleFonts.lora(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'View all',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Palette.textSecondaryColor,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_right_alt,
                                      color: Palette.bottomNavigatorUnselected,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 280,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                SizedBox(width: 8),
                                EventCard(
                                  type: 'lifestyle',
                                  title:
                                      'A complete guide for your new born baby',
                                ),
                                SizedBox(width: 16),
                                EventCard(
                                  type: 'lifestyle',
                                  title:
                                      'A complete guide for your new born baby',
                                ),
                                SizedBox(width: 16),
                                EventCard(
                                  type: 'lifestyle',
                                  title:
                                      'A complete guide for your new born baby',
                                ),
                                SizedBox(width: 16),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    if (lessons != null && lessons!.isNotEmpty)
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Lessons for you',
                                    style: GoogleFonts.lora(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'View all',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Palette.textSecondaryColor,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_right_alt,
                                        color:
                                            Palette.bottomNavigatorUnselected,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 280,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: lessons!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: LessonCard(
                                      createdAt: lessons![index].createdAt,
                                      category: lessons![index].category,
                                      name: lessons![index].name,
                                      duration: lessons![index].duration,
                                      locked: lessons![index].locked,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Container(
              height: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
