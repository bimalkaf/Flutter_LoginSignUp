import 'package:flutter/material.dart';

class SocialAuthentication extends StatelessWidget {
  const SocialAuthentication(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final Widget icon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24.0),
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Row(
              children: [
                Container(child: icon),
                const SizedBox(width: 8),
                Text(title,
                    style: const TextStyle(
                      fontSize: 16,
                    ))
              ],
            ),
          ),
        ));
  }
}
