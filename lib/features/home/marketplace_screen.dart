import 'package:flutter/material.dart';
import 'package:rexpower/features/home/components/global_bottom_nav.dart';
import 'package:rexpower/global_components/global_appbar.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalAppBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: GlobalBottomNav(),
    );
  }
}
