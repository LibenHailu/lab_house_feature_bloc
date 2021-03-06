import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class House extends Equatable {
  House({
    this.id,
    @required this.title,
    @required this.description,
    @required this.bedrooms,
    @required this.bathrooms,
    @required this.cost,
    @required this.street,
    @required this.city,
    @required this.location,
    this.status,
    @required this.category,
    @required this.userId,
    @required this.asset,
  });

  final String id;
  final String title;
  final String description;
  final int bedrooms;
  final int bathrooms;
  final String cost;
  final String street;
  final String city;
  final String location;
  final String status;
  final String category;
  final String userId;
  final dynamic asset;

  @override
  List<Object> get props => [
    id,
    title,
    description,
    bedrooms,
    bathrooms,
    cost,
    street,
    city,
    location,
    status,
    category,
    userId,
    asset
  ];

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      cost: json['cost'],
      street: json['street'],
      city: json['city'],
      location: json['location'],
      status: json['status'],
      category: json['category'],
      userId: json['userId'],
      asset:json['asset'],
    );
  }

  @override
  String toString() =>
      'House { id: $id, title: $title, description:$description, bedrooms:$bedrooms,bathrooms:$bathrooms, cost:$cost street:$street city:$city location:$location categoty: $category, status: $status }';
}
