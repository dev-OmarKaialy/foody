import 'package:equatable/equatable.dart';

class GenericItemModel<T> extends Equatable {
  final int quantity;

  final T model;
  const GenericItemModel({
    this.quantity = 0,
    required this.model,
  });

  @override
  List<Object?> get props => [model, quantity];

  GenericItemModel<T> increaseQuantity() =>
      GenericItemModel(model: model, quantity: quantity + 1);
  GenericItemModel<T> decreaseQuantity() =>
      GenericItemModel(model: model, quantity: quantity - 1);
}
