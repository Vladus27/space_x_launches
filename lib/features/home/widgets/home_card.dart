import 'package:flutter/material.dart';
import 'package:space_x_launches/repositories/rocket_launches/model/rocket_launch.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.rocketLaunch});
  final RocketLaunch rocketLaunch;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        _openCorrespondingLink(rocketLaunch.websiteLink);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: .start,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    rocketLaunch.launchDate.formattedDate,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(rocketLaunch.launchDate.formattedTime),
                ],
              ),
              const SizedBox(width: 21),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      rocketLaunch.missionName,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(rocketLaunch.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openCorrespondingLink(String url) async {
    if (url.isEmpty) {
      return;
    }
    final uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  }
}
