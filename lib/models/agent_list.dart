class AgentList {

  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final dynamic characterTags;
  final String displayIcon;
  final String displayIconSmall;
  final String bustPortrait;
  final String fullPortrait;
  final String killfeedPortrait;
  final String assetPath;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final dynamic role;
  final dynamic abilities;
  final dynamic voiceLine;

  AgentList({

    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    required this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    required this.bustPortrait,
    required this.fullPortrait,
    required this.killfeedPortrait,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    required this.role,
    required this.abilities,
    required this.voiceLine,
  });

  factory AgentList.fromJson(Map<dynamic, dynamic> json) {
    return AgentList(

        uuid: json['uuid'],
        displayName: json['displayName'],
        description: json['description'],
        developerName: json['developerName'],
        characterTags: json['characterTags'],
        displayIcon: json['displayIcon'],
        displayIconSmall: json['displayIconSmall'],
        bustPortrait: json['bustPortrait'],
        fullPortrait: json['fullPortrait'],
        killfeedPortrait: json['killfeedPortrait'],
        assetPath: json['assetPath'],
        isPlayableCharacter: json['isPlayableCharacter'],
        isFullPortraitRightFacing: json['isFullPortraitRightFacing'],
        isAvailableForTest: json['isAvailableForTest'],
        isBaseContent: json['isBaseContent'],
        role: json['role'],
        abilities: json['abilities'],
        voiceLine: json['voiceLine'],
    );
  }
}
