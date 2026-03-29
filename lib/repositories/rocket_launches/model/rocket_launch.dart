import 'package:intl/intl.dart';

class RocketLaunch {
  final String rocketId;
  final String missionName;
  final String description;
  final DateTime launchDate;
  final String websiteLink;

  RocketLaunch({
    required this.rocketId,
    required this.missionName,
    required this.description,
    required this.launchDate,
    required this.websiteLink,
  });

  factory RocketLaunch.fromJson(Map<String, dynamic> json) {
    return RocketLaunch(
      rocketId: json['rocket']['rocket_id'] as String,
      missionName: json['mission_name'] as String,
      description: json['launch_site']['site_name_long'] as String,
      launchDate: DateTime.parse(json['launch_date_utc']),
      websiteLink: json['links']['wikipedia'] ?? '',
    );
  }
}

extension DateFormatting on DateTime {
  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);

  String get formattedTime => DateFormat('hh:mm a').format(this);
}
