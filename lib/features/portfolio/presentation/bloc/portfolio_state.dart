part of 'portfolio_bloc.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final PortfolioData portfolioData;
  final String activeSection;

  const PortfolioLoaded(this.portfolioData, {this.activeSection = 'home'});

  PortfolioLoaded copyWith({
    PortfolioData? portfolioData,
    String? activeSection,
  }) {
    return PortfolioLoaded(
      portfolioData ?? this.portfolioData,
      activeSection: activeSection ?? this.activeSection,
    );
  }

  @override
  List<Object> get props => [portfolioData, activeSection];
}

class PortfolioError extends PortfolioState {
  final String message;

  const PortfolioError(this.message);

  @override
  List<Object> get props => [message];
}