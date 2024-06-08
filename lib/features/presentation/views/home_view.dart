import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logandregister/core/models/postdata_model.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/features/data/my_fire_auth.dart';
import 'package:logandregister/features/data/my_fire_storage.dart';
import 'package:logandregister/features/presentation/views/auth/login_view.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/custom_snackbar.dart';
import 'package:logandregister/features/presentation/views/widgets/custom_circule_indicator.dart';
import 'package:logandregister/features/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final myfireauth = MyFireAuth();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            "assets/images/instagram.svg",
            width: MediaQuery.sizeOf(context).width * 0.35,
            height: MediaQuery.sizeOf(context).height * 0.056,
            // ignore: deprecated_member_use
            color: AppColors.kBorderTextField,
          ),
          actions: [
            const Icon(
              Icons.messenger_outline,
              color: AppColors.kBorderTextField,
              size: 28,
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                myfireauth.logoutemail(
                  context: context,
                  gotopage: LoginView.id,
                );
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.kBorderTextField,
                size: 28,
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
        body: StreamBuilder(
          stream: MyFireStorage.storePosts.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            var data = streamSnapshot.data?.docs;

            if (streamSnapshot.hasError) {
              return const CustomErrorSnackbar(
                  errmessage: "Error has done in data");
            }
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return const CustomCirculeIndicator();
            }
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (ctx, index) {
                return HomeViewBody(
                  commentsNumber: data![index]['postComments'].length,
                  postInformation: PostDataModel(
                    data[index]['username'],
                    data[index]['description'],
                    data[index]['imgLink'],
                    data[index]['date'].toDate(),
                    data[index]['likes'],
                    data[index]['uid'],
                    data[index]['emailUid'],
                    [],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
