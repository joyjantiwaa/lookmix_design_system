import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lookmix_design_system/src/components/navigation/header_nav_item.dart';

enum HeaderVariant { website, app }

class MyHeader extends StatelessWidget implements PreferredSizeWidget {
  final HeaderVariant variant;
  final String? title;
  final List<HeaderNavItem> navItems;
  final Widget? action;
  final VoidCallback? onBack;
  final Widget? rightContent;
  final String logoName;
  final Widget? customLogo;

  const MyHeader({
    super.key,
    this.variant = HeaderVariant.website,
    this.title,
    this.navItems = const [],
    this.action,
    this.onBack,
    this.rightContent,
    this.logoName = 'LOOKMIX',
    this.customLogo,
  });

  @override
  Size get preferredSize => Size.fromHeight(variant == HeaderVariant.website ? 80 : 56);

  @override
  Widget build(BuildContext context) {
    if (variant == HeaderVariant.website) {
      return _buildWebsiteHeader(context);
    }
    return _buildAppHeader(context);
  }

  // --- Website Variant (Navbar สไตล์เว็บ) ---
  Widget _buildWebsiteHeader(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              // Left: Logo
              customLogo ?? Text(
                logoName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(),
              // Center: Navigation (ซ่อนถ้าจอแคบเหมือน @media 768px)
              if (MediaQuery.of(context).size.width > 768)
                Row(
                  children: navItems.map((item) => _HeaderNavLink(item: item)).toList(),
                ),
              const Spacer(),
              // Right: Action
              if (action != null) action!,
            ],
          ),
        ),
      ),
    );
  }

  // --- App Variant (App Bar สไตล์โมบาย พร้อม Glass Effect) ---
  Widget _buildAppHeader(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // effects-blur-default
        child: Container(
          height: preferredSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha:0.7), // effects-gradients-glass
            border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha:0.2))),
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                // Left: Back Button
                SizedBox(
                  width: 40,
                  child: onBack != null
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: onBack,
                          iconSize: 20,
                        )
                      : null,
                ),
                // Center: Title
                Expanded(
                  child: Center(
                    child: Text(
                      title ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // Right: Right Content
                SizedBox(
                  width: 40,
                  child: rightContent ?? const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderNavLink extends StatefulWidget {
  final HeaderNavItem item;
  const _HeaderNavLink({required this.item});

  @override
  State<_HeaderNavLink> createState() => _HeaderNavLinkState();
}

class _HeaderNavLinkState extends State<_HeaderNavLink> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (v) => setState(() => _isHover = v),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          widget.item.label,
          style: TextStyle(
            color: _isHover ? const Color(0xFF3B82F6) : const Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}