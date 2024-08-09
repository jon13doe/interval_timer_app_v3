import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDialogWindow extends StatelessWidget {
  final String text;
  final String? email;

  const CustomDialogWindow({
    super.key,
    required this.text,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      content: SizedBox(
        width: 0.8 * MediaQuery.of(context).size.width,
        child: RichText(
          text: TextSpan(
            text: text,
            style: textTheme.bodyMedium,
            children: <TextSpan>[
              if (email != null)
                TextSpan(
                  text: ' $email',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.amber,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchEmail('$email', context);
                    },
                ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'close',
              style: textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }

  _launchEmail(String email, BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailLaunchUri.toString() as Uri)) {
      await launchUrl(emailLaunchUri.toString() as Uri);
    } else {
      throw 'Could not launch email';
    }
  }
}
