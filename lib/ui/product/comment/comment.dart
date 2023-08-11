import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/data/comment.dart';

class CommentItem extends StatelessWidget {
  final CommentEntity comment;

  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: theme.dividerColor,width: 1)
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.title),
                  const SizedBox(height: 4,),
                  Text(comment.email,style: theme.textTheme.bodySmall,)
                ],
              ),
              Text(comment.date, style: theme.textTheme.bodySmall,),
            ],),
          const SizedBox(height: 12,),
          Text(comment.content)

        ],
      ),
    );
  }
}