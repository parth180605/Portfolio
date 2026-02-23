import 'package:flutter/material.dart';
import '../models/project.dart';
import '../constants/colors.dart';
import '../views/project_detail_view.dart';
import '../views/mobile_project_detail_view.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isMobile;
  const ProjectCard({super.key, required this.project, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    const primaryCyan = AppColors.primaryCyan;
    const cardBg = AppColors.cardBg;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => isMobile
                ? MobileProjectDetailView(project: project)
                : ProjectDetailView(project: project),
          ),
        );
      },
      child: Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isMobile ? 180 : 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF162D31),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    _getIconForCategory(project.category),
                    color: primaryCyan.withOpacity(0.1),
                    size: 60,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: primaryCyan.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryCyan.withOpacity(0.1)),
                    ),
                    child: Text(
                      project.imageTag,
                      style: const TextStyle(
                        color: primaryCyan,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: project.techStack
                        .map(
                          (tech) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              tech,
                              style: const TextStyle(
                                color: primaryCyan,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  project.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.secondaryGrey.withOpacity(0.8),
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'VIEW PROJECT',
                      style: TextStyle(
                        color: primaryCyan,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: primaryCyan,
                      size: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'AI/ML':
        return Icons.psychology_outlined;
      case 'Web3':
        return Icons.currency_bitcoin_outlined;
      case 'Frontend':
        return Icons.web_outlined;
      default:
        return Icons.code_outlined;
    }
  }
}
