

import 'package:cygnus/data/db/entity/app_user.dart';
import 'package:cygnus/data/provider/user_provider.dart';
import 'package:cygnus/ui/screens/matched_screen.dart';
import 'package:cygnus/util/LanguageChangeProvider.dart';
import 'package:cygnus/util/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:cygnus/hook/scr/profiles.dart';

class MatchEngine extends ChangeNotifier {
  final List<DateMatch>? _matches;
  int _currentMatchIndex=0;
  int _nextMatchIndex=0;
  AppUser? user;
  MatchEngine({
    List<DateMatch>? matches,user
  }) : _matches = matches {
    _currentMatchIndex = 0;
    _nextMatchIndex = 1;
  }

  DateMatch get currentMatch => _matches![_currentMatchIndex];
  DateMatch get nextMatch => _matches![_nextMatchIndex];

  void cycleMatch() {
    if (currentMatch.decision != Decision.undecided) {
      currentMatch.resetMatch();
      //_matches!.removeAt(_currentMatchIndex-1);
      _currentMatchIndex = _nextMatchIndex;
      _nextMatchIndex =
          _nextMatchIndex < _matches!.length - 1 ? _nextMatchIndex + 1 : 0;

      notifyListeners();
    }


  }
}

class DateMatch extends ChangeNotifier {
  final Profile profile;
  Decision decision = Decision.undecided;
  List<String?> _ignoreSwipeIds=<String>[];

  bool _isLoading = false;
  AppUser? user=new AppUser(profilePhotoPath: "",id:"1",name: "",age: 0);
  Future<AppUser?>? appUser;
  LanguageChangeProvider? appLanguage ;
  DateMatch({required this.profile,required this.user});
  void like() {
    if (decision == Decision.undecided) {
      decision = Decision.like;
      notifyListeners();
    }
  }

  void nope() {
    if (decision == Decision.undecided) {
      decision = Decision.nope;

      notifyListeners();
    }
  }

  void superLike() {
    if (decision == Decision.undecided) {
      decision = Decision.superLike;
      notifyListeners();
    }
  }

  void resetMatch() {
    if (decision != Decision.undecided) {
      decision = Decision.undecided;
      notifyListeners();
    }
  }





}

enum Decision {
  undecided,
  nope,
  like,
  superLike,
}
