import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_configuration.freezed.dart';

@freezed
sealed class PageConfiguration with _$PageConfiguration {
  const factory PageConfiguration.addStory() = AddStoryPageConfiguration;
  const factory PageConfiguration.detailStory({String? storyId}) =
      DetailStoryPageConfiguration;
  const factory PageConfiguration.home() = HomePageConfiguration;
  const factory PageConfiguration.login() = LoginPageConfiguration;
  const factory PageConfiguration.register() = RegisterPageConfiguration;
  const factory PageConfiguration.splash() = SplashPageConfiguration;
  const factory PageConfiguration.unknown() = UnknownPageConfiguration;
}
