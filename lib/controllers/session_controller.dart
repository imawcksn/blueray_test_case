import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authTimerProvider = StateNotifierProvider<AuthTimerNotifier, bool>(
  (ref) => AuthTimerNotifier(),
);

class AuthTimerNotifier extends StateNotifier<bool> {
  Timer? _logoutTimer;

  AuthTimerNotifier() : super(false);

  void startTimer(String expiryDateStr, void Function() onLogout) {
    final expiryDate = DateTime.parse(expiryDateStr);
    final now = DateTime.now();

    if (expiryDate.isAfter(now)) {
      final durationUntilExpiry = expiryDate.difference(now);

      _logoutTimer?.cancel();
      _logoutTimer = Timer(durationUntilExpiry, () {
        onLogout();
        state = true;
      });
    } else {
      onLogout();
      state = true;
    }
  }

  void stopTimer() {
    _logoutTimer?.cancel();
  }
}
