import 'index.dart';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class FFChatPreview extends StatelessWidget {
  const FFChatPreview({
    Key? key,
    required this.lastChatText,
    required this.lastChatTime,
    required this.seen,
    required this.title,
    required this.userProfilePic,
    required this.onTap,
    // Theme settings
    required this.color,
    required this.unreadColor,
    required this.titleTextStyle,
    required this.dateTextStyle,
    required this.previewTextStyle,
    this.contentPadding = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  final String lastChatText;
  final DateTime? lastChatTime;
  final bool seen;
  final String title;
  final String userProfilePic;
  final Function() onTap;

  final Color color;
  final Color unreadColor;
  final TextStyle titleTextStyle;
  final TextStyle dateTextStyle;
  final TextStyle previewTextStyle;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final chatTitle = title.isNotEmpty ? title : 'Friend';
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: ListTile(
              tileColor: color,
              contentPadding: contentPadding,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 0.0, end: 8.0),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: seen ? Colors.transparent : unreadColor,
                      ),
                    ),
                  ),
                  AvatarContainer(
                    user: ChatUser(avatar: userProfilePic),
                    avatarMaxSize: 30.0,
                    constraints: BoxConstraints(
                      maxHeight: 420.0,
                      maxWidth: 420.0,
                    ),
                  ),
                ],
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(chatTitle, style: titleTextStyle),
                    ),
                    Text(formattedDate(lastChatTime), style: dateTextStyle),
                  ],
                ),
              ),
              subtitle: Text(
                lastChatText,
                style: previewTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: previewTextStyle.color,
              ),
            ),
          ),
          const SizedBox(height: 2.0),
        ],
      ),
    );
  }
}

String formattedDate(DateTime? dateTime) {
  if (dateTime == null) {
    return 'Unknown';
  }
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final day = DateTime(dateTime.year, dateTime.month, dateTime.day);
  if (dateTime.isAfter(now.subtract(const Duration(minutes: 30)))) {
    return timeago.format(dateTime);
  }
  if (today == day) {
    return DateFormat.jm().format(dateTime);
  }
  if (yesterday == day) {
    return 'Yesterday';
  }
  return DateFormat.MMMMd().format(dateTime);
}
