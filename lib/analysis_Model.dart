class Analysis {
  String overallTone;
  GenderRepresentation genderRepresentation;
  GenderBias genderBias;
  EqualityPromotion equalityPromotion;
  LanguageAnalysis languageAnalysis;
  List<String> recommendations;
  String percentagescore;

  Analysis({
    required this.overallTone,
    required this.genderRepresentation,
    required this.genderBias,
    required this.equalityPromotion,
    required this.languageAnalysis,
    required this.recommendations,
    required this.percentagescore,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) {
    return Analysis(
      overallTone: json['overall_tone'],
      genderRepresentation:
          GenderRepresentation.fromJson(json['gender_representation']),
      genderBias: GenderBias.fromJson(json['gender_bias']),
      equalityPromotion: EqualityPromotion.fromJson(json['equality_promotion']),
      languageAnalysis: LanguageAnalysis.fromJson(json['language_analysis']),
      recommendations: List<String>.from(json['recommendations']),
      percentagescore: json['Percentagescore'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'overall_tone': overallTone,
      'gender_representation': genderRepresentation.toJson(),
      'gender_bias': genderBias.toJson(),
      'equality_promotion': equalityPromotion.toJson(),
      'language_analysis': languageAnalysis.toJson(),
      'recommendations': recommendations,
      'Percentagescore': percentagescore,
    };
  }
}

class GenderRepresentation {
  GenderDetails male;
  GenderDetails female;

  GenderRepresentation({
    required this.male,
    required this.female,
  });

  factory GenderRepresentation.fromJson(Map<String, dynamic> json) {
    return GenderRepresentation(
      male: GenderDetails.fromJson(json['male']),
      female: GenderDetails.fromJson(json['female']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'male': male.toJson(),
      'female': female.toJson(),
    };
  }
}

class GenderDetails {
  List<String> characters;
  List<String> roles;
  List<String> traits;
  List<String> pronouns;

  GenderDetails({
    required this.characters,
    required this.roles,
    required this.traits,
    required this.pronouns,
  });

  factory GenderDetails.fromJson(Map<String, dynamic> json) {
    return GenderDetails(
      characters: List<String>.from(json['characters']),
      roles: List<String>.from(json['roles']),
      traits: List<String>.from(json['traits']),
      pronouns: List<String>.from(json['pronouns']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'characters': characters,
      'roles': roles,
      'traits': traits,
      'pronouns': pronouns,
    };
  }
}

class GenderBias {
  String presence;
  String impact;
  String mitigation;

  GenderBias({
    required this.presence,
    required this.impact,
    required this.mitigation,
  });

  factory GenderBias.fromJson(Map<String, dynamic> json) {
    return GenderBias(
      presence: json['presence'],
      impact: json['impact'],
      mitigation: json['mitigation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'presence': presence,
      'impact': impact,
      'mitigation': mitigation,
    };
  }
}

class EqualityPromotion {
  List<String> suggestions;

  EqualityPromotion({
    required this.suggestions,
  });

  factory EqualityPromotion.fromJson(Map<String, dynamic> json) {
    return EqualityPromotion(
      suggestions: List<String>.from(json['suggestions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'suggestions': suggestions,
    };
  }
}

class LanguageAnalysis {
  List<String> genderedTerms;
  List<String> neutralTerms;
  String analysis;

  LanguageAnalysis({
    required this.genderedTerms,
    required this.neutralTerms,
    required this.analysis,
  });

  factory LanguageAnalysis.fromJson(Map<String, dynamic> json) {
    return LanguageAnalysis(
      genderedTerms: List<String>.from(json['gendered_terms']),
      neutralTerms: List<String>.from(json['neutral_terms']),
      analysis: json['analysis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gendered_terms': genderedTerms,
      'neutral_terms': neutralTerms,
      'analysis': analysis,
    };
  }
}
