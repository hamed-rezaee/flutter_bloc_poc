import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_poc/custom_cubit/base_dependency_resolver.dart';
import 'package:flutter_bloc_poc/custom_cubit/base_entity.dart';
import 'package:flutter_bloc_poc/custom_cubit/custom_state.dart';

abstract class BaseCustomCubit<E extends BaseEntity>
    extends Cubit<CustomState> {
  BaseCustomCubit({
    required this.dependencyResolver,
    required CustomState<Equatable> initialState,
  }) : super(initialState) {
    dependencyResolver.resolve().listen(handler);
  }

  final BaseDependencyResolver<E> dependencyResolver;

  void handler(E data);
}
