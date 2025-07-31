import 'package:portfolio_flutter/features/portfolio/data/datasources/portfolio_data_source.dart';
import 'package:portfolio_flutter/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:portfolio_flutter/features/portfolio/domain/repositories/portfolio_repository.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioDataSource dataSource;

  PortfolioRepositoryImpl(this.dataSource);

  @override
  Future<PortfolioData> getPortfolioData() async {
    return await dataSource.getPortfolioData();
  }
}