import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 4)
class Subject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String slug;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String desc;
  @HiveField(4)
  final String lecturer;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final List<int> gradientValues;  // Store as a list of integer values for Hive compatibility

  // Additional non-Hive field for convenience
  List<Color> get gradient => gradientValues.map((value) => Color(value)).toList();

  Subject({
    required this.id,
    required this.slug,
    required this.name,
    required this.desc,
    required this.lecturer,
    required this.image,
    required List<Color> gradient,
  }) : this.gradientValues = gradient.map((color) => color.value).toList();

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json['id'],
    slug: json['slug'],
    name: json['name'],
    desc: json['desc'],
    lecturer: json['lecturer'],
    image: json['image'],
    gradient: (json['gradient'] as List).map((value) => Color(value as int)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'slug': slug,
    'name': name,
    'desc': desc,
    'lecturer': lecturer,
    'image': image,
    'gradient': gradientValues
  };
}
