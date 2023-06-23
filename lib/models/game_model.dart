import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel extends Equatable {
  @JsonKey(name: "internalName")
  String? internalName;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "metacriticLink")
  String? metacriticLink;

  @JsonKey(name: "dealID")
  String? dealID;

  @JsonKey(name: "storeID")
  String? storeID;

  @JsonKey(name: "gameID")
  String? gameID;

  @JsonKey(name: "salePrice")
  String? salePrice;

  @JsonKey(name: "normalPrice")
  String? normalPrice;

  @JsonKey(name: "isOnSale")
  String? isOnSale;

  @JsonKey(name: "savings")
  String? savings;

  @JsonKey(name: "metacriticScore")
  String? metacriticScore;

  @JsonKey(name: "steamRatingText")
  String? steamRatingText;

  @JsonKey(name: "steamRatingPercent")
  String? steamRatingPercent;

  @JsonKey(name: "steamRatingCount")
  String? steamRatingCount;

  @JsonKey(name: "steamAppID")
  String? steamAppID;

  @JsonKey(name: "releaseDate")
  int? releaseDate;
  @JsonKey(name: "lastChange")
  int? lastChange;
  @JsonKey(name: "dealRating")
  String? dealRating;
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
