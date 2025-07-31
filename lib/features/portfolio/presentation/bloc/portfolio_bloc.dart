import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/features/portfolio/domain/usecases/get_portfolio_data.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetPortfolioData getPortfolioData;

  PortfolioBloc(this.getPortfolioData) : super(PortfolioInitial()) {
    on<LoadPortfolioData>(_onLoadPortfolioData);
    on<NavigateToSection>(_onNavigateToSection);
  }

  Future<void> _onLoadPortfolioData(
      LoadPortfolioData event,
      Emitter<PortfolioState> emit,
      ) async {
    try {
      emit(PortfolioLoading());
      final portfolioData = await getPortfolioData();
      emit(PortfolioLoaded(portfolioData));
    } catch (e) {
      emit(PortfolioError(e.toString()));
    }
  }

  void _onNavigateToSection(
      NavigateToSection event,
      Emitter<PortfolioState> emit,
      ) {
    if (state is PortfolioLoaded) {
      final currentState = state as PortfolioLoaded;
      emit(currentState.copyWith(activeSection: event.section));
    }
  }
}