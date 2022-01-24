import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/models/user.dart';
import 'package:multiplatform_solutions/ui/widgets/menu_list.dart';
import 'package:popover/popover.dart';

class UserTile extends StatefulWidget {
  final User user;
  final bool isCompact;

  const UserTile({
    Key? key,
    required this.user,
    this.isCompact = false,
  }) : super(key: key);

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget.isCompact
          ? GestureDetector(
              onTap: _profileTap,
              child: InkWell(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _avatar,
                      const SizedBox(height: 16),
                      _title,
                      const SizedBox(height: 8),
                      _subtitle,
                    ],
                  ),
                ),
              ),
            )
          : ListTile(
              onTap: _profileTap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: Theme.of(context).primaryColor,
              leading: _avatar,
              title: _title,
              subtitle: _subtitle,
            ),
    );
  }

  Widget get _avatar => CircleAvatar(
        radius: widget.isCompact ? 45 : null,
        child: ClipOval(
          child: Image.network(
            widget.user.avatar,
          ),
        ),
      );

  Widget get _title => Text(
        widget.user.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget get _subtitle => Text(
        widget.user.email,
      );

  void _profileTap() {
    if (widget.isCompact) {
      showPopover(
        context: context,
        transitionDuration: const Duration(milliseconds: 150),
        bodyBuilder: (context) => const MenuList(),
        onPop: () => print('Popover was popped!'),
        direction: PopoverDirection.top,
        width: 400,
        height: 260,
        arrowHeight: 15,
        arrowWidth: 30,
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: const MenuList(),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      );
    }
  }
}
