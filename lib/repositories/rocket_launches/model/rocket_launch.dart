class RocketLaunch {
  final String rocketId;
  final String missionName;
  final String description;
  final String launchDate;
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
      launchDate: json['launch_date_utc'] as String,
      websiteLink: json['links']['wikipedia'] as String,
    );
  }
}
