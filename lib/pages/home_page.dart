import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signup_user/components/my_textfield.dart';
import 'package:signup_user/components/user_tile.dart';
import 'package:signup_user/models/user.dart';

import '../applicatoin/signup_user/signup_user_bloc.dart';
import '../components/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newUserNameEditingController = TextEditingController();
  final newUserAgeEditingController = TextEditingController();

  void editUserProcess() {
    final editNameController = TextEditingController();
    final editAgeController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // name edit text field
              MyTextField(
                hintText: 'new name',
                controller: editNameController,
                labelText: 'Name',
                keyboardType: TextInputType.name,
              ),

              // age edit text field
              MyTextField(
                hintText: 'new age',
                controller: editAgeController,
                labelText: 'Age',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              // save button
              MyButton(
                title: 'Save',
                onTap: () {
                  // save process

                  // exit dialog
                  Navigator.pop(context);
                  editAgeController.clear();
                  editNameController.clear();
                },
              ),

              const SizedBox(width: 10),

              // cancel button
              MyButton(
                title: 'Cancel',
                onTap: () {
                  // cancel process + exit dialog
                  Navigator.pop(context);
                  editAgeController.clear();
                  editNameController.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          'Signup User',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // name text field
            MyTextField(
              hintText: 'Enter User\'s Name',
              controller: newUserNameEditingController,
              labelText: 'Name',
              keyboardType: TextInputType.name,
            ),

            // age text field
            MyTextField(
              hintText: 'Enter User\'s Age',
              controller: newUserAgeEditingController,
              labelText: 'Age',
              keyboardType: TextInputType.number,
            ),

            // add user button
            MyButton(
              onTap: () {
                context.read<SignupUserBloc>().add(
                      AddUserEvent(
                        user: User(
                          age: newUserAgeEditingController.text,
                          name: newUserNameEditingController.text,
                        ),
                      ),
                    );

                newUserAgeEditingController.clear();
                newUserNameEditingController.clear();
              },
              title: 'Add User',
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Divider(
                height: 10,
                color: Colors.grey[500],
              ),
            ),

            // list of usesrs
            Expanded(
              child: BlocBuilder<SignupUserBloc, SignupUserState>(
                builder: (context, state) {
                  if (state is SignupUserLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey[900],
                      ),
                    );
                  }
                  if (state is SignupUserLoaded) {
                    return ListView.builder(
                      itemCount: state.user.length,
                      itemBuilder: (context, index) => UserTile(
                        subtitle: state.user[index].age,
                        title: state.user[index].name,
                        deleteOnPressed: (p0) {
                          context
                              .read<SignupUserBloc>()
                              .add(RemoveUserEvent(user: userList[index]));
                        },
                        editOnPressed: (p0) {
                          editUserProcess();
                        },
                      ),
                    );
                  }
                  return Center(
                    child: Text(
                      'You shold Add an user',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
