import 'package:flutter/material.dart';
import 'package:portfolio_jessica/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.pastelPink.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildContactInfo(isMobile),
          const SizedBox(height: 32),
          _buildSocialLinks(isMobile),
          const SizedBox(height: 32),
          _buildCopyright(isMobile),
        ],
      ),
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return Wrap(
      spacing: isMobile ? 16 : 32,
      runSpacing: isMobile ? 16 : 24,
      alignment: WrapAlignment.center,
      children: [
        _buildContactItem(
          icon: Icons.email_outlined,
          label: 'Email',
          value: 'jessica@email.com',
          onTap: () => _launchUrl('mailto:jessica@email.com'),
        ),
        _buildContactItem(
          icon: Icons.phone_outlined,
          label: 'Telefone',
          value: '+55 (47) 99999-9999',
          onTap: () => _launchUrl('tel:+5547999999999'),
        ),
        _buildContactItem(
          icon: Icons.location_on_outlined,
          label: 'Localização',
          value: 'Blumenau, SC',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: AppColors.pastelPink,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          icon: Icons.facebook_outlined,
          url: 'https://facebook.com',
        ),
        const SizedBox(width: 16),
        _buildSocialButton(
          icon: Icons.camera_alt_outlined,
          url: 'https://instagram.com',
        ),
        const SizedBox(width: 16),
        _buildSocialButton(
          icon: Icons.link,
          url: 'https://linkedin.com',
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String url,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.pastelPink.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: AppColors.pastelPink,
        onPressed: () => _launchUrl(url),
        tooltip: 'Abrir link',
      ),
    );
  }

  Widget _buildCopyright(bool isMobile) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 1,
          color: AppColors.pastelPink.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(vertical: 16),
        ),
        Text(
          '© ${DateTime.now().year} Jessica Schatz. Todos os direitos reservados.',
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}