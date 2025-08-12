import '../../../core/app_export.dart';

/// This class is used in the [ProfileSetupScreen] screen.

// ignore_for_file: must_be_immutable
class ProfileSetupModel extends Equatable {
  ProfileSetupModel({
    this.profileImage,
    this.introductionText,
    this.profileName,
    this.farmName,
  }) {
    profileImage = profileImage ?? '';
    introductionText = introductionText ?? '';
    profileName = profileName ?? '[Dein Name]';
    farmName = farmName ?? 'Hofname oder Rolle';
  }

  String? profileImage;
  String? introductionText;
  String? profileName;
  String? farmName;

  ProfileSetupModel copyWith({
    String? profileImage,
    String? introductionText,
    String? profileName,
    String? farmName,
  }) {
    return ProfileSetupModel(
      profileImage: profileImage ?? this.profileImage,
      introductionText: introductionText ?? this.introductionText,
      profileName: profileName ?? this.profileName,
      farmName: farmName ?? this.farmName,
    );
  }

  @override
  List<Object?> get props => [
        profileImage,
        introductionText,
        profileName,
        farmName,
      ];
}
