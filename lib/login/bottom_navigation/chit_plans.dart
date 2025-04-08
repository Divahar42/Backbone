import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/bottom_navigation/notification_screen.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class My_Chit_Plans extends StatefulWidget {
  const My_Chit_Plans({super.key});

  @override
  State<My_Chit_Plans> createState() => _My_Chit_PlansState();
}

class _My_Chit_PlansState extends State<My_Chit_Plans> {

  final List<Map<String, dynamic>> chitPlans = [
    {"title": "₹ 1,00,000","member":"20","month":"20"},
    {"title": "₹ 2,00,000","member":"20","month":"20"},
    {"title": "₹ 5,00,000","member":"20","month":"20"},
    {"title": "₹ 10,00,000","member":"20","month":"20"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 24.sp,)),
        title: Text("Chit Plans",style: GoogleFonts.inriaSans(fontSize: 16.sp,color: Colors.white),),
        actions: [
          ActionButton(url: AppImages().bellIcon, onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Screen()));
          }),
        ],
      ),
      body: SafeArea(child: Column(children: [
        SizedBox(height:50.h,width: 360.w,
          child: GradientContainer(child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(width: 10.w,),
            GradientText(text: "Chit value",fontSize: 14.sp,),
              SizedBox(width: 30.w,),
              GradientText(text: "Members",fontSize: 14.sp,),
              SizedBox(width: 20.w,),
              GradientText(text: "Months",fontSize: 14.sp,),
              SizedBox(width: 20.w,),
              GradientText(text: "download",fontSize: 14.sp,),
          ],)),
        ),
        Expanded(child: ListView.builder(
            itemCount: chitPlans.length,
            itemBuilder: (context, index){
            return Container(height: 60.h,width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xffADADAD),width: 1.w))
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10.w,),
                  Text(chitPlans[index]["title"],style: GoogleFonts.inriaSans(fontSize: 14.sp,color: Colors.white),),
                  SizedBox(width: 69.w,),
                  Text(chitPlans[index]["member"],style: GoogleFonts.inriaSans(fontSize: 14.sp,color: Colors.white),),
                  SizedBox(width: 60.w,),
                  Text(chitPlans[index]["month"],style: GoogleFonts.inriaSans(fontSize: 14.sp,color: Colors.white),),
                  SizedBox(width: 50.w,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.file_download_outlined,size: 24.sp,color: Colors.white,))
                ],
              ),
            );
            })),
      ],)),
    );
  }
}
