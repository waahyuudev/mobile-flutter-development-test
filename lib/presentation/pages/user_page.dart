import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_development_test/presentation/bloc/city_bloc.dart';
import 'package:mobile_development_test/presentation/bloc/city_event.dart';
import 'package:mobile_development_test/presentation/bloc/city_state.dart';
import 'package:mobile_development_test/presentation/bloc/user_bloc.dart';
import 'package:mobile_development_test/presentation/bloc/user_event.dart';
import 'package:mobile_development_test/presentation/bloc/user_state.dart';
import 'package:mobile_development_test/presentation/pages/add_user_page.dart';

import '../../domain/entities/user.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  Widget listCategory() {
    return BlocBuilder<CityBloc, CityState>(builder: (context, state) {
      return (state is CityHasData)
          ? Container(
              margin: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              height: 40,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.city.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<UserBloc>().add(OnUserChangedByCity(state.city[index].name));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 115,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Colors.black),
                          color: const Color(0XFFFFFFFF)),
                      child: Center(
                        child: Text(
                          state.city[index].name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container();
    });
  }

  Widget searchBar(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Row(
          children: [
            SvgPicture.asset("assets/ic_search.svg"),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: TextFormField(
              onChanged: (name) {
                context.read<UserBloc>().add(OnUserChanged(name));
              },
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 16, color: Color(0XFF0D0846)),
              decoration: const InputDecoration.collapsed(
                  hintText: 'Search here',
                  hintStyle: TextStyle(fontSize: 16, color: Color(0XFF0D0846))),
            )),
          ],
        ),
      ),
    );
  }

  Widget itemUser(User user) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Nama",
              ),
              const Spacer(),
              Text(user.name),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Alamat",
              ),
              const Spacer(),
              Text(
                user.address,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Email",
              ),
              const Spacer(),
              Text(
                user.email,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Telepon",
              ),
              const Spacer(),
              Text(
                user.phoneNumber,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Kota",
              ),
              const Spacer(),
              Text(
                user.city,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget listUser() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Expanded(
          child: (state is UserHasData)
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.user.length,
                  itemBuilder: (BuildContext context, int index) {
                    return itemUser(state.user[index]);
                  })
              : const Center(child: Text("User not found"),));
    });
  }

  Widget buttonAddUser(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddUserPage()));
        },
        style: TextButton.styleFrom(
            backgroundColor: const Color(0XFF0D0846),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: const Text(
          'Add User',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(const OnUserChanged(""));
    context.read<CityBloc>().add(OnCityFind());
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [searchBar(context), listCategory(), listUser(), buttonAddUser(context)],
              ))),
    );
  }
}
