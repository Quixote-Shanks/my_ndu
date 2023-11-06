import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_ndu/constants/hive_type_id.dart';

part 'subject.g.dart';

@HiveType(typeId: HiveTypeId.subject)
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
  final List<int>
      gradientValues; // Store as a list of integer values for Hive compatibility

  // Additional non-Hive field for convenience
  List<Color> get gradient =>
      gradientValues.map((value) => Color(value)).toList();

  // Named constructor for creating a Subject instance from JSON
  factory Subject.fromJson(Map<String, dynamic> json) {
    final gradientValues = (json['gradient'] as List).cast<int>();
    final gradientColors =
        gradientValues.map(Color.new).toList();

    return Subject(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      desc: json['desc'],
      lecturer: json['lecturer'],
      image: json['image'],
      gradient: gradientColors,
    );
  }

  // Named constructor for creating a Subject instance
  Subject({
    required this.id,
    required this.slug,
    required this.name,
    required this.desc,
    required this.lecturer,
    required this.image,
    List<Color>? gradient,
  }) : gradientValues = gradient!.map((color) => color.value).toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'desc': desc,
        'lecturer': lecturer,
        'image': image,
        'gradient': gradientValues,
      };
}