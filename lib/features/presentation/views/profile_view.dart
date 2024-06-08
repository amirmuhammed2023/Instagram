import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_user_data_provider.dart';
import 'package:logandregister/features/presentation/views/widgets/custom_circule_indicator.dart';
import 'package:logandregister/features/presentation/views/widgets/profile_view_body.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.uid});
  final String uid;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  getUserFromDB() async {
    GettedUserDataProvider gettedProvider = Provider.of(context, listen: false);
    await gettedProvider.getUserDataFi(widget.uid);
  }

  @override
  void initState() {
    super.initState();
    getUserFromDB();
  }

  @override
  Widget build(BuildContext context) {
    final getDataInstance = Provider.of<GettedUserDataProvider>(context);
    return getDataInstance.isLoading == true
        ? const Scaffold(
            body: CustomCirculeIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "${getDataInstance.gettedUserData!.firstname} ${getDataInstance.gettedUserData!.lastname}",
                  style: const TextStyle(
                    color: AppColors.kBorderTextField,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              body: ProfileViewBody(currentUid: widget.uid),
            ),
          );
  }
}
