import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/features/portfolio/domain/repositories/portfolio_repository.dart';

class GetPortfolioData {
  final PortfolioRepository repository;

  GetPortfolioData(this.repository);

  Future<PortfolioData> call() async {
    return await repository.getPortfolioData();
  }
}