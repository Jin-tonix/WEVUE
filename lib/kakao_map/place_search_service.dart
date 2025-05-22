import 'dart:convert';
import 'package:http/http.dart' as http;

class Place {
  final String name;
  final String address;
  final String roadAddress;
  final String phone;
  final double lat;
  final double lng;

  Place({
    required this.name,
    required this.address,
    required this.roadAddress,
    required this.phone,
    required this.lat,
    required this.lng,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['place_name'] ?? '',
      address: json['address_name'] ?? '',
      roadAddress: json['road_address_name'] ?? '',
      phone: json['phone'] ?? '',
      lat: double.tryParse(json['y'] ?? '0') ?? 0,
      lng: double.tryParse(json['x'] ?? '0') ?? 0,
    );
  }
}

class PlaceSearchService {
  final String apiKey; // REST API 키

  PlaceSearchService(this.apiKey);

  Future<List<Place>> searchPlaces(String keyword) async {
    final url = Uri.parse(
      'https://dapi.kakao.com/v2/local/search/keyword.json?query=$keyword',
    );
    final response = await http.get(
      url,
      headers: {'Authorization': 'KakaoAK $apiKey'},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List documents = data['documents'];
      return documents.map((e) => Place.fromJson(e)).toList();
    } else {
      throw Exception('장소 검색 실패');
    }
  }
}
