class MovieDetails {
  MovieDetails({
    bool? adult,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    num? budget,
    List<Genres>? genres,
    String? homepage,
    num? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    List<ProductionCompanies>? productionCompanies,
    List<ProductionCountries>? productionCountries,
    String? releaseDate,
    num? revenue,
    num? runtime,
    List<SpokenLanguages>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _belongsToCollection = belongsToCollection;
    _budget = budget;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _imdbId = imdbId;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _releaseDate = releaseDate;
    _revenue = revenue;
    _runtime = runtime;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  MovieDetails.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'] as bool?;
    _backdropPath = json['backdrop_path'] as String?;
    _belongsToCollection = json['belongs_to_collection'] != null
        ? BelongsToCollection.fromJson(
            json['belongs_to_collection'] as Map<String, dynamic>,
          )
        : null;
    _budget = json['budget'] as num?;
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v as Map<String, dynamic>));
      });
    }
    _homepage = json['homepage'] as String?;
    _id = json['id'] as num?;
    _imdbId = json['imdb_id'] as String?;
    _originalLanguage = json['original_language'] as String?;
    _originalTitle = json['original_title'] as String?;
    _overview = json['overview'] as String?;
    _popularity = json['popularity'] as num?;
    _posterPath = json['poster_path'] as String?;
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies
            ?.add(ProductionCompanies.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries
            ?.add(ProductionCountries.fromJson(v as Map<String, dynamic>));
      });
    }
    _releaseDate = json['release_date'] as String?;
    _revenue = json['revenue'] as num?;
    _runtime = json['runtime'] as num?;
    if (json['spoken_languages'] != null) {
      _spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        _spokenLanguages
            ?.add(SpokenLanguages.fromJson(v as Map<String, dynamic>));
      });
    }
    _status = json['status'] as String?;
    _tagline = json['tagline'] as String?;
    _title = json['title'] as String?;
    _video = json['video'] as bool?;
    _voteAverage = json['vote_average'] as num?;
    _voteCount = json['vote_count'] as num?;
  }

  bool? _adult;
  String? _backdropPath;
  BelongsToCollection? _belongsToCollection;
  num? _budget;
  List<Genres>? _genres;
  String? _homepage;
  num? _id;
  String? _imdbId;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  List<ProductionCompanies>? _productionCompanies;
  List<ProductionCountries>? _productionCountries;
  String? _releaseDate;
  num? _revenue;
  num? _runtime;
  List<SpokenLanguages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _title;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;

  MovieDetails copyWith({
    bool? adult,
    String? backdropPath,
    BelongsToCollection? belongsToCollection,
    num? budget,
    List<Genres>? genres,
    String? homepage,
    num? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    List<ProductionCompanies>? productionCompanies,
    List<ProductionCountries>? productionCountries,
    String? releaseDate,
    num? revenue,
    num? runtime,
    List<SpokenLanguages>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) =>
      MovieDetails(
        adult: adult ?? _adult,
        backdropPath: backdropPath ?? _backdropPath,
        belongsToCollection: belongsToCollection ?? _belongsToCollection,
        budget: budget ?? _budget,
        genres: genres ?? _genres,
        homepage: homepage ?? _homepage,
        id: id ?? _id,
        imdbId: imdbId ?? _imdbId,
        originalLanguage: originalLanguage ?? _originalLanguage,
        originalTitle: originalTitle ?? _originalTitle,
        overview: overview ?? _overview,
        popularity: popularity ?? _popularity,
        posterPath: posterPath ?? _posterPath,
        productionCompanies: productionCompanies ?? _productionCompanies,
        productionCountries: productionCountries ?? _productionCountries,
        releaseDate: releaseDate ?? _releaseDate,
        revenue: revenue ?? _revenue,
        runtime: runtime ?? _runtime,
        spokenLanguages: spokenLanguages ?? _spokenLanguages,
        status: status ?? _status,
        tagline: tagline ?? _tagline,
        title: title ?? _title,
        video: video ?? _video,
        voteAverage: voteAverage ?? _voteAverage,
        voteCount: voteCount ?? _voteCount,
      );

  bool? get adult => _adult;

  String? get backdropPath => _backdropPath;

  BelongsToCollection? get belongsToCollection => _belongsToCollection;

  num? get budget => _budget;

  List<Genres>? get genres => _genres;

  String? get homepage => _homepage;

  num? get id => _id;

  String? get imdbId => _imdbId;

  String? get originalLanguage => _originalLanguage;

  String? get originalTitle => _originalTitle;

  String? get overview => _overview;

  num? get popularity => _popularity;

  String? get posterPath => _posterPath;

  List<ProductionCompanies>? get productionCompanies => _productionCompanies;

  List<ProductionCountries>? get productionCountries => _productionCountries;

  String? get releaseDate => _releaseDate;

  num? get revenue => _revenue;

  num? get runtime => _runtime;

  List<SpokenLanguages>? get spokenLanguages => _spokenLanguages;

  String? get status => _status;

  String? get tagline => _tagline;

  String? get title => _title;

  bool? get video => _video;

  num? get voteAverage => _voteAverage;

  num? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    if (_belongsToCollection != null) {
      map['belongs_to_collection'] = _belongsToCollection?.toJson();
    }
    map['budget'] = _budget;
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['imdb_id'] = _imdbId;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    if (_productionCompanies != null) {
      map['production_companies'] =
          _productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map['production_countries'] =
          _productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = _releaseDate;
    map['revenue'] = _revenue;
    map['runtime'] = _runtime;
    if (_spokenLanguages != null) {
      map['spoken_languages'] =
          _spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;

    return map;
  }
}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {
  SpokenLanguages({
    String? englishName,
    String? iso6391,
    String? name,
  }) {
    _englishName = englishName;
    _iso6391 = iso6391;
    _name = name;
  }

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    _englishName = json['english_name'] as String?;
    _iso6391 = json['iso_639_1'] as String?;
    _name = json['name'] as String?;
  }

  String? _englishName;
  String? _iso6391;
  String? _name;

  SpokenLanguages copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) =>
      SpokenLanguages(
        englishName: englishName ?? _englishName,
        iso6391: iso6391 ?? _iso6391,
        name: name ?? _name,
      );

  String? get englishName => _englishName;

  String? get iso6391 => _iso6391;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = _englishName;
    map['iso_639_1'] = _iso6391;
    map['name'] = _name;

    return map;
  }
}

/// iso_3166_1 : "US"
/// name : "United States of America"

class ProductionCountries {
  ProductionCountries({
    String? iso31661,
    String? name,
  }) {
    _iso31661 = iso31661;
    _name = name;
  }

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    _iso31661 = json['iso_3166_1'] as String?;
    _name = json['name'] as String?;
  }

  String? _iso31661;
  String? _name;

  ProductionCountries copyWith({
    String? iso31661,
    String? name,
  }) =>
      ProductionCountries(
        iso31661: iso31661 ?? _iso31661,
        name: name ?? _name,
      );

  String? get iso31661 => _iso31661;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = _iso31661;
    map['name'] = _name;

    return map;
  }
}

/// id : 174
/// logo_path : "/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png"
/// name : "Warner Bros. Pictures"
/// origin_country : "US"

class ProductionCompanies {
  ProductionCompanies({
    num? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
  }

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    _id = json['id'] as num?;
    _logoPath = json['logo_path'] as String?;
    _name = json['name'] as String?;
    _originCountry = json['origin_country'] as String?;
  }

  num? _id;
  String? _logoPath;
  String? _name;
  String? _originCountry;

  ProductionCompanies copyWith({
    num? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) =>
      ProductionCompanies(
        id: id ?? _id,
        logoPath: logoPath ?? _logoPath,
        name: name ?? _name,
        originCountry: originCountry ?? _originCountry,
      );

  num? get id => _id;

  String? get logoPath => _logoPath;

  String? get name => _name;

  String? get originCountry => _originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['name'] = _name;
    map['origin_country'] = _originCountry;

    return map;
  }
}

/// id : 80
/// name : "Crime"

class Genres {
  Genres({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Genres.fromJson(Map<String, dynamic> json) {
    _id = json['id'] as num?;
    _name = json['name'] as String?;
  }

  num? _id;
  String? _name;

  Genres copyWith({
    num? id,
    String? name,
  }) =>
      Genres(
        id: id ?? _id,
        name: name ?? _name,
      );

  num? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;

    return map;
  }
}

/// id : 948485
/// name : "The Batman Collection"
/// poster_path : "/rTCJB5axQ8XOmGbpJBsiHkhKq14.jpg"
/// backdrop_path : "/qS2ViQwlWUECiAdkIuEaJZoq0QW.jpg"

class BelongsToCollection {
  BelongsToCollection({
    num? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    _id = id;
    _name = name;
    _posterPath = posterPath;
    _backdropPath = backdropPath;
  }

  BelongsToCollection.fromJson(Map<String, dynamic> json) {
    _id = json['id'] as num?;
    _name = json['name'] as String?;
    _posterPath = json['poster_path'] as String?;
    _backdropPath = json['backdrop_path'] as String?;
  }

  num? _id;
  String? _name;
  String? _posterPath;
  String? _backdropPath;

  BelongsToCollection copyWith({
    num? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) =>
      BelongsToCollection(
        id: id ?? _id,
        name: name ?? _name,
        posterPath: posterPath ?? _posterPath,
        backdropPath: backdropPath ?? _backdropPath,
      );

  num? get id => _id;

  String? get name => _name;

  String? get posterPath => _posterPath;

  String? get backdropPath => _backdropPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['poster_path'] = _posterPath;
    map['backdrop_path'] = _backdropPath;

    return map;
  }
}
