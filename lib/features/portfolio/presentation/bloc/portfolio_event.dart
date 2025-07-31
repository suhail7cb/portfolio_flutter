part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object> get props => [];
}

class LoadPortfolioData extends PortfolioEvent {}

class NavigateToSection extends PortfolioEvent {
  final String section;

  const NavigateToSection(this.section);

  @override
  List<Object> get props => [section];
}