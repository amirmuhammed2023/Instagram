import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/features/auth/presentation/views/widgets/auth_pages.dart';
import 'package:logandregister/features/auth/presentation/views/widgets/custom_switch_tile.dart';

class ClipperSection extends StatelessWidget {
  const ClipperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomClip(),
          child: Container(
            height: 275,
            color: AppColors.kBorderTextField,
          ),
        ),
        ClipPath(
          clipper: CustomClip(),
          child: Container(
            height: 250,
            color: AppColors.kCurveAppBar,
          ),
        ),
        const CustomSwitchTile(),
        const Positioned(
          bottom: 35,
          right: 15,
          child: AuthPages(),
        ),
      ],
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  final path = Path();
  @override
  Path getClip(Size size) {
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height,
      size.width * 0.5,
      size.height - 85,
    );
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height - 170,
      size.width,
      size.height - 100,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
