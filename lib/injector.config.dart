// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mint/core/routes/app_router.dart' as _i885;
import 'package:mint/features/training/data/datasources/local/training_local_datasource.dart'
    as _i231;
import 'package:mint/features/training/data/repositories/training_repository_impl.dart'
    as _i10;
import 'package:mint/features/training/domain/repositories/training_repository.dart'
    as _i169;
import 'package:mint/features/training/domain/usecases/get_training_usecase.dart'
    as _i473;
import 'package:mint/features/training/presentation/blocs/training_cubit.dart'
    as _i682;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i885.AppRouter>(() => _i885.AppRouter());
    gh.lazySingleton<_i231.TrainingDataSource>(
      () => _i231.TrainingLocalDatasource(),
    );
    gh.lazySingleton<_i169.TrainingRepository>(
      () => _i10.TrainingRepositoryImpl(
        dataSource: gh<_i231.TrainingDataSource>(),
      ),
    );
    gh.lazySingleton<_i473.GetTrainingUseCase>(
      () => _i473.GetTrainingUseCase(gh<_i169.TrainingRepository>()),
    );
    gh.singleton<_i682.TrainingCubit>(
      () => _i682.TrainingCubit(
        getTrainingUseCase: gh<_i473.GetTrainingUseCase>(),
      ),
    );
    return this;
  }
}
