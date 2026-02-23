import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../models/project.dart';
import '../models/personal_info.dart';
import '../widgets/plexus_background.dart';
import '../widgets/project_card.dart';
import '../widgets/filter_tab.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  String _selectedCategory = 'All';

  List<Project> get _filteredProjects {
    if (_selectedCategory == 'All') {
      return dummyProjects;
    }
    return dummyProjects
        .where((project) => project.category == _selectedCategory)
        .toList();
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: PersonalInfo.email,
      query: 'subject=Project Inquiry',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: bgColor.withOpacity(0.8),
            border: Border(
              bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.terminal, color: primaryCyan),
              ),
              const SizedBox(width: 12),
              const Text(
                PersonalInfo.brandName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              _navLink('Projects'),
              _navLink('Experience'),
              _navLink('About'),
              _navLink('Blog'),
              const SizedBox(width: 40),
              ElevatedButton(
                onPressed: _launchEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryCyan,
                  foregroundColor: bgColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Contact Me',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 16),
              const CircleAvatar(
                radius: 18,
                backgroundColor: cardBg,
                child: Icon(Icons.person, color: primaryCyan, size: 20),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          const AnimatedPlexusBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: primaryCyan.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: primaryCyan.withOpacity(0.1),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          color: primaryCyan,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        PersonalInfo.availabilityStatus,
                                        style: TextStyle(
                                          color: primaryCyan,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 32),
                                RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      fontSize: 72,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      height: 1.1,
                                    ),
                                    children: [
                                      TextSpan(text: 'Crafting the\n'),
                                      TextSpan(
                                        text: 'next generation',
                                        style: TextStyle(color: primaryCyan),
                                      ),
                                      TextSpan(text: '\nof mobile apps'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  PersonalInfo.professionalSummary,
                                  style: TextStyle(
                                    color: secondaryGrey,
                                    fontSize: 20,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 48),
                                const Text(
                                  'CORE TECH STACK',
                                  style: TextStyle(
                                    color: secondaryGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  children: [
                                    _techChip('Flutter', Icons.phone_android),
                                    _techChip('Dart', Icons.code),
                                    _techChip('Firebase', Icons.cloud_outlined),
                                    _techChip('HTML', Icons.web),
                                    _techChip('CSS', Icons.style),
                                    _techChip('JavaScript', Icons.javascript),
                                    _techChip('Angular', Icons.web_asset),
                                    _techChip('Node.js', Icons.dns),
                                    _techChip('Bootstrap', Icons.grid_view),
                                    _techChip('Tailwind', Icons.palette),
                                    _techChip('Java', Icons.coffee),
                                    _techChip('C++', Icons.code_outlined),
                                    _techChip('REST APIs', Icons.api),
                                    _techChip('Git', Icons.source),
                                  ],
                                ),
                                const SizedBox(height: 48),
                                Row(
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
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryCyan,
                                          foregroundColor: bgColor,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32,
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
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
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
                                        'Explore Work',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 40),
                                    _statItem(
                                      PersonalInfo.yearsExperience,
                                      'YEARS\nEXP',
                                    ),
                                    const SizedBox(width: 40),
                                    _statItem(
                                      PersonalInfo.totalProjects,
                                      'PROJECTS',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Right Column
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: 300,
                            margin: const EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.05),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          _dot(Colors.red),
                                          const SizedBox(width: 6),
                                          _dot(Colors.orange),
                                          const SizedBox(width: 6),
                                          _dot(Colors.green),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      RichText(
                                        text: const TextSpan(
                                          style: TextStyle(
                                            fontFamily: 'monospace',
                                            fontSize: 16,
                                            height: 1.5,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'const ',
                                              style: TextStyle(
                                                color: Color(0xFFC678DD),
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'portfolio',
                                              style: TextStyle(
                                                color: Color(0xFFD19A66),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' = {\n',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '  status',
                                              style: TextStyle(
                                                color: Color(0xFF98C379),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ': ',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '"hiring"',
                                              style: TextStyle(
                                                color: Color(0xFFE5C07B),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ',\n',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '  role',
                                              style: TextStyle(
                                                color: Color(0xFF98C379),
                                              ),
                                            ),
                                            TextSpan(
                                              text: ': ',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '"Senior Dev"',
                                              style: TextStyle(
                                                color: Color(0xFFE5C07B),
                                              ),
                                            ),
                                            TextSpan(
                                              text: '\n};',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                // Engineering Solutions Section
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      children: [
                                        TextSpan(text: 'Engineering '),
                                        TextSpan(
                                          text: 'Solutions',
                                          style: TextStyle(
                                            color: AppColors.primaryCyan,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'A curated gallery of technical implementations ranging from machine\nlearning models to decentralized finance dashboards. Each project\nrepresents a unique challenge solved through modern architecture.',
                                    style: TextStyle(
                                      color: AppColors.secondaryGrey,
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryCyan.withOpacity(
                                    0.05,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.primaryCyan.withOpacity(
                                      0.1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primaryCyan,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Available for new projects',
                                      style: TextStyle(
                                        color: AppColors.primaryCyan,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: AppColors.cardBg,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.05),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        color: AppColors.secondaryGrey
                                            .withOpacity(0.5),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText:
                                                'Search by technology, industry, or project name...',
                                            hintStyle: TextStyle(
                                              color: AppColors.secondaryGrey
                                                  .withOpacity(0.3),
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = 'All';
                                  });
                                },
                                child: FilterTab(
                                  label: 'All',
                                  isActive: _selectedCategory == 'All',
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = 'eCommerce';
                                  });
                                },
                                child: FilterTab(
                                  label: 'eCommerce',
                                  isActive: _selectedCategory == 'eCommerce',
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = 'Enterprise';
                                  });
                                },
                                child: FilterTab(
                                  label: 'Enterprise',
                                  isActive: _selectedCategory == 'Enterprise',
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = 'EdTech';
                                  });
                                },
                                child: FilterTab(
                                  label: 'EdTech',
                                  isActive: _selectedCategory == 'EdTech',
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = 'On-Demand';
                                  });
                                },
                                child: FilterTab(
                                  label: 'On-Demand',
                                  isActive: _selectedCategory == 'On-Demand',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 30,
                                  mainAxisSpacing: 30,
                                  childAspectRatio: 1.1,
                                ),
                            itemCount: _filteredProjects.length,
                            itemBuilder: (context, index) =>
                                ProjectCard(project: _filteredProjects[index]),
                          ),
                          const SizedBox(height: 60),
                          Center(
                            child: Column(
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.primaryCyan,
                                    side: const BorderSide(
                                      color: AppColors.primaryCyan,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Load More Projects',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'Showing 6 of 24 projects',
                                  style: TextStyle(
                                    color: AppColors.secondaryGrey.withOpacity(
                                      0.5,
                                    ),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                // Footer
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.white.withOpacity(0.05)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        PersonalInfo.footerText,
                        style: TextStyle(
                          color: AppColors.secondaryGrey.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => _launchUrl(PersonalInfo.linkedIn),
                        child: _footerLink('LinkedIn'),
                      ),
                      const SizedBox(width: 24),
                      GestureDetector(
                        onTap: () {},
                        child: _footerLink('GitLab'),
                      ),
                      const SizedBox(width: 24),
                      GestureDetector(
                        onTap: _launchEmail,
                        child: _footerLink('Email'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navLink(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF94A3B8),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _techChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0E2529),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF1E3A3E)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF00D2FF), size: 16),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF00D2FF),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 12,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _footerLink(String label) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.secondaryGrey.withOpacity(0.6),
        fontSize: 14,
      ),
    );
  }
}
