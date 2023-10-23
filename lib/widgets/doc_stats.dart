import 'package:doc/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'doc_stats_tile.dart';

class DocStats extends StatelessWidget {
  final int patients;
  final int experience;
  final double rating;
  final int reviews;

  const DocStats({
    super.key,
    required this.patients,
    required this.experience,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DocStatsTile(
            icon: Icons.people_alt_rounded,
            stat: patients.toString(),
            tileName: 'Patients',
          ),
          DocStatsTile(
            icon: Icons.work_rounded,
            stat: experience.toString(),
            tileName: 'Years Exp.',
          ),
          DocStatsTile(
            icon: Icons.star_rounded,
            stat: rating.toString(),
            tileName: 'Rating',
          ),
          DocStatsTile(
            icon: Icons.message_rounded,
            stat: reviews.toString(),
            tileName: 'Review',
          ),
        ],
      ),
    );
  }
}
