import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio_flutter/features/portfolio/data/datasources/portfolio_data_source.dart';
import 'package:portfolio_flutter/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:portfolio_flutter/features/portfolio/domain/usecases/get_portfolio_data.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:portfolio_flutter/features/portfolio/repositories/portfolio_repository_impl.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // Data Sources
  getIt.registerLazySingleton<PortfolioDataSource>(
        () => PortfolioDataSourceImpl(),
  );

  // Repositories
  getIt.registerLazySingleton<PortfolioRepository>(
        () => PortfolioRepositoryImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetPortfolioData(getIt()));

  // BLoCs
  getIt.registerFactory(() => PortfolioBloc(getIt()));
}