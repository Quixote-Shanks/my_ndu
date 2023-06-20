import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_ndu/apis/models/entities/media_file.dart';
import 'package:my_ndu/constants/hive_type_id.dart';

part 'profile.g.dart';

@CopyWith()
@JsonSerializable()
@HiveType(typeId: HiveTypeId.profile)
class Profile {
  Profile({
    required this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.emailVerified,
    required this.uname,
    this.avatar,
    this.phone,
    this.countryCode,
    this.phoneVerified,
    this.gender,
    this.dob,
    this.about,
    this.location,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
    required this.role,
    required this.isPrivate,
    required this.accountStatus,
    required this.isValid,
    required this.isVerified,
    this.verifiedCategory,
    this.showOnlineStatus,
    this.lastSeen,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @JsonKey(name: '_id')
  @HiveField(0)
  String id;

  @JsonKey(name: 'fname')
  @HiveField(1)
  String fname;

  @JsonKey(name: 'lname')
  @HiveField(2)
  String lname;

  @JsonKey(name: 'email')
  @HiveField(3)
  String email;

  @JsonKey(name: 'emailVerified')
  @HiveField(4)
  bool emailVerified;

  @JsonKey(name: 'uname')
  @HiveField(5)
  String uname;

  @JsonKey(name: 'avatar')
  @HiveField(6)
  MediaFile? avatar;

  @JsonKey(name: 'phone')
  @HiveField(7)
  String? phone;

  @JsonKey(name: 'countryCode')
  @HiveField(8)
  String? countryCode;

  @JsonKey(name: 'phoneVerified')
  @HiveField(9)
  bool? phoneVerified;

  @JsonKey(name: 'gender')
  @HiveField(10)
  String? gender;

  @JsonKey(name: 'dob')
  @HiveField(11)
  String? dob;

  @JsonKey(name: 'about')
  @HiveField(12)
  String? about;

  @JsonKey(name: 'location')
  @HiveField(13)
  String? location;

  @JsonKey(name: 'postsCount')
  @HiveField(14)
  int postsCount;

  @JsonKey(name: 'followersCount')
  @HiveField(15)
  int followersCount;

  @JsonKey(name: 'followingCount')
  @HiveField(16)
  int followingCount;

  @JsonKey(name: 'accountStatus')
  @HiveField(17)
  String accountStatus;

  @JsonKey(name: 'isPrivate')
  @HiveField(18)
  bool isPrivate;

  @JsonKey(name: 'isValid')
  @HiveField(19)
  bool isValid;

  @JsonKey(name: 'isVerified')
  @HiveField(20)
  bool isVerified;

  @JsonKey(name: 'verifiedCategory')
  @HiveField(21)
  String? verifiedCategory;

  @JsonKey(name: 'role')
  @HiveField(22)
  String role;

  @JsonKey(name: 'showOnlineStatus')
  @HiveField(23)
  bool? showOnlineStatus;

  @JsonKey(name: 'lastSeen')
  @HiveField(24)
  DateTime? lastSeen;

  @JsonKey(name: 'createdAt')
  @HiveField(25)
  DateTime createdAt;

  @JsonKey(name: 'updatedAt')
  @HiveField(26)
  DateTime updatedAt;
}
