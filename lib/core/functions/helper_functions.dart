// create function to launch url
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future <void>customLaunch(context,String url)async{
   Uri uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  }else{
    // show snackbar with error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Could not launch $url'),
      ),
    );

  }
}