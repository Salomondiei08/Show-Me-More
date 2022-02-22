import 'package:flutter/material.dart';
import 'package:show_me_more/helpers/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themes/app_colors.dart' as color;

import 'package:share_plus/share_plus.dart';

import 'info_list_item.dart';

class InfoList extends StatelessWidget {
  const InfoList({
    Key? key,
  }) : super(key: key);




void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}




  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.kcGrayColor,
      margin: const EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.white70, width: 1),
      ),
      child: Column(
        children:  [
          InfoListItem(
            text: 'See Source Code',
            icon: Icons.ac_unit,
            isFirst: true,
            onPressed: () => _launchURL(githubUrl),
          ),
          InfoListItem(
            text: 'Twitter',
            icon: Icons.ac_unit,
            onPressed: () => _launchURL(twitterUrl),
          ),
          InfoListItem(
            text: 'Need Help ?',
            icon: Icons.help_outline,
            onPressed: () => _launchURL(helpUrl),
          ),
          InfoListItem(
            text: 'Share the app',
            icon: Icons.share,
            onPressed: () => {
              Share.share(shareText, subject: 'Download ShowMe More !')
            },
          ),
          InfoListItem(
            text: 'Rate the app...',
            icon: Icons.play_arrow,
            isLast: true,
            onPressed: () => _launchURL(playStoreUrl),
          ),
        ],
      ),
    );
  }
}
