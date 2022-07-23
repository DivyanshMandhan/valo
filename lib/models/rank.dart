class Rank {
  String? uuid;
  String? assetObjectName;
  List<Tiers>? tiers;
  String? assetPath;

  Rank({this.uuid, this.assetObjectName, this.tiers, this.assetPath});

  Rank.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    assetObjectName = json['assetObjectName'];
    if (json['tiers'] != null) {
      tiers = <Tiers>[];
      json['tiers'].forEach((v) {
        tiers!.add(Tiers.fromJson(v));
      });
    }
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['assetObjectName'] = assetObjectName;
    if (tiers != null) {
      data['tiers'] = tiers!.map((v) => v.toJson()).toList();
    }
    data['assetPath'] = assetPath;
    return data;
  }
}

class Tiers {
  int? tier;
  String? tierName;
  String? division;
  String? divisionName;
  String? color;
  String? backgroundColor;
  String? smallIcon;
  String? largeIcon;
  String? rankTriangleDownIcon;
  String? rankTriangleUpIcon;

  Tiers(
      {this.tier,
      this.tierName,
      this.division,
      this.divisionName,
      this.color,
      this.backgroundColor,
      this.smallIcon,
      this.largeIcon,
      this.rankTriangleDownIcon,
      this.rankTriangleUpIcon});

  Tiers.fromJson(Map<String, dynamic> json) {
    tier = json['tier'];
    tierName = json['tierName'];
    division = json['division'];
    divisionName = json['divisionName'];
    color = json['color'];
    backgroundColor = json['backgroundColor'];
    smallIcon = json['smallIcon'];
    largeIcon = json['largeIcon'];
    rankTriangleDownIcon = json['rankTriangleDownIcon'];
    rankTriangleUpIcon = json['rankTriangleUpIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tier'] = tier;
    data['tierName'] = tierName;
    data['division'] = division;
    data['divisionName'] = divisionName;
    data['color'] = color;
    data['backgroundColor'] = backgroundColor;
    data['smallIcon'] = smallIcon;
    data['largeIcon'] = largeIcon;
    data['rankTriangleDownIcon'] = rankTriangleDownIcon;
    data['rankTriangleUpIcon'] = rankTriangleUpIcon;
    return data;
  }
}
