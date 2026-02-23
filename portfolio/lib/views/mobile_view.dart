import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../models/project.dart';
import '../models/personal_info.dart';
import '../widgets/plexus_background.dart';
import '../widgets/project_card.dart';
import '../widgets/filter_tab.dart';
import 'profile_view.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int _selectedIndex = 0;
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
    const cardBg = AppColors.cardBg;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            const AnimatedPlexusBackground(),
            Column(
              children: [
                // Custom AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.terminal,
                          color: primaryCyan,
                          size: 24,
                        ),
                      ),
                      const Text(
                        PersonalInfo.brandShort,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const Icon(Icons.share, color: primaryCyan, size: 24),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: _selectedIndex == 0
                        ? _buildHomeSection()
                        : _selectedIndex == 1
                            ? _buildProjectsSection()
                            : const ProfileView(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(
            top: BorderSide(color: Colors.white.withOpacity(0.05)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNav(Icons.home, 'Home', 0),
            _buildBottomNav(Icons.code, 'Projects', 1),
            _buildBottomNav(Icons.person_outline, 'Profile', 2),
            _buildBottomNav(Icons.description_outlined, 'Resume', 3),
            _buildBottomNav(Icons.send_outlined, 'Contact', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeSection() {
    const secondaryGrey = AppColors.secondaryGrey;
    const primaryCyan = AppColors.primaryCyan;
    const cardBg = AppColors.cardBg;

    return Column(
      children: [
        const SizedBox(height: 40),

        // Avatar Section
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryCyan.withOpacity(0.5),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryCyan.withOpacity(0.2),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundColor: cardBg,
                child: Icon(Icons.person, color: primaryCyan, size: 80),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.bgColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.verified, color: primaryCyan, size: 32),
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Hero Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(text: 'Building the '),
                    TextSpan(
                      text: 'future',
                      style: TextStyle(color: primaryCyan),
                    ),
                    TextSpan(text: '\nof mobile'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                PersonalInfo.professionalSummaryMobile,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: secondaryGrey,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // Tags
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            _buildTag('Flutter'),
            _buildTag('Dart'),
            _buildTag('Firebase'),
            _buildTag('HTML'),
            _buildTag('CSS'),
            _buildTag('JavaScript'),
            _buildTag('Angular'),
            _buildTag('Node.js'),
            _buildTag('Bootstrap'),
            _buildTag('Tailwind'),
            _buildTag('Java'),
            _buildTag('C++'),
            _buildTag('REST APIs'),
            _buildTag('Git'),
          ],
        ),

        const SizedBox(height: 40),

        // Action Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryCyan,
                    foregroundColor: AppColors.bgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'View Projects',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: _launchEmail,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF1E3A3E), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Get in touch',
                        style: TextStyle(
                          color: primaryCyan,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.mail_outline, color: primaryCyan),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),

        // Stats Section
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat(PersonalInfo.yearsExperience, 'YEARS'),
              _buildDivider(),
              _buildStat(PersonalInfo.totalProjects, 'PROJECTS'),
              _buildDivider(),
              _buildStat('BCA', 'STUDENT'),
            ],
          ),
        ),

        const SizedBox(height: 40),

        // Navigation Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.code, color: secondaryGrey.withOpacity(0.5), size: 32),
            const SizedBox(width: 30),
            Icon(Icons.public, color: secondaryGrey.withOpacity(0.5), size: 32),
            const SizedBox(width: 30),
            Icon(
              Icons.people_outline,
              color: secondaryGrey.withOpacity(0.5),
              size: 32,
            ),
          ],
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildProjectsSection() {
    const primaryCyan = AppColors.primaryCyan;
    const secondaryGrey = AppColors.secondaryGrey;
    const cardBg = AppColors.cardBg;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Engineering '),
                TextSpan(
                  text: 'Solutions',
                  style: TextStyle(color: primaryCyan),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'A curated gallery of technical implementations ranging from machine learning models to decentralized finance dashboards.',
            style: TextStyle(color: secondaryGrey, fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: secondaryGrey.withOpacity(0.5),
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search projects...',
                      hintStyle: TextStyle(
                        color: secondaryGrey.withOpacity(0.3),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
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
                const SizedBox(width: 8),
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
                const SizedBox(width: 8),
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
                const SizedBox(width: 8),
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
              ],
            ),
          ),
          const SizedBox(height: 30),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _filteredProjects.length > 3 ? 3 : _filteredProjects.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) =>
                ProjectCard(project: _filteredProjects[index], isMobile: true),
          ),
          const SizedBox(height: 40),
          Center(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: primaryCyan,
                side: const BorderSide(color: primaryCyan),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('View All Projects'),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF1E3A3E)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.primaryCyan,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primaryCyan,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.secondaryGrey,
            fontSize: 10,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withOpacity(0.1),
    );
  }

  Widget _buildBottomNav(IconData icon, String label, int index) {
    final bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.primaryCyan : AppColors.secondaryGrey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.primaryCyan : AppColors.secondaryGrey,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
