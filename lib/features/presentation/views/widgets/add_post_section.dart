import 'package:flutter/material.dart';
import 'package:logandregister/core/utils/functions/image_picker.dart';

class AddPostSection extends StatelessWidget {
  const AddPostSection({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          child: Image.asset("assets/images/images.png"),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.35,
          child: TextField(
            controller: controller,
            maxLines: 8,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Write any thing in post .....",
            ),
          ),
        ),
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(MyImagePicker.imagePath!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
