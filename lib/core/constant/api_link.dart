import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppLink {
  static String apiKey = dotenv.env['API_KEY']!;
  static String apiAccessToken = dotenv.env['API_READ_ACCESS_TOKEN']!;
  static String accountId = dotenv.env['ACCOUNT_ID']!;
  static const String server = "https://api.themoviedb.org/3";

//============================== Images ==============================//
  static const String imagePath = "https://image.tmdb.org/t/p/w500";

//=============================== Auth ===============================//

//============================ Movies ==============================//
  static const String trending = "$server/trending/all/day?language=en-US";
  static const String topRated =
      "$server/movie/top_rated?language=en-US&page=1";
  static const String topRatedTV = "$server/tv/top_rated?language=en-US&page=1";
  static const String discoverMovies =
      "$server/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc";
  static const String discoverTv =
      "$server/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc";
  static const searchMulti = "$server/search/multi?query=";
}
