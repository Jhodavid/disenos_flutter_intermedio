
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super( const UiState()) {
    on<UiEvent>((event, emit) {
      emit( state.copyWith( currentPage: 0 ) );
    });

    on<SetCurrentPage>( ( (event, emit) => emit( state.copyWith( currentPage: event.currentPage ) ) ) );

  }

  
  void setCurrentPage( double index ) {
    add( SetCurrentPage(currentPage: index) );
  }
}

