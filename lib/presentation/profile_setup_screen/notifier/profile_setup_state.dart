part of 'profile_setup_notifier.dart';

class ProfileSetupState extends Equatable {
  final TextEditingController? introductionController;
  final ProfileSetupModel? profileSetupModel;

  const ProfileSetupState({
    this.introductionController,
    this.profileSetupModel,
  });

  @override
  List<Object?> get props => [
        introductionController,
        profileSetupModel,
      ];

  ProfileSetupState copyWith({
    TextEditingController? introductionController,
    ProfileSetupModel? profileSetupModel,
  }) {
    return ProfileSetupState(
      introductionController:
          introductionController ?? this.introductionController,
      profileSetupModel: profileSetupModel ?? this.profileSetupModel,
    );
  }
}
