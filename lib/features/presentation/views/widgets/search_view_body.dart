import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logandregister/features/data/my_fire_auth.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_user_data_provider.dart';
import 'package:logandregister/features/presentation/views/auth/widgets/custom_text_field.dart';
import 'package:logandregister/features/presentation/views/profile_view.dart';
import 'package:logandregister/features/presentation/views/widgets/custom_circule_indicator.dart';
import 'package:provider/provider.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      setState(
        () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getDataInstance = Provider.of<GettedUserDataProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: CustomTextField(
            hinttext: "Search",
            controller: controller,
            validator: (val) {
              return null;
            },
          ),
        ),
        FutureBuilder(
          future: MyFireAuth.storeusers
              .where("firstname", isEqualTo: controller.text)
              .get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("error !!!  ${snapshot.error.toString()}"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomCirculeIndicator();
            }
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfileView(
                              uid: snapshot.data!.docs[index]['uid'],
                            );
                          },
                        ),
                      );
                      await getDataInstance
                          .isFollowhim(snapshot.data!.docs[index]['uid']);
                      log(snapshot.data!.docs[index]['uid']);
                    },
                    title: Text(
                      "${snapshot.data!.docs[index]['firstname']} "
                      "${snapshot.data!.docs[index]['lastname']}",
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Image.asset("assets/images/images.png"),
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
