import 'package:flutter/material.dart';
import '../models/profile_setup_model.dart';
import '../../../core/app_export.dart';

part 'profile_setup_state.dart';

final profileSetupNotifier =
    StateNotifierProvider.autoDispose<ProfileSetupNotifier, ProfileSetupState>(
  (ref) => ProfileSetupNotifier(
    ProfileSetupState(
      profileSetupModel: ProfileSetupModel(),
    ),
  ),
);

class ProfileSetupNotifier extends StateNotifier<ProfileSetupState> {
  ProfileSetupNotifier(ProfileSetupState state) : super(state) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
      introductionController: TextEditingController(),
    );
  }

  void updateIntroductionText(String text) {
    state = state.copyWith(
      profileSetupModel: state.profileSetupModel?.copyWith(
        introductionText: text,
      ),
    );
  }

  @override
  void dispose() {
    state.introductionController?.dispose();
    super.dispose();
  }
}
