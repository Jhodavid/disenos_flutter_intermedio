part of 'ui_bloc.dart';

class UiState extends Equatable {

  final double currentPage;

  const UiState({
    this.currentPage = 0
  });

  UiState copyWith({
    double? currentPage
  }) => UiState(
    currentPage: currentPage ?? this.currentPage
  );
  
  @override
  List<Object> get props => [ currentPage ];
}
