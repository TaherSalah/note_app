import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){},
          child: Container(
            height: 47,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.05),

            ),
            child:const Icon(Icons.search),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            height: 47,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.05),

            ),
            child:const Icon(Icons.dark_mode_rounded),
          ),
        ),
      ],
    );
  }
}
