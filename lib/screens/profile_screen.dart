import 'package:fast8_techtest/blocs/personal_info_cubit.dart';
import 'package:fast8_techtest/global_variable.dart';
import 'package:fast8_techtest/screens/personal_field_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.keyboard_arrow_left_rounded)),
        ),
        title: Text(
          "Profile",
          style: subHeaderBold,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 32,
                child: Text(
                  "M",
                  style: headerBold.copyWith(fontSize: 22, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Muhammad Iqbal",
                    style: headerBold,
                  ),
                  Text(
                    "Masuk reguler dengan email",
                    style: header,
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                context.read<PersonalInfoCubit>().getData();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PersonalFieldScreen(),
                ));
              },
              child: Ink(
                height: 68,
                width: getWidth(context),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/person.svg",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Informasi Pribadi",
                      style: header,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 68,
            width: getWidth(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/urun.svg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Other Option",
                  style: header,
                ),
              ],
            ),
          ),
          Container(
            height: 68,
            width: getWidth(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/urun.svg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Other Option",
                  style: header,
                ),
              ],
            ),
          ),
          Container(
            height: 68,
            width: getWidth(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/urun.svg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Other Option",
                  style: header,
                ),
              ],
            ),
          ),
          Container(
            height: 68,
            width: getWidth(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/urun.svg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Other Option",
                  style: header,
                ),
              ],
            ),
          ),
          Container(
            height: 68,
            width: getWidth(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/urun.svg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Other Option",
                  style: header,
                ),
              ],
            ),
          ),
          Container(
            height: 68,
            width: getWidth(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/urun.svg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Other Option",
                  style: header,
                ),
              ],
            ),
          ),
          Container(
            height: 68,
            width: getWidth(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/urun.svg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Other Option",
                  style: header,
                ),
              ],
            ),
          ),
          Container(
            height: 68,
            width: getWidth(context),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/urun.svg",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Other Option",
                  style: header,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
