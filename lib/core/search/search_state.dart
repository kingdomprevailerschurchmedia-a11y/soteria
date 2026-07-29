import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

enum SearchCategory { question, course, player, tournament, help }

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required String id,
    required String title,
    String? subtitle,
    required SearchCategory category,
    required IconData icon,
  }) = _SearchResult;

  const SearchResult._();
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default([]) List<SearchResult> results,
    @Default([]) List<String> history,
    @Default(false) bool isLoading,
    @Default(false) bool isOverlayVisible,
  }) = _SearchState;
  
  const SearchState._();
}
