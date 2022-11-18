part of 'ui_bloc.dart';

abstract class UiEvent extends Equatable {
  const UiEvent();

  @override
  List<Object> get props => [];
}

class SetCurrentPage extends UiEvent {
  final double currentPage;

  const SetCurrentPage({
    required this.currentPage
  });
}