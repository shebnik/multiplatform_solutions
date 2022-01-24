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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SiteContent(key: globalKey)),
            FooterWidget(
              loadClick: (url) => globalKey.currentState?.loadClick(url),
            ),
          ],
        ),
      ),
    );
  }
}
