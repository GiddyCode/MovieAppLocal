import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:movie/models/tvdetail.dart';

import 'action.dart';
import 'state.dart';

Effect<SeasonState> buildEffect() {
  return combineEffects(<Object, Effect<SeasonState>>{
    SeasonAction.action: _onAction,
    SeasonAction.cellTapped: _cellTapped,
  });
}

void _onAction(Action action, Context<SeasonState> ctx) {}

void _cellTapped(Action action, Context<SeasonState> ctx) async {
  final Season _season = action.payload;
  if (_season == null) return;
  await Navigator.of(ctx.context).pushNamed('seasondetailpage', arguments: {
    'tvid': ctx.state.tvid,
    'seasonNumber': _season.seasonNumber,
    'name': _season.name,
    'posterpic': _season.posterPath
  });
}
