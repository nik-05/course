import 'dart:convert';

import 'package:course/common/constants.dart';
import 'package:course/models/program_model.dart';
import 'package:http/http.dart';

import '../models/lesson_model.dart';

class API {
  Future<List<ProgramModel>> getPrograms() async  {
    List<ProgramModel> programs = [];

    Response response;
    response = await get(Uri.parse(Constants.programsAPI));

    if(response.statusCode == 200) {
      jsonDecode(response.body)['items'].forEach((data) {
        programs.add(ProgramModel.fromJson(data));
      });
    }

    return programs;
  }

  Future<List<LessonModel>> getLessons() async {
    List<LessonModel> lessons = [];

    Response response;
    response = await get(Uri.parse(Constants.lessonsAPI));

    if(response.statusCode == 200) {
      jsonDecode(response.body)['items'].forEach((data) {
        lessons.add(LessonModel.fromJson(data));
      });
    }

    return lessons;
  }

}