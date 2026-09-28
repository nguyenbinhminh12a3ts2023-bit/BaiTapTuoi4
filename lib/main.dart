import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileData {
  static const String avatarAsset = 'assets/images/avatar.png';

  static const String name = 'Lượm';
  static const String role = 'Lead Mobile Engineer';
  static const String location = 'DaLat';

  static const String projectsCount = '168';
  static const String experienceYears = '5 Yrs';
  static const String rating = '4.8';

  static const String aboutMe =
      'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant UI design, clean code architecture, and seamless user experiences.';

  static const List<SkillItem> skills = [
    SkillItem(
      label: 'Flutter',
      icon: Icons.flutter_dash,
      textColor: Color(0xFF0284C7),
      bgColor: Color(0xFFE0F2FE),
    ),
    SkillItem(
      label: 'Dart',
      icon: Icons.code_rounded,
      textColor: Color(0xFF16A34A),
      bgColor: Color(0xFFDCFCE7),
    ),
    SkillItem(
      label: 'Clean Arch',
      icon: Icons.layers_rounded,
      textColor: Color(0xFFE11D48),
      bgColor: Color(0xFFFFE4E6),
    ),
    SkillItem(
      label: 'UI/UX',
      icon: Icons.draw_outlined,
      textColor: Color(0xFF9333EA),
      bgColor: Color(0xFFF3E8FF),
    ),
    SkillItem(
      label: 'Firebase',
      icon: Icons.local_fire_department_rounded,
      textColor: Color(0xFFD97706),
      bgColor: Color(0xFFFEF3C7),
    ),
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'E-Shop Flutter',
      category: 'Mobile App • 2026',
      imageAsset: 'assets/images/project1.jpg',
    ),
    ProjectItem(
      title: 'Crypto Vault',
      category: 'Finance • Clean Arch',
      imageAsset: 'assets/images/project2.jpg',
    ),
  ];

  static const String email = 'Luom.Cute@gmail.com';
  static const String phone = '099 686868';
}

class SkillItem {
  final String label;
  final IconData icon;
  final Color textColor;
  final Color bgColor;

  const SkillItem({
    required this.label,
    required this.icon,
    required this.textColor,
    required this.bgColor,
  });
}

class ProjectItem {
  final String title;
  final String category;
  final String imageAsset;

  const ProjectItem({
    required this.title,
    required this.category,
    required this.imageAsset,
  });
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 24),
                  _buildAvatarSection(),
                  const SizedBox(height: 16),
                  _buildUserInfoSection(),
                  const SizedBox(height: 24),
                  _buildStatsCard(),
                  const SizedBox(height: 24),
                  _buildAboutMeSection(),
                  const SizedBox(height: 24),
                  _buildSkillsSection(),
                  const SizedBox(height: 24),
                  _buildFeaturedProjectsSection(),
                  const SizedBox(height: 24),
                  _buildContactCard(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 1. TopBar (Row: MainAxisAlignment.spaceBetween)
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconButton(
          icon: Icons.chevron_left_rounded,
          onTap: () {},
        ),
        Text(
          'Profile',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        _buildIconButton(
          icon: Icons.share_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          size: 20,
          color: const Color(0xFF334155),
        ),
      ),
    );
  }

  // 2. Profile Header (Column: CrossAxisAlignment.center)
  Widget _buildAvatarSection() {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Container (Gradient Ring: 140x140 | #FFB088 -> #FF8080 -> ...)
          Container(
            width: 140,
            height: 140,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFB088),
                  Color(0xFFFF8080),
                  Color(0xFF8B5CF6),
                  Color(0xFF38BDF8),
                ],
              ),
            ),
          ),
          // Container (White Border: 132x132)
          Container(
            width: 132,
            height: 132,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          // ClipOval > Image.network / Image.asset (124x124)
          ClipOval(
            child: SizedBox(
              width: 124,
              height: 124,
              child: Image.asset(
                ProfileData.avatarAsset,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.25),
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE2E8F0),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 56,
                      color: Color(0xFF94A3B8),
                    ),
                  );
                },
              ),
            ),
          ),
          // Positioned (Verified Badge: 28x28 | Blue #0284C7)
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFF0284C7),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.5),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoSection() {
    return Column(
      children: [
        Text(
          ProfileData.name,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          ProfileData.role,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 12),
        // Container > Row (Location Pill: Radius 20 | #F1F5F9)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 15,
                color: Color(0xFF64748B),
              ),
              const SizedBox(width: 5),
              Text(
                ProfileData.location,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 3. Stats Card (Container > Row: Radius 20 | BoxShadow 0 8 18)
  Widget _buildStatsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatColumn(ProfileData.projectsCount, 'Projects'),
          _buildVerticalDivider(),
          _buildStatColumn(ProfileData.experienceYears, 'Experience'),
          _buildVerticalDivider(),
          _buildStatColumn(
            ProfileData.rating,
            'Rating',
            showStar: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String value, String label, {bool showStar = false}) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0F172A),
                ),
              ),
              if (showStar) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFEAB308),
                  size: 20,
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 32,
      width: 1,
      color: const Color(0xFFE2E8F0),
    );
  }

  // 4. About Me (Column)
  Widget _buildAboutMeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'About Me',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          ProfileData.aboutMe,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            height: 21 / 14, // Line-height 21px
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  // 5. Skills & Expertise (Column > Wrap)
  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Skills & Expertise',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Row 1 & Row 2 via Wrap / Rows
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ProfileData.skills.map((skill) {
            return _buildSkillChip(skill);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSkillChip(SkillItem skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: skill.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            skill.icon,
            size: 16,
            color: skill.textColor,
          ),
          const SizedBox(width: 6),
          Text(
            skill.label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: skill.textColor,
            ),
          ),
        ],
      ),
    );
  }

  // 6. Featured Projects (Row: 2 Expanded Cards)
  Widget _buildFeaturedProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Featured Projects',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
        ),
        const SizedBox(height: 14),
        // Row (Expanded Project Cards: 342px) -> Card: 165x145 | Radius 16
        Row(
          children: [
            Expanded(
              child: _buildProjectCard(ProfileData.projects[0]),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildProjectCard(ProfileData.projects[1]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectCard(ProjectItem project) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 12,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  project.imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFE2E8F0),
                      child: const Icon(
                        Icons.image_not_supported_rounded,
                        color: Color(0xFF94A3B8),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    project.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    project.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 7. Contact Card (Container > Column: Radius 20 | Shadow 0 4 12)
  Widget _buildContactCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildContactItem(
            icon: Icons.alternate_email_rounded,
            title: 'Contact Information',
            isHeader: true,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF1F5F9),
            indent: 16,
            endIndent: 16,
          ),
          _buildContactItem(
            icon: Icons.mail_outline_rounded,
            title: ProfileData.email,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF1F5F9),
            indent: 16,
            endIndent: 16,
          ),
          _buildContactItem(
            icon: Icons.phone_outlined,
            title: ProfileData.phone,
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          // Icon Box (34x34 | Radius 10)
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 17,
              color: const Color(0xFF334155),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
                color: isHeader
                  ? const Color(0xFF0F172A)
                  : const Color(0xFF334155),
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: Color(0xFF94A3B8),
          ),
        ],
      ),
    );
  }
}