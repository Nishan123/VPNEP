import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/location_screen.dart';

class HomeCardTemp extends StatelessWidget {
  final String title;
  final Widget icon;
  const HomeCardTemp({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (_) => LocationScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: mq.width * .03),
        width: mq.width,
        height: mq.height * .06,
        decoration: BoxDecoration(color: Color.fromARGB(183, 100, 92, 156),
        borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 15),
            Text('Server', style: TextStyle(fontSize: 17,color: Colors.white),),
            Spacer(),
            icon,
            SizedBox(width: 10,),
            Text(
              title,
              style: TextStyle(fontSize: 16,color: Colors.white),
            ),
            Icon(
              Icons.keyboard_arrow_right_outlined,
              size: 40,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
