import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_user_data_provider.dart';
import 'package:logandregister/features/presentation/views/home_view.dart';
import 'package:logandregister/features/presentation/views/profile_view.dart';
import 'package:logandregister/features/presentation/views/search_view.dart';
import 'package:logandregister/features/presentation/views/upload_view.dart';
import 'package:logandregister/features/presentation/views/widgets/custom_circule_indicator.dart';
import 'package:provider/provider.dart';

class MyPagesView extends StatefulWidget {
  const MyPagesView({super.key});
  static const id = "/PagesView";

  @override
  State<MyPagesView> createState() => _MyPagesViewState();
}

class _MyPagesViewState extends State<MyPagesView> {
  int currentindex = 0;
  late PageController pagecontroller;

  getDataFromDB() async {
    GettedUserDataProvider gettedProvider = Provider.of(context, listen: false);
    await gettedProvider.getUserDataFi(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  void initState() {
    pagecontroller = PageController();
    super.initState();
    getDataFromDB();
  }

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getDataInstance = Provider.of<GettedUserDataProvider>(context);
    return getDataInstance.isLoading == true
        ? const Scaffold(
            body: CustomCirculeIndicator(),
          )
        : Scaffold(
            bottomNavigationBar: CupertinoTabBar(
              currentIndex: currentindex,
              activeColor: AppColors.kCurveAppBar,
              inactiveColor: AppColors.kBorderTextField,
              onTap: (index) {
                pagecontroller.jumpToPage(index);
                currentindex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle,
                  ),
                  label: "",
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(
                //     Icons.favorite,
                //   ),
                //   label: "",
                // ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "",
                ),
              ],
            ),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pagecontroller,
              children: [
                const HomeView(),
                const SearchView(),
                const UploadView(),
                //LovelyView(),
                ProfileView(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                ),
              ],
            ),
          );
  }
}
