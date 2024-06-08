import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logandregister/core/models/postdata_model.dart';
import 'package:logandregister/core/utils/app_colors.dart';
import 'package:logandregister/core/utils/functions/image_picker.dart';
import 'package:logandregister/features/data/my_fire_storage.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_post_data_provider.dart';
import 'package:logandregister/features/presentation/view_model/Provider/getted_user_data_provider.dart';
import 'package:logandregister/features/presentation/views/widgets/add_post_section.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class UploadViewBody extends StatefulWidget {
  const UploadViewBody({super.key});

  @override
  State<UploadViewBody> createState() => _UploadViewBodyState();
}

class _UploadViewBodyState extends State<UploadViewBody> {
  late TextEditingController textEditingController;
  var uuid = const Uuid();
  bool isLading = false;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getDataInstance = Provider.of<GettedUserDataProvider>(context);
    final getPostInstance = Provider.of<GettedPostDataProvider>(context);
    return MyImagePicker.imagePath == null
        ? UploadViewNoPost(
            onPressed: () {
              myModalSheet(context);
            },
          )
        : UploadViewPost(
            onPressed: () {
              MyImagePicker.imagePath = null;
              setState(() {});
            },
            onPressedPost: () async {
              setState(() {
                isLading = true;
              });

              String url = await MyFireStorage.getImageUrl(
                imgName: MyImagePicker.imageName!,
                imgPath: MyImagePicker.imagePath!,
              );
              String userName =
                  "${getDataInstance.gettedUserData!.firstname} ${getDataInstance.gettedUserData!.lastname}";
              await getDataInstance
                  .getPostNumber(FirebaseAuth.instance.currentUser!.uid);

              getPostInstance.addNewPost(
                PostDataModel(
                  userName,
                  textEditingController.text,
                  url,
                  DateTime.now(),
                  [],
                  uuid.v1(),
                  FirebaseAuth.instance.currentUser!.uid,
                  [],
                ),
              );

              MyImagePicker.returnToUploadView(textEditingController);
              setState(() {
                isLading = false;
              });
            },
            controller: textEditingController,
            isLoading: isLading,
          );
  }

  Future<dynamic> myModalSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    await MyImagePicker.getImageInView(
                      ImageSource.camera,
                    );
                    setState(() {});
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(width: 10),
                      Text("From camera"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    await MyImagePicker.getImageInView(
                      ImageSource.gallery,
                    );
                    setState(() {});
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.photo),
                      SizedBox(width: 10),
                      Text("From gallery"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UploadViewNoPost extends StatelessWidget {
  const UploadViewNoPost({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.upload,
            size: 50,
            color: AppColors.kCurveAppBar,
          ),
        ),
      ),
    );
  }
}

class UploadViewPost extends StatelessWidget {
  const UploadViewPost({
    super.key,
    required this.onPressed,
    required this.onPressedPost,
    required this.controller,
    required this.isLoading,
  });
  final void Function() onPressed;
  final TextEditingController controller;
  final void Function() onPressedPost;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: onPressedPost,
            child: const Text(
              "Post",
              style: TextStyle(
                color: AppColors.kBorderTextField,
                fontSize: 18,
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.kBorderTextField,
          ),
        ),
      ),
      body: Column(
        children: [
          isLoading ? const LinearProgressIndicator() : const Divider(),
          const SizedBox(height: 20),
          AddPostSection(controller: controller),
        ],
      ),
    );
  }
}
