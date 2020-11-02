import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{                                                                 // Creating class category and initializing //
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}

final List<Category> categories = [                                             // Listing categories using Font AwesomeIcons //
  Category(17,"Sample Quiz", icon: FontAwesomeIcons.question),
  Category(6,"Weekly Quiz", icon: FontAwesomeIcons.calendarWeek),
  Category(7,"Monthly Quiz", icon: FontAwesomeIcons.calendar),
  Category(9,"General Knowledge", icon: FontAwesomeIcons.globeAsia),
  Category(10,"More", icon: FontAwesomeIcons.forward),

];