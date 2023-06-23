// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      internalName: json['internalName'] as String?,
      title: json['title'] as String?,
      metacriticLink: json['metacriticLink'] as String?,
      dealID: json['dealID'] as String?,
      storeID: json['storeID'] as String?,
      gameID: json['gameID'] as String?,
      salePrice: json['salePrice'] as String?,
      normalPrice: json['normalPrice'] as String?,
      isOnSale: json['isOnSale'] as String?,
      savings: json['savings'] as String?,
      metacriticScore: json['metacriticScore'] as String?,
      steamRatingText: json['steamRatingText'] as String?,
      steamRatingPercent: json['steamRatingPercent'] as String?,
      steamRatingCount: json['steamRatingCount'] as String?,
      steamAppID: json['steamAppID'] as String?,
      releaseDate: json['releaseDate'] as int?,
      lastChange: json['lastChange'] as int?,
      dealRating: json['dealRating'] as String?,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'internalName': instance.internalName,
      'title': instance.title,
      'metacriticLink': instance.metacriticLink,
      'dealID': instance.dealID,
      'storeID': instance.storeID,
      'gameID': instance.gameID,
      'salePrice': instance.salePrice,
      'normalPrice': instance.normalPrice,
      'isOnSale': instance.isOnSale,
      'savings': instance.savings,
      'metacriticScore': instance.metacriticScore,
      'steamRatingText': instance.steamRatingText,
      'steamRatingPercent': instance.steamRatingPercent,
      'steamRatingCount': instance.steamRatingCount,
      'steamAppID': instance.steamAppID,
      'releaseDate': instance.releaseDate,
      'lastChange': instance.lastChange,
      'dealRating': instance.dealRating,
      'thumb': instance.thumb,
    };
