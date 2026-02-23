import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../models/personal_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 1024;
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              // Hero Section
              _buildHeroSection(isMobile),
              const SizedBox(height: 100),
              // Career Journey
              _buildSectionTitle('Career Journey'),
              const SizedBox(height: 40),
              _buildCareerJourney(),
              const SizedBox(height: 100),
              // Technical Arsenal
              _buildSectionTitle('Technical Arsenal'),
              const SizedBox(height: 40),
              _buildTechnicalArsenal(isMobile),
              const SizedBox(height: 100),
              // Education & Certifications
              _buildEducationAndCertifications(isMobile),
              const SizedBox(height: 100),
              // Footer
              _buildFooter(isMobile),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 30 : 80),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          // Profile Image
          Container(
            width: isMobile ? 250 : 300,
            height: isMobile ? 250 : 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primaryCyan, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryCyan.withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: const Icon(
                Icons.person,
                size: 150,
                color: AppColors.primaryCyan,
              ), // Placeholder for image
            ),
          ),
          if (!isMobile) const SizedBox(width: 80),
          if (isMobile) const SizedBox(height: 40),
          // Text Content
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment:
                  isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                const Text(
                  PersonalInfo.name,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  PersonalInfo.title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: AppColors.primaryCyan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  PersonalInfo.professionalSummary,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.secondaryGrey,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _socialButton('GitHub', Icons.code, PersonalInfo.gitHub),
                    _socialButton('LinkedIn', Icons.link, PersonalInfo.linkedIn),
                    _socialButton('Twitter', Icons.chat_bubble_outline, PersonalInfo.twitter),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton(String label, IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchUrl(url),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primaryCyan, size: 18),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareerJourney() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: PersonalInfo.careerJourney.map((entry) {
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.cardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline indicator
                Column(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryCyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 100, // Fixed height for simplicity in mockup
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                entry.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                entry.company,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.primaryCyan,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              entry.period,
                              style: const TextStyle(
                                color: AppColors.secondaryGrey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ...entry.achievements.map((achievement) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Icon(Icons.circle,
                                    size: 6, color: AppColors.primaryCyan),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  achievement,
                                  style: const TextStyle(
                                    color: AppColors.secondaryGrey,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTechnicalArsenal(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: LayoutBuilder(builder: (context, constraints) {
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: isMobile ? 1 : 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: isMobile ? 1.5 : 2.5,
          children: [
            _buildArsenalCard('Mobile Development', Icons.phone_android, ['Flutter', 'Dart']),
            _buildArsenalCard('Frontend', Icons.grid_view, [
              'React',
              'Angular',
              'HTML',
              'CSS',
              'JavaScript',
              'Tailwind CSS',
              'Bootstrap',
              'PrimeNG'
            ]),
            _buildArsenalCard('Backend & Database', Icons.dns, [
              'Node.js',
              'MongoDB',
              'Firebase',
              'REST API Integration'
            ]),
            _buildArsenalCard('Tools', Icons.build_circle_outlined, ['Git', 'GitHub', 'GitLab']),
          ],
        );
      }),
    );
  }

  Widget _buildArsenalCard(String title, IconData icon, List<String> tags) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryCyan),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: AppColors.secondaryGrey,
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationAndCertifications(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubSectionTitle('Education'),
                const SizedBox(height: 24),
                ...PersonalInfo.education.map((edu) {
                  return _buildEducationCard(edu);
                }).toList(),
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 40),
          if (isMobile) const SizedBox(height: 60),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubSectionTitle('Certifications'),
                const SizedBox(height: 24),
                ...PersonalInfo.certifications.map((cert) {
                  return _buildCertificationItem(cert);
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubSectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationCard(EducationEntry edu) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  edu.degree,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                edu.period,
                style: const TextStyle(
                  color: AppColors.primaryCyan,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            edu.institution,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.secondaryGrey,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            edu.specialization,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.secondaryGrey.withOpacity(0.7),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationItem(CertificationEntry cert) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.primaryCyan, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              cert.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            cert.year,
            style: const TextStyle(
              color: AppColors.secondaryGrey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            PersonalInfo.footerText,
            style: TextStyle(
              color: AppColors.secondaryGrey.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
          const Row(
            children: [
              Text('Privacy', style: TextStyle(color: AppColors.secondaryGrey, fontSize: 12)),
              SizedBox(width: 20),
              Text('Terms', style: TextStyle(color: AppColors.secondaryGrey, fontSize: 12)),
              SizedBox(width: 20),
              Text('Blog', style: TextStyle(color: AppColors.secondaryGrey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
