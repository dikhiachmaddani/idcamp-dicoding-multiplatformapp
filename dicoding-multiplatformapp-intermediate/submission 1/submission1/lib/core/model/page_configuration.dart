final class AddStoryPageConfiguration extends PageConfiguration {}

final class DetailStoryPageConfiguration extends PageConfiguration {
  final String? storyId;

  DetailStoryPageConfiguration(this.storyId);
}

final class HomePageConfiguration extends PageConfiguration {}

final class LoginPageConfiguration extends PageConfiguration {}

sealed class PageConfiguration {}

final class RegisterPageConfiguration extends PageConfiguration {}

final class SplashPageConfiguration extends PageConfiguration {}

final class UnknownPageConfiguration extends PageConfiguration {}
