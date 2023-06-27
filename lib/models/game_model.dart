import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class GameModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: "internalName")
  String? internalName;
  @HiveField(1)
  @JsonKey(name: "title")
  String? title;
  @HiveField(2)
  @JsonKey(name: "metacriticLink")
  String? metacriticLink;
  @HiveField(3)
  @JsonKey(name: "dealID")
  String? dealID;
  @HiveField(4)
  @JsonKey(name: "storeID")
  String? storeID;
  @HiveField(5)
  @JsonKey(name: "gameID")
  String? gameID;
  @HiveField(6)
  @JsonKey(name: "salePrice")
  String? salePrice;
  @HiveField(7)
  @JsonKey(name: "normalPrice")
  String? normalPrice;
  @HiveField(8)
  @JsonKey(name: "isOnSale")
  String? isOnSale;
  @HiveField(9)
  @JsonKey(name: "savings")
  String? savings;
  @HiveField(10)
  @JsonKey(name: "metacriticScore")
  String? metacriticScore;
  @HiveField(11)
  @JsonKey(name: "steamRatingText")
  String? steamRatingText;
  @HiveField(12)
  @JsonKey(name: "steamRatingPercent")
  String? steamRatingPercent;
  @HiveField(13)
  @JsonKey(name: "steamRatingCount")
  String? steamRatingCount;
  @HiveField(14)
  @JsonKey(name: "steamAppID")
  String? steamAppID;
  @HiveField(15)
  @JsonKey(name: "releaseDate")
  int? releaseDate;
  @HiveField(16)
  @JsonKey(name: "lastChange")
  int? lastChange;
  @HiveField(17)
  @JsonKey(name: "dealRating")
  String? dealRating;
  @HiveField(18)
  @JsonKey(name: "thumb")
  String? thumb;

  @override
  List<Object?> get props => [
        internalName,
        title,
        metacriticLink,
        dealID,
        storeID,
        gameID,
        salePrice,
        normalPrice,
        isOnSale,
        savings,
        metacriticScore,
        steamRatingText,
        steamRatingPercent,
        steamRatingCount,
        steamAppID,
        releaseDate,
        lastChange,
        dealRating,
        thumb,
      ];

  GameModel({
    required this.internalName,
    required this.title,
    required this.metacriticLink,
    required this.dealID,
    required this.storeID,
    required this.gameID,
    required this.salePrice,
    required this.normalPrice,
    required this.isOnSale,
    required this.savings,
    required this.metacriticScore,
    required this.steamRatingText,
    required this.steamRatingPercent,
    required this.steamRatingCount,
    required this.steamAppID,
    required this.releaseDate,
    required this.lastChange,
    required this.dealRating,
    required this.thumb,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  // get state => null;

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
  // GameModel copyWith() {
  //   return GameModel(
  //    internalName:internalName,
  //     title:title,
  //    metacriticLink:metacriticLink,
  //     dealID:dealID,
  //     storeID:storeID,
  //    gameID:gameID,
  //     salePrice:salePrice,
  //     normalPrice:normalPrice,
  //     isOnSale:isOnSale,
  //     savings:savings,
  //     metacriticScore:metacriticScore,
  //     steamRatingText:steamRatingText,
  //     steamRatingPercent:steamRatingPercent,
  //     steamRatingCount:steamRatingCount,
  //     steamAppID:steamAppID,
  //     releaseDate:releaseDate,
  //     lastChange:lastChange,
  //     dealRating:dealRating,
  //     thumb:thumb,
  //   );
  // }
}
