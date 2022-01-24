import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/models/user.dart';
import 'package:multiplatform_solutions/ui/widgets/adaptive_widget.dart';
import 'package:multiplatform_solutions/ui/widgets/user_tile.dart';

class HomePage extends StatefulWidget {
  final List<User> users;
  const HomePage({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<User> users;

  @override
  void initState() {
    super.initState();
    users = widget.users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveWidget(
          wide: wideUsersView(),
          narrow: narrowUsersView(),
        ),
      ),
    );
  }

  Widget wideUsersView() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Adaptive App',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Scrollbar(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) => SizedBox(
                height: 50,
                child: UserTile(
                  user: users[index],
                  isCompact: true,
                ),
              ),
            ),
          ),
          flex: 5,
        ),
      ],
    );
  }

  Widget narrowUsersView() {
    return Scrollbar(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => UserTile(
          user: users[index],
        ),
      ),
    );
  }
}
