import 'package:flutter/material.dart';
// ✅ แก้เป็น Package Import ทั้งหมดเพื่อความชัวร์
import 'package:lookmix_design_system/src/theme/jpjoy_theme_provider.dart';
import 'package:lookmix_design_system/src/components/forms/button.dart';
import 'package:lookmix_design_system/tokens/tokens.dart'; 

class LookmixModal {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget child,
    String size = 'md',
    Widget? footer,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (ctx, anim1, anim2) {
        return LookmixModalInternal( // เปลี่ยนชื่อให้ตรงกับด้านล่าง
          title: title,
          size: size,
          footer: footer,
          child: child,
        );
      },
      transitionBuilder: (ctx, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.05),
              end: Offset.zero,
            ).animate(anim1),
            child: child,
          ),
        );
      },
    );
  }
}

class LookmixModalInternal extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? footer;
  final String size;

  const LookmixModalInternal({
    super.key,
    required this.title,
    required this.child,
    this.footer,
    this.size = 'md',
  });

  @override
  Widget build(BuildContext context) {
    final tokens = JpjoyThemeProvider.of(context).tokens;
    
    double width = 500;
    if (size == 'sm') width = 340;
    if (size == 'lg') width = 800;

    if (size == 'full') {
      return Scaffold(
        backgroundColor: tokens.colorSurfaceBackground,
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: tokens.colorTextPrimary, fontSize: 18)),
          leading: IconButton(
            icon: Icon(Icons.close, color: tokens.colorTextPrimary),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: tokens.colorSurfacePrimary,
          elevation: 0,
        ),
        body: Padding(padding: EdgeInsets.all(tokens.spaceDefault), child: child),
        bottomNavigationBar: footer != null ? Container(
          padding: EdgeInsets.all(tokens.spaceDefault),
          decoration: BoxDecoration(
            color: tokens.colorSurfacePrimary,
            border: Border(top: BorderSide(color: tokens.colorSecondaryHover)),
          ),
          child: SafeArea(child: footer!),
        ) : null,
      );
    }

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: width,
          margin: EdgeInsets.all(tokens.spaceDefault),
          decoration: BoxDecoration(
            color: tokens.colorSurfacePrimary,
            borderRadius: BorderRadius.circular(tokens.radiusMedium),
            boxShadow: tokens.shadowLarge,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(tokens.spaceDefault),
                child: Row(
                  children: [
                    Expanded(child: Text(title, style: TextStyle(fontSize: 18, fontWeight: tokens.fontWeightBold, color: tokens.colorTextPrimary))),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: tokens.colorSecondaryHover),
              Padding(padding: EdgeInsets.all(tokens.spaceDefault), child: child),
              if (footer != null) ...[
                Divider(height: 1, color: tokens.colorSecondaryHover),
                Padding(padding: EdgeInsets.all(tokens.spaceDefault), child: footer!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}