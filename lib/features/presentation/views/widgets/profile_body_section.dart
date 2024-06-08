import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/features/data/my_fire_storage.dart';
import 'package:logandregister/features/presentation/views/widgets/custom_circule_indicator.dart';
import 'package:logandregister/features/presentation/views/widgets/profile_post_image.dart';

class ProfileBodySection extends StatelessWidget {
  const ProfileBodySection({super.key, required this.currentUid});
  final String currentUid;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MyFireStorage.storePosts
          .where('emailUid', isEqualTo: currentUid)
          .get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> futureSnapshot) {
        if (futureSnapshot.hasError) {
          return Center(
            child: Text("error !!!  ${futureSnapshot.error.toString()}"),
          );
        }
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return const CustomCirculeIndicator();
        }
        var data = futureSnapshot.data!.docs;
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
              crossAxisCount: 2,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ProfilePostImage(
                imgLink: data[index]['imgLink'],
              );
            },
          ),
        );
      },
    );
  }
}
