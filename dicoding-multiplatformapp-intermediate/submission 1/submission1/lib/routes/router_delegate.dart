import 'package:flutter/material.dart';
import 'package:submission1/core/model/page_configuration.dart';
import 'package:submission1/core/repository/auth_repository.dart';
import 'package:submission1/screen/auth/login_screen.dart';
import 'package:submission1/screen/auth/register_screen.dart';
import 'package:submission1/screen/splash_screen.dart';
import 'package:submission1/screen/story/add_story_screen.dart';
import 'package:submission1/screen/story/story_detail_screen.dart';
import 'package:submission1/screen/story/story_list_screen.dart';
import 'package:submission1/screen/unknown_screen.dart';

class MyRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthRepository authRepository;

  bool? isUnknown;

  String? selectedQuote;

  List<Page> historyStack = [];

  bool? isLoggedIn;

  bool isRegister = false;
  bool isAddStory = false;

  MyRouterDelegate(this.authRepository)
    : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }
  @override
  PageConfiguration? get currentConfiguration {
    if (isLoggedIn == null) {
      return SplashPageConfiguration();
    } else if (isRegister == true) {
      return RegisterPageConfiguration();
    } else if (isLoggedIn == false) {
      return LoginPageConfiguration();
    } else if (isUnknown == true) {
      return UnknownPageConfiguration();
    } else if (selectedQuote == null) {
      return HomePageConfiguration();
    } else if (isAddStory == true) {
      return AddStoryPageConfiguration();
    } else if (selectedQuote != null) {
      return DetailStoryPageConfiguration(selectedQuote!);
    } else {
      return null;
    }
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  List<Page> get _loggedInStack => [
    MaterialPage(
      key: const ValueKey("StoriesListPage"),
      child: (StoryList(
        onTapped: (String storyId) {
          selectedQuote = storyId;
          notifyListeners();
        },
        onAddStory: () {
          isAddStory = true;
          notifyListeners();
        },
        onLogout: () async {
          isLoggedIn = false;
          await authRepository.logout();
          await authRepository.clearToken();
          notifyListeners();
        },
      )),
    ),
    if (isAddStory == true)
      MaterialPage(
        key: const ValueKey("CreateStory"),
        child: (AddStoryScreen(
          onSuccessUpload: () {
            isAddStory = false;
            notifyListeners();
          },
        )),
      ),
    if (selectedQuote != null)
      MaterialPage(
        key: ValueKey(selectedQuote),
        child: StoryDetailScreen(
          storyId: selectedQuote!,
          onLogout: () async {
            isLoggedIn = false;
            await authRepository.logout();
            await authRepository.clearToken();
            notifyListeners();
          },
        ),
      ),
  ];

  List<Page> get _loggedOutStack => [
    MaterialPage(
      key: const ValueKey("LoginPage"),
      child: LoginScreen(
        onLogin: () {
          isLoggedIn = true;
          notifyListeners();
        },
        onRegister: () {
          isRegister = true;
          notifyListeners();
        },
      ),
    ),
    if (isRegister == true)
      MaterialPage(
        key: const ValueKey("RegisterPage"),
        child: RegisterScreen(
          onRegister: () {
            isRegister = false;
            notifyListeners();
          },
          onLogin: () {
            isRegister = false;
            notifyListeners();
          },
        ),
      ),
  ];

  List<Page> get _splashStack => const [
    MaterialPage(key: ValueKey("SplashScreen"), child: SplashScreen()),
  ];

  List<Page> get _unknownStack => const [
    MaterialPage(key: ValueKey("UnknownPage"), child: UnknownScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    if (isUnknown == true) {
      historyStack = _unknownStack;
    } else if (isLoggedIn == null) {
      historyStack = _splashStack;
    } else if (isLoggedIn == true) {
      historyStack = _loggedInStack;
    } else {
      historyStack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onDidRemovePage: (page) {
        if (page.key == ValueKey(selectedQuote)) {
          selectedQuote = null;
          notifyListeners();
        }
        if (isRegister) {
          isRegister = false;
          notifyListeners();
        }
        if (isAddStory) {
          isAddStory = false;
          notifyListeners();
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    switch (configuration) {
      case UnknownPageConfiguration():
        isUnknown = true;
        isRegister = false;
        isAddStory = false;
        break;
      case RegisterPageConfiguration():
        isAddStory = false;
        isRegister = true;
        break;
      case HomePageConfiguration() ||
          LoginPageConfiguration() ||
          SplashPageConfiguration():
        isUnknown = false;
        selectedQuote = null;
        isRegister = false;
        isAddStory = false;
        break;
      case AddStoryPageConfiguration():
        isUnknown = false;
        selectedQuote = null;
        isRegister = false;
        isAddStory = true;
        break;
      case DetailStoryPageConfiguration():
        isUnknown = false;
        isRegister = false;
        isAddStory = false;
        selectedQuote = configuration.storyId.toString();
        break;
    }

    notifyListeners();
  }

  _init() async {
    isLoggedIn = await authRepository.isLoggedIn();
    notifyListeners();
  }
}
