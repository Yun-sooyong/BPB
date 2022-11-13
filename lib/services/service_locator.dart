import 'package:business_phone_book/services/call_and_message_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

void setUpLocator() {
  locator.registerSingleton(CallAndMessageService());
}
