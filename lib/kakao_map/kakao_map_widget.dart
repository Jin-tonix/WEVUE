import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'place_search_service.dart';

class KakaoMapWidget extends StatefulWidget {
  final List<Place> places;
  final Place? selectedPlace;
  const KakaoMapWidget({super.key, required this.places, this.selectedPlace});
  @override
  State<KakaoMapWidget> createState() => _KakaoMapWidgetState();
}

class _KakaoMapWidgetState extends State<KakaoMapWidget> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    // 전달할 마커 리스트 JS로 넘김
    final placesJson = jsonEncode(widget.places.map((p) => {
      'lat': p.lat,
      'lng': p.lng,
      'name': p.name,
    }).toList());
    final selectedLat = widget.selectedPlace?.lat;
    final selectedLng = widget.selectedPlace?.lng;

    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: Uri.dataFromString('''
      <!DOCTYPE html>
      <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=당신의_자바스크립트_키"></script>
      </head>
      <body>
        <div id="map" style="width:100vw;height:100vh;"></div>
        <script>
          var mapContainer = document.getElementById('map');
          var mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 4
          };
          var map = new kakao.maps.Map(mapContainer, mapOption);
          var markers = [];
          function clearMarkers() {
            for(var i=0; i<markers.length; i++) { markers[i].setMap(null);}
            markers = [];
          }
          function setMarkers(places) {
            clearMarkers();
            for(var i=0;i<places.length;i++) {
              var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(places[i].lat, places[i].lng),
                title: places[i].name
              });
              markers.push(marker);
            }
            if(places.length>0){
              map.setCenter(new kakao.maps.LatLng(places[0].lat, places[0].lng));
            }
          }
          setMarkers($placesJson);
        </script>
      </body>
      </html>
      ''', mimeType: 'text/html').toString(),
      onWebViewCreated: (controller) {
        _controller = controller;
      },
    );
  }
}
