import 'package:flutter/material.dart';

class UserAvatarWithName extends StatelessWidget {
  final String username;
  final String name;

  UserAvatarWithName({
    required this.username,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue, // Change the background color as needed
          child: Text(
            name.isNotEmpty ? name[0].toUpperCase() : '',
            style: TextStyle(
              color: Colors.white, // Change the text color as needed
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          radius: 30,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
