import 'package:flutter/material.dart';

class GlobalAppBar extends StatefulWidget {
  const GlobalAppBar({super.key});

  @override
  State<GlobalAppBar> createState() => _GlobalAppBarState();
}

class _GlobalAppBarState extends State<GlobalAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
            //
            ),
      ),
      title: const Text('RexPower'),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notifications_active))
      ],
    );
  }
}
