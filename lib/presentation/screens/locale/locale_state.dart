import 'package:equatable/equatable.dart';

class LocaleState extends Equatable {
  final bool isVietnamese;

  const LocaleState({this.isVietnamese = false});

  LocaleState copyWith({bool? isVietnamese}) {
    return LocaleState(isVietnamese: isVietnamese ?? this.isVietnamese);
  }

  @override
  List<Object?> get props => [isVietnamese];
}
