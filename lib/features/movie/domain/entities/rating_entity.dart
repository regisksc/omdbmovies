import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  final String source;
  final String value;

  RatingEntity({
    required this.source,
    required this.value,
  });
  @override
  List<Object?> get props => [
        source,
        value,
      ];
}
