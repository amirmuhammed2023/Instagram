import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentTileSection extends StatelessWidget {
  const CommentTileSection({super.key, required this.currentComment});
  final Map<String, dynamic> currentComment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${currentComment['userdata']['firstname']} ${currentComment['userdata']['lastname']}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                DateFormat.yMd().format(
                  currentComment['publisheddate'].toDate(),
                ),
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              )
            ],
          ),
        ),
        subtitle: Text(currentComment['commentmessage']),
        trailing: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        leading: CircleAvatar(
          radius: 26,
          child: Image.asset("assets/images/images.png"),
        ),
      ),
    );
  }
}
