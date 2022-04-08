import 'package:flutter/material.dart';
import 'package:flutter_fundamental_chapter_51_60/model/user.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          boxShadow: [
            BoxShadow(
              color: Color(0x55000000),
              offset: Offset(1, 1),
              blurRadius: 7,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.blueGrey,
          )),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: NetworkImage(user.avatar))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID : ${user.id}',
                style: GoogleFonts.poppins(),
              ),
              Text(
                'Nama : ${user.firstName} ${user.lastName}',
                style: GoogleFonts.poppins(),
              ),
              Text(
                'Email : ${user.email}',
                style: GoogleFonts.poppins(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
