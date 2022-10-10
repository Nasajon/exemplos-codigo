abstract class SearchEvent {}

class SearchByTextEvent implements SearchEvent {
  final searchText;

  SearchByTextEvent({
    required this.searchText,
  });
}
