import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const String kAppName = 'Rountiner';
const String kDotEnvFileName = '.env';
const String kDotEnvExampleFilename = '.env.example';


const String kMainUsersTopic = 'all_users';
const String kMainAndroidChannelId = 'main_channel';
const String kMainAndroidNotificationIcon = '@mipmap/ic_launcher';

const kMainAndroidChannel = AndroidNotificationChannel(
  kMainAndroidChannelId,
  'Main Channel',
  description: 'Основной канал уведомлений для Android',
  importance: Importance.max,

);


