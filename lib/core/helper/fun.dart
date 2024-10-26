import 'package:ambulance/core/app_string.dart';
import 'package:url_launcher/url_launcher.dart';

//Intent To Url Path
Future<void> launchURL({required String url}) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchTell() async {
  if (await canLaunchUrl(Uri.parse(AppString.telUrl))) {
    await launchUrl(Uri.parse(AppString.telUrl));
  } else {
    throw 'Could not launch ${AppString.telUrl}';
  }
}

// check Is value == PhoneNumber
bool isValidPhoneNumber(String? value) =>
    RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
        .hasMatch(value ?? '');
