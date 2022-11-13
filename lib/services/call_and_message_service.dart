import 'package:url_launcher/url_launcher.dart';

class CallAndMessageService {
  // void call(String number) => launchUrl(
  //       Uri(scheme: 'tel', path: number),
  //     );
  // void sendSms(String number) => launchUrl(
  //       Uri(scheme: 'sms', path: number),
  //     );
  // void sendEmail(String emailto) => launchUrl(
  //       Uri(scheme: 'mailto', path: emailto),
  //     );
  // void call(String number) => launch('tel:$number');
  // void sendSms(String number) => launch('sms:$number');
  // void sendEmail(String emailto) => launch('mailto:$emailto');

  // Future<void> launchUrl(Uri url) async {
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Future<void> call(String number) async {
  //   Uri url = Uri(scheme: 'tel', path: '01051869646');
  //   if (await canLaunchUrl(url)) {
  //     launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Future<void> sendSms(String number) async {
  //   Uri url = Uri(scheme: 'sms', path: number);
  //   if (await canLaunchUrl(url)) {
  //     launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Future<void> sendEmail(String number) async {
  //   Uri url = Uri(scheme: 'tel', path: number);
  //   if (await canLaunchUrl(url)) {
  //     launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future<void> launch(String scheme, String number) async {
    Uri url = Uri(scheme: scheme, path: number);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
