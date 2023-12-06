import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:signup_user/applicatoin/signup_user/signup_user_bloc.dart';
import 'package:signup_user/models/user.dart';

class UserTile extends StatelessWidget {
  final void Function(BuildContext)? deleteOnPressed;
  final void Function(BuildContext)? editOnPressed;
  final String title;
  final String subtitle;

  const UserTile({
    super.key,
    required this.subtitle,
    required this.title,
    required this.deleteOnPressed,
    required this.editOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          // delete butotn
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: deleteOnPressed,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade800,
          ),

          // edit button
          SlidableAction(
            borderRadius: BorderRadius.circular(12),
            onPressed: editOnPressed,
            icon: Icons.settings,
            backgroundColor: Colors.black,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(
            Icons.person,
            color: Colors.grey[800],
            size: 40,
          ),
        ),
      ),
    );
  }
}
