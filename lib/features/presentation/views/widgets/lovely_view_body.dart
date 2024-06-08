// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:logandregister/features/data/my_fire_storage.dart';
// import 'package:logandregister/features/presentation/views/widgets/custom_circule_indicator.dart';
// import 'package:logandregister/features/presentation/views/widgets/profile_post_image.dart';

// class LovelyViewBody extends StatelessWidget {
//   const LovelyViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: MyFireStorage.storePosts
//           .where(FirebaseAuth.instance.currentUser!.uid,
//               isEqualTo: "likes[${FirebaseAuth.instance.currentUser!.uid}]")
//           .get(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> futureSnapshot) {
//         if (futureSnapshot.hasError) {
//           return Center(
//             child: Text("error !!!  ${futureSnapshot.error.toString()}"),
//           );
//         }
//         if (futureSnapshot.connectionState == ConnectionState.waiting) {
//           return CustomCirculeIndicator();
//         }
//         var data = futureSnapshot.data!.docs;

//         return Expanded(
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 3 / 2,
//               crossAxisCount: 2,
//             ),
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return ProfilePostImage(
//                 imgLink: data[index]['imgLink'],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
