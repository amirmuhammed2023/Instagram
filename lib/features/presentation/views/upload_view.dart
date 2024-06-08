import 'package:flutter/material.dart';
import 'package:logandregister/features/presentation/views/widgets/upload_view_body.dart';

class UploadView extends StatelessWidget {
  const UploadView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: UploadViewBody(),
    );
  }
}
