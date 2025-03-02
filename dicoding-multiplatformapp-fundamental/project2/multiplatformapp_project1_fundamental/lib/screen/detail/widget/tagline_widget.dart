import 'package:flutter/material.dart';

class TaglineWidget extends StatefulWidget {
  final IconData icon;
  final String tagName;

  const TaglineWidget({
    super.key,
    required this.icon,
    required this.tagName,
  });

  @override
  TaglineWidgetState createState() => TaglineWidgetState();
}

class TaglineWidgetState extends State<TaglineWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon, size: 15),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            widget.tagName,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
