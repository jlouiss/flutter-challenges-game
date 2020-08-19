import 'package:game/story.dart';

class StoryBrain {
  int _currentStoryIndex = 0;
  List<Story> _storyData = [];

  StoryBrain(List<Story> storyData) {
    _storyData = storyData;
  }

  String getStoryTitle() {
    return _storyData[_currentStoryIndex].title;
  }

  String getOption1() {
    return _storyData[_currentStoryIndex].option1;
  }

  String getOption2() {
    return _storyData[_currentStoryIndex].option2;
  }

  void nextStory(int userChoice) {
    _currentStoryIndex = _getNextStoryIndex(userChoice);
  }

  /// Flow:
  /// - S0
  ///   - 1 => S2
  ///   - 2 => S1
  /// - S1
  ///   - 1 => S2
  ///   - 2 => S3
  /// - S2
  ///   - 1 => S5
  ///   - 2 => S4
  /// TODO: allow customization
  int _getNextStoryIndex(int userChoice) {
    switch (_currentStoryIndex) {
      case 0:
        return userChoice == 1 ? 2 : 1;
      case 1:
        return userChoice == 1 ? 2 : 3;
      case 2:
        return userChoice == 1 ? 5 : 4;
      case 3:
      case 4:
      case 5:
      default:
        return 0;
    }
  }

  void restart() {
    _currentStoryIndex = 0;
  }

  // TODO: allow customization
  bool shouldButtonBeVisible(int optionNumber) {
    if (optionNumber == 1) {
      return _storyData[_currentStoryIndex].option1 != '';
    } else {
      return _storyData[_currentStoryIndex].option2 != '';
    }
  }
}
