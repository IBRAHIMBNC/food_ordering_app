import 'package:flutter/material.dart';
import 'package:getx_part2/widgets/SmallText.dart';

class ItemDescription extends StatefulWidget {
  final String text;

  const ItemDescription({Key? key, required this.text}) : super(key: key);

  @override
  _ItemDescriptionState createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  bool isExpanded = false;
  late String firstHalf;

  late String secondHalf;

  @override
  void initState() {
    if (widget.text.length > 220) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(201, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: secondHalf.isEmpty
          ? Text(firstHalf,
              style: const TextStyle(height: 1.5, color: Colors.black45))
          : Column(
              children: [
                Text(
                  !isExpanded ? firstHalf + '...' : firstHalf + secondHalf,
                  style: const TextStyle(height: 1.5, color: Colors.black45),
                ),
                if (widget.text.length > 220)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: !isExpanded ? 'See more' : 'See less',
                          color: Colors.blue,
                        ),
                        Icon(
                            !isExpanded ? Icons.expand_more : Icons.expand_less,
                            color: Colors.blue)
                      ],
                    ),
                  )
              ],
            ),
    );
  }
}
