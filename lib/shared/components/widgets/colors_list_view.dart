import 'package:flutter/material.dart';

class ColorsItemsBuilder extends StatefulWidget {
  ColorsItemsBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<ColorsItemsBuilder> createState() => _ColorsItemsBuilderState();
  int currentIndex = 0;
  List<Color>colorList=[
    Color(0xff698269),
    Color(0xffB99B6B),
    Color(0xffF1DBBF),
    Color(0xffAA5656),
    Color(0xffABC270),
    Color(0xffFEC868),
    Color(0xffB5F1CC),
    Color(0xffFCC2FC),
    Color(0xffF8C4B4),
    Color(0xffE5EBB2),

  ];

}

class _ColorsItemsBuilderState extends State<ColorsItemsBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
        itemCount: widget.colorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                widget.currentIndex = index;
                setState(() {});
              },
              child: ColorList(

                isActive: widget.currentIndex == index,
                color: widget.colorList[index],
              ));
        },
      ),
    );
  }
}






class ColorList extends StatefulWidget {
   ColorList({Key? key, required this.isActive, required this.color}) : super(key: key);

  @override
  State<ColorList> createState() => _ColorListState();
  final bool isActive;
  final Color color;
}

class _ColorListState extends State<ColorList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: widget.isActive
          ?  CircleAvatar(
              radius: 30,
              backgroundColor: widget.color,
              child: CircleAvatar(
                backgroundColor: widget.color,
                radius: 23,
              ),
            )
          :  CircleAvatar(
              backgroundColor: widget.color,
              radius: 25,
            ),
    );
  }
}
