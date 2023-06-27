// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameModelAdapter extends TypeAdapter<GameModel> {
  @override
  final int typeId = 0;

  @override
  GameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameModel(
      internalName: fields[0] as String?,
      title: fields[1] as String?,
      metacriticLink: fields[2] as String?,
      dealID: fields[3] as String?,
      storeID: fields[4] as String?,
      gameID: fields[5] as String?,
      salePrice: fields[6] as String?,
      normalPrice: fields[7] as String?,
      isOnSale: fields[8] as String?,
      savings: fields[9] as String?,
      metacriticScore: fields[10] as String?,
      steamRatingText: fields[11] as String?,
      steamRatingPercent: fields[12] as String?,
      steamRatingCount: fields[13] as String?,
      steamAppID: fields[14] as String?,
      releaseDate: fields[15] as int?,
      lastChange: fields[16] as int?,
      dealRating: fields[17] as String?,
      thumb: fields[18] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GameModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.internalName)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.metacriticLink)
      ..writeByte(3)
      ..write(obj.dealID)
      ..writeByte(4)
      ..write(obj.storeID)
      ..writeByte(5)
      ..write(obj.gameID)
      ..writeByte(6)
      ..write(obj.salePrice)
      ..writeByte(7)
      ..write(obj.normalPrice)
      ..writeByte(8)
      ..write(obj.isOnSale)
      ..writeByte(9)
      ..write(obj.savings)
      ..writeByte(10)
      ..write(obj.metacriticScore)
      ..writeByte(11)
      ..write(obj.steamRatingText)
      ..writeByte(12)
      ..write(obj.steamRatingPercent)
      ..writeByte(13)
      ..write(obj.steamRatingCount)
      ..writeByte(14)
      ..write(obj.steamAppID)
      ..writeByte(15)
      ..write(obj.releaseDate)
      ..writeByte(16)
      ..write(obj.lastChange)
      ..writeByte(17)
      ..write(obj.dealRating)
      ..writeByte(18)
      ..write(obj.thumb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
