import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/ui/widgets/footer_widget.dart';
import 'package:multiplatform_solutions/ui/widgets/site_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SiteContent(key: globalKey),
      ),
      bottomNavigationBar: FooterWidget(
        loadClick: (url) => globalKey.currentState?.loadClick(url),
      ),
    );
  }
}
