import 'package:backbone/walk%20through/page1.dart';
import 'package:backbone/walk%20through/page2.dart';
import 'package:backbone/walk%20through/page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';


class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final PageController _controller =
  PageController(); // Page controller for the walkthrough
  int activeIndex = 0;

  get page => null; // To track the active page


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> walkthrough = [
      Walkthrough1(
        height: size.height * 0.4,
        width: size.width * 0.8,
      ),
      Walkthrough2(
        height: size.height * 0.4,
        width: size.width * 0.8,
      ),
      Walkthrough3(
        height: size.height * 0.4,
        width: size.width * 0.8,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.2),
          SizedBox(
            height: size.height * 0.5,
            width: size.width * 0.8,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  activeIndex = index;
                });
              },
              itemCount: walkthrough.length,
              itemBuilder: (context, index) {
                return walkthrough[index];
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildIndicator(walkthrough.length)],
          ),
          SizedBox(height: size.height * 0.1),
          Padding(
            padding: EdgeInsets.only(bottom: 100,left: 50),
            child: SizedBox(height: 44,width: 300,
              child: GradientColoredButton(
                onTap: () {
    if (activeIndex < walkthrough.length - 1) {
    _controller.nextPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
    );
    } else {
     page.introPage(context);
    }
    },
                child: FlutterCustomText(
                  text: 'NEXT',
                  color: AppColors().blackColor,
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(int count) => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: count,
    effect:  ExpandingDotsEffect(
      spacing: 5,
      strokeWidth: 0, // Removed for clean appearance
      dotHeight: 10,
      dotWidth: 10,

      dotColor: Color(0xffDEAB3D),
      activeDotColor: Color(0xffDEAB3D),
    ),
  );
}