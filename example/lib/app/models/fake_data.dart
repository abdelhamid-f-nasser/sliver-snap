import 'package:example/app/models/index.dart';

class FakeData {
  static const _imageURL = "https://image.tmdb.org/t/p/original";
  static final theBatmanMovie = MovieDetails.fromJson({
    "adult": false,
    "backdrop_path": "$_imageURL/b0PlSFdDwbyK0cf5RxwDpaOJQvQ.jpg",
    "belongs_to_collection": {
      "id": 948485,
      "name": "The Batman Collection",
      "poster_path": "$_imageURL/rTCJB5axQ8XOmGbpJBsiHkhKq14.jpg",
      "backdrop_path": "$_imageURL/qS2ViQwlWUECiAdkIuEaJZoq0QW.jpg",
    },
    "budget": 185000000,
    "genres": [
      {"id": 80, "name": "Crime"},
      {"id": 9648, "name": "Mystery"},
      {"id": 53, "name": "Thriller"},
    ],
    "homepage": "https://www.thebatman.com",
    "id": 414906,
    "imdb_id": "tt1877830",
    "original_language": "en",
    "original_title": "The Batman",
    "overview": '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Amet consectetur adipiscing elit pellentesque habitant. Risus commodo viverra maecenas accumsan lacus. Pellentesque massa placerat duis ultricies lacus sed turpis. Egestas purus viverra accumsan in nisl nisi. Laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt. Tortor aliquam nulla facilisi cras fermentum odio eu feugiat. Sagittis vitae et leo duis ut. Elementum nibh tellus molestie nunc non blandit. Eget nunc lobortis mattis aliquam faucibus purus in massa tempor. Consequat ac felis donec et. Ullamcorper sit amet risus nullam.

Sem nulla pharetra diam sit. Ut faucibus pulvinar elementum integer. A condimentum vitae sapien pellentesque habitant morbi tristique senectus. Volutpat sed cras ornare arcu dui. Sagittis purus sit amet volutpat. Aliquet sagittis id consectetur purus ut faucibus. Eu scelerisque felis imperdiet proin fermentum leo. Egestas purus viverra accumsan in nisl nisi scelerisque. Maecenas pharetra convallis posuere morbi. Sollicitudin nibh sit amet commodo nulla facilisi. Consequat interdum varius sit amet mattis vulputate. Et tortor consequat id porta. Velit dignissim sodales ut eu sem. Sapien eget mi proin sed libero enim sed. Lorem ipsum dolor sit amet consectetur. Porta lorem mollis aliquam ut porttitor leo a diam sollicitudin. Urna porttitor rhoncus dolor purus non enim praesent elementum facilisis. Aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi.
''',
    "popularity": 359.665,
    "poster_path": "$_imageURL/74xTEgt7R36Fpooo50r9T25onhq.jpg",
    "production_companies": [
      {
        "id": 174,
        "logo_path": "$_imageURL/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png",
        "name": "Warner Bros. Pictures",
        "origin_country": "US",
      },
      {
        "id": 101405,
        "logo_path": null,
        "name": "6th & Idaho",
        "origin_country": "US",
      },
      {
        "id": 119245,
        "logo_path": null,
        "name": "Dylan Clark Productions",
        "origin_country": "US",
      },
      {
        "id": 128064,
        "logo_path": "$_imageURL/13F3Jf7EFAcREU0xzZqJnVnyGXu.png",
        "name": "DC Films",
        "origin_country": "US",
      },
    ],
    "production_countries": [
      {"iso_3166_1": "US", "name": "United States of America"},
    ],
    "release_date": "2022-03-01",
    "revenue": 770836163,
    "runtime": 177,
    "spoken_languages": [
      {"english_name": "English", "iso_639_1": "en", "name": "English"},
    ],
    "status": "Released",
    "tagline": "Unmask the truth.",
    "title": "The Batman",
    "video": false,
    "vote_average": 7.706,
    "vote_count": 7223,
  });
}
