import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';

abstract class PortfolioRepository {
  Future<PortfolioData> getPortfolioData();
}