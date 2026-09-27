import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String path) async {
  if (!await launchUrl(Uri.parse(path))) {
    throw Exception('Could not launch $path');
  }
}
