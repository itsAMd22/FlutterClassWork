import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool dark;
  final VoidCallback? onTap;

  const BannerCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.dark = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fg = dark ? Colors.white : Colors.black;

    return Card(
      color: dark ? Colors.black : Colors.white,
      elevation: 0,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(20),
        title: Text(
          title, 
          style: TextStyle(
            color: fg, 
            fontSize: 20, 
            fontWeight: FontWeight.w100,
          )
        ),
        subtitle: Text(
          subtitle, 
          style: TextStyle(
            color: fg.withAlpha(150)
          )
        ),

        trailing: Icon(
          Icons.arrow_outward, 
          color: fg
        ),
      ),
    );
  }
}