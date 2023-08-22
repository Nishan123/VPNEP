import 'package:flutter/material.dart';

import '../main.dart';

class VpnButton extends StatelessWidget {
  final VoidCallback onTap;
  const VpnButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          InkWell(
            onTap: () {
              onTap();
            },
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(43, 0, 60, 255)),
              child: Container(
                padding: EdgeInsets.all(38),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(88, 0, 60, 255)),
                child: Container(
                  width: mq.height * .12,
                  height: mq.height * .12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(166, 0, 60, 255)),
                  child: Center(
                    child: Icon(
                      Icons.power_settings_new_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: mq.height * .02),
         
        ],
      );
}
