import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_development_test/data/models/user_model.dart';
import 'package:mobile_development_test/presentation/bloc/user_bloc.dart';
import 'package:mobile_development_test/presentation/bloc/user_event.dart';
import 'package:mobile_development_test/presentation/bloc/user_state.dart';
import 'package:mobile_development_test/text_controller.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  Widget nameInput() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Name",
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: nameController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Your name',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addressInput() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Address",
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: addressController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Your address',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget emailInput() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: emailController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Your email',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget phoneNumberInput() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Phone Number",
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: phoneNumberController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Your phone number',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cityInput() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "City",
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: cityController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Your city',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonSubmit(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {

      if (state is UserSuccessAdded) {

        Future.microtask(() {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            title: "Success",
            desc: "User has been added",
            btnOkOnPress: () {
              nameController.clear();
              addressController.clear();
              emailController.clear();
              phoneNumberController.clear();
              cityController.clear();
              context.read<UserBloc>().add(const OnUserChanged(""));
              Navigator.pop(context);
            },
          ).show();
        });
      }

      return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            final userModel = UserModel(name: nameController.text, address: addressController.text, email: emailController.text, phoneNumber: phoneNumberController.text, city: cityController.text, id: "");
            context.read<UserBloc>().add(OnUserAdded(userModel));
          },
          style: TextButton.styleFrom(
              backgroundColor: const Color(0XFF0D0846),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: (state is UserLoading)
              ? const CircularProgressIndicator(color: Colors.white,)
              : const Text(
            'SUBMIT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add User"),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        // iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              nameInput(),
              addressInput(),
              emailInput(),
              phoneNumberInput(),
              cityInput(),
              buttonSubmit(context)
            ],
          ),
        ),
      ),
    );
  }
}
