import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        SizedBox(height: 16, width: 16),
        MenuItem(icon: Icons.person, text: 'VIEW PROFILE'),
        Divider(color: Colors.black),
        MenuItem(icon: Icons.people_sharp, text: 'FRIENDS'),
        Divider(color: Colors.black),
        MenuItem(icon: Icons.report, text: 'REPORT'),
        SizedBox(height: 8, width: 8),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped $text');
        Navigator.of(context).pop();
      },
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
              ),
              const SizedBox(width: 16),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
