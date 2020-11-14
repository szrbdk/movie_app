import 'package:progress_follower/client/env.dart';
import 'package:progress_follower/manager/temp_storage.dart';
import 'package:progress_follower/utils/enums.dart';

class ApiHelper {
  static const String traktApiUrl = "https://api.trakt.tv";
  static const String tmdbApiUrl = "https://api.themoviedb.org/3";
  static const String redirect = "urn:ietf:wg:oauth:2.0:oob";
  static const String grantWithRefreshToken = "refresh_token";
  static const String grantWithAuthCode = "authorization_code";
  static const String imageUrl = "https://image.tmdb.org/t/p";
  static String traktAuth = "Bearer ${TempStorage().token.accessToken}";

  static String codeUrl =
      "https://trakt.tv/oauth/authorize?response_type=code&client_id=${Env.traktApiKey}&redirect_uri=$redirect";

  static String tmdbImageUrl(String imagePath, {ImageSize size}) {
    switch (size) {
      case ImageSize.w92:
        return "$imageUrl/w92$imagePath";
      case ImageSize.w154:
        return "$imageUrl/w154$imagePath";
      case ImageSize.w185:
        return "$imageUrl/w185$imagePath";
      case ImageSize.w342:
        return "$imageUrl/w342$imagePath";
      case ImageSize.w500:
        return "$imageUrl/w500$imagePath";
      case ImageSize.w780:
        return "$imageUrl/w780$imagePath";
      case ImageSize.original:
        return "$imageUrl/original$imagePath";
      default:
        return "$imageUrl/original$imagePath";
    }
  }
}
