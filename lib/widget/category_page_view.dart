import 'package:flutter/cupertino.dart';

import '../Model/pageview_model.dart';

class CategoryPageView extends StatelessWidget {
  const CategoryPageView({super.key, required this.pageViewModel});
  final PageViewModel pageViewModel ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              pageViewModel.text,
              style:const  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily:'pacifico',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child:  Container(
              child: Text(
                pageViewModel.subtitle,
                style: const TextStyle(
                  color:Color(0x7B000000),
                  fontSize: 16,

                ),
              ),
            ),
          ),
          const  SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              pageViewModel.image,
              fit: BoxFit.fill,
              width: 600,
              height: 400,
            ),
          )
        ],
      ),
    );
  }
}