import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Model/pageview_model.dart';
import '../widget/category_page_view.dart';
import 'login_screen.dart';
class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int x = 0;
  final controller = PageController();

  final List<PageViewModel> info = const [
    PageViewModel(
        image:'assets/undraw_Hamburger_re_7sfy.png',
        subtitle:
        'Get All your loved foods in one once Place,you Just place the orer we do the reset',
        text: 'All Your favorites'),
    PageViewModel(
        image:'assets/undraw_Cooking_p7m1.png',
        subtitle:
        'Get All your loved foods in one once  Place,you Just place the orer we do the reset',
        text: 'Order from Choose chef '),
    PageViewModel(
        image: 'assets/undraw_takeout_boxes_ap54.png',
        subtitle:
        'Get All your loved foods in one once  Place,you Just place the orer we do the reset',
        text: 'free delivery offers'),
  ];
  int ck = 0;
  void getChanges(int value) {
    setState(() {
      if (value == info.length - 1) {
        ck = 1;
      } else
        ck = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return  const LoginScreen() ;
              },
            ));
          },
          child: Text(
            'Skip',
            style:
            TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 20),
          ),
        )
      ]),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 530,
                child: PageView.builder(
                  physics: const  BouncingScrollPhysics(),
                  onPageChanged: getChanges,
                  controller: controller,
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    return CategoryPageView(pageViewModel: info[index],);
                  },
                )),

            SmoothPageIndicator(
              controller: controller,
              count: info.length,
              axisDirection: Axis.horizontal,
              effect: const  WormEffect(
                  spacing: 3.0,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 1,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.orange),
            ),

          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50, right: 137),
        child: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            if (ck == 0) {
              controller.nextPage(
                  duration: const  Duration(milliseconds: 500), curve: Curves.linear);
            } else {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen() ;

                },
              ), (route) => false);
            }
            // SizedBox(height: 50 ,);
          },
          child: const  Icon(Icons.arrow_forward_ios),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}