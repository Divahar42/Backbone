
import 'package:backbone/menu/permission.dart';
import 'package:backbone/menu/update.dart';
import 'package:flutter/material.dart';

import '../utils/gradient_icon.dart';
import '../utils/gradient_text.dart';

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          backgroundColor: Color(0xff000000),
          title: Text('Settings', style: TextStyle(color:Color(0xffFFFFFF))),
          iconTheme: IconThemeData(color:Color(0xffFFFFFF)),
          actions: [Image(image: AssetImage("assets/whatsapp.png"))],
        ),
        body: ListView(
          children: [
            ListTile(
              leading: GradientIcon(child: Icon(Icons.system_update,color: Colors.white,)),
              title:GradientText(text: "Update",fontSize: 14,),
              trailing: GradientIcon(child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,))
              ,             onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => update()));
            },
            ),
            Divider(
              color:  Color(0xffDEAB3D),
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading:GradientIcon(child: Icon(Icons.settings_suggest_rounded,color: Colors.white,)),
              title: GradientText(text: "Permission",fontSize: 14,),
              trailing: GradientIcon(child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PermissionsScreen()));
              },
            ),
            Divider(
              color:  Color(0xffDEAB3D),
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: GradientIcon(child: Icon(Icons.credit_card_off_outlined,color: Colors.white,)),
              title: GradientText(text: "Delete User Data",fontSize: 14,),
              trailing: GradientIcon(child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),
              onTap: () {
                // Delete user data logic
              },
            ),
            Divider(
              color:  Color(0xffDEAB3D),
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}