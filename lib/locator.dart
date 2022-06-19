import 'package:get_it/get_it.dart';
import 'package:redhopper_app/core/services/auth_service.dart';
import 'package:redhopper_app/core/services/event_service.dart';
import 'package:redhopper_app/core/services/user_profile_service.dart';

final locator = GetIt.instance;

void locatorsetup() {
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService());
  locator.registerLazySingleton<UserProfileService>(() => UserProfileService());
  locator.registerLazySingleton<EventService>(() => EventService());
}
