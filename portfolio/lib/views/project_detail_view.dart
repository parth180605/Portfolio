import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../models/project.dart';
import '../widgets/plexus_background.dart';

class ProjectDetailView extends StatelessWidget {
  final Project project;

  const ProjectDetailView({super.key, required this.project});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'parthbhangare@gmail.com',
      query: 'subject=Inquiry about ${project.title}',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    const bgColor = AppColors.bgColor;
    const primaryCyan = AppColors.primaryCyan;
    const secondaryGrey = AppColors.secondaryGrey;
    const cardBg = AppColors.cardBg;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          const AnimatedPlexusBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                // Header with back button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor.withOpacity(0.8),
                    border: Border(
                      bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: primaryCyan),
                        style: IconButton.styleFrom(
                          backgroundColor: cardBg,
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Back to Projects',
                        style: TextStyle(
                          color: secondaryGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: primaryCyan.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: primaryCyan.withOpacity(0.1),
                          ),
                        ),
                        child: Text(
                          project.imageTag,
                          style: const TextStyle(
                            color: primaryCyan,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                // Main Content
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Project Title and Category
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: cardBg,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.05),
                                  ),
                                ),
                                child: Text(
                                  project.category.toUpperCase(),
                                  style: TextStyle(
                                    color: secondaryGrey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            project.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            project.description,
                            style: TextStyle(
                              color: secondaryGrey,
                              fontSize: 20,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 48),
                          // Tech Stack Section
                          Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.05),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: primaryCyan.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.code,
                                        color: primaryCyan,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'TECH STACK',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: project.techStack
                                      .map(
                                        (tech) => Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF162D31),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            border: Border.all(
                                              color: primaryCyan.withOpacity(
                                                0.1,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            tech,
                                            style: const TextStyle(
                                              color: primaryCyan,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 48),
                          // Project Overview Section
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(32),
                                  decoration: BoxDecoration(
                                    color: cardBg,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.05),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: primaryCyan.withOpacity(
                                                0.1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.info_outline,
                                              color: primaryCyan,
                                              size: 20,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          const Text(
                                            'PROJECT OVERVIEW',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      _buildInfoRow(
                                        'Category',
                                        project.category,
                                      ),
                                      const SizedBox(height: 16),
                                      _buildInfoRow('Status', project.imageTag),
                                      const SizedBox(height: 16),
                                      _buildInfoRow(
                                        'Platform',
                                        'Mobile (iOS & Android)',
                                      ),
                                      const SizedBox(height: 16),
                                      _buildInfoRow(
                                        'Type',
                                        _getProjectType(project.imageTag),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(32),
                                  decoration: BoxDecoration(
                                    color: cardBg,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.05),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: primaryCyan.withOpacity(
                                                0.1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.lightbulb_outline,
                                              color: primaryCyan,
                                              size: 20,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          const Text(
                                            'KEY FEATURES',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      ..._getKeyFeatures(project.category)
                                          .map(
                                            (feature) => Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 12,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                          top: 4,
                                                        ),
                                                    width: 6,
                                                    height: 6,
                                                    decoration:
                                                        const BoxDecoration(
                                                          color: primaryCyan,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: Text(
                                                      feature,
                                                      style: TextStyle(
                                                        color: secondaryGrey,
                                                        fontSize: 14,
                                                        height: 1.5,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 48),
                          // Project Image/Preview Section
                          Container(
                            height: 400,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF162D31),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.05),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _getIconForCategory(project.category),
                                    color: primaryCyan.withOpacity(0.2),
                                    size: 80,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Project Preview',
                                    style: TextStyle(
                                      color: secondaryGrey.withOpacity(0.5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                          // CTA Section
                          Container(
                            padding: const EdgeInsets.all(48),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.05),
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Interested in this project?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Let\'s discuss how I can help bring your ideas to life',
                                  style: TextStyle(
                                    color: secondaryGrey,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: primaryCyan.withOpacity(0.3),
                                            blurRadius: 20,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: _launchEmail,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryCyan,
                                          foregroundColor: bgColor,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 20,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Get in Touch',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    OutlinedButton(
                                      onPressed: () => Navigator.pop(context),
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 40,
                                          vertical: 20,
                                        ),
                                        side: BorderSide(
                                          color: Colors.white.withOpacity(0.1),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'View More Projects',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.secondaryGrey.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  String _getProjectType(String tag) {
    switch (tag) {
      case 'CLIENT':
        return 'Client Project';
      case 'LIVE':
        return 'Live Production';
      case 'PERSONAL':
        return 'Personal Project';
      case 'TEAM':
        return 'Team Project';
      case 'IN DEV':
        return 'In Development';
      default:
        return 'Project';
    }
  }

  List<String> _getKeyFeatures(String category) {
    switch (category) {
      case 'eCommerce':
        return [
          'Product browsing and search',
          'Shopping cart management',
          'Secure payment integration',
          'Order tracking system',
        ];
      case 'Enterprise':
        return [
          'Employee management',
          'Task assignment system',
          'Real-time collaboration',
          'Analytics dashboard',
        ];
      case 'Logistics':
        return [
          'Real-time order tracking',
          'Route optimization',
          'Live location updates',
          'Delivery management',
        ];
      case 'EdTech':
        return [
          'Course management',
          'Progress tracking',
          'Interactive content',
          'Student analytics',
        ];
      case 'AI/EdTech':
        return [
          'AI-powered tutoring',
          'Natural language processing',
          'Personalized learning',
          'Real-time assistance',
        ];
      case 'Quick Commerce':
        return [
          'Fast product browsing',
          'Quick checkout',
          'Real-time delivery tracking',
          'Instant notifications',
        ];
      case 'On-Demand':
        return [
          'Service scheduling',
          'Real-time tracking',
          'Payment processing',
          'Order management',
        ];
      case 'Marketplace':
        return [
          'Vendor management',
          'Product listings',
          'Search and filters',
          'Transaction handling',
        ];
      case 'Brand':
        return [
          'Brand engagement',
          'Product showcase',
          'Customer interaction',
          'Service management',
        ];
      default:
        return [
          'Modern UI/UX design',
          'Responsive layout',
          'Performance optimized',
          'Cross-platform support',
        ];
    }
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'eCommerce':
        return Icons.shopping_bag_outlined;
      case 'Enterprise':
        return Icons.business_outlined;
      case 'Logistics':
        return Icons.local_shipping_outlined;
      case 'EdTech':
        return Icons.school_outlined;
      case 'AI/EdTech':
        return Icons.psychology_outlined;
      case 'Quick Commerce':
        return Icons.flash_on_outlined;
      case 'On-Demand':
        return Icons.delivery_dining_outlined;
      case 'Marketplace':
        return Icons.store_outlined;
      case 'Brand':
        return Icons.branding_watermark_outlined;
      default:
        return Icons.code_outlined;
    }
  }
}
