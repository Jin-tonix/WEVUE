import 'package:flutter/material.dart';
import 'place_search_service.dart';

class PlaceList extends StatelessWidget {
  final List<Place> places;
  final void Function(Place) onTap;
  final Place? selected;

  const PlaceList({super.key, required this.places, required this.onTap, this.selected});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: places.length,
      separatorBuilder: (context, idx) => const Divider(height: 1),
      itemBuilder: (context, idx) {
        final place = places[idx];
        return ListTile(
          selected: place == selected,
          title: Text(place.name),
          subtitle: Text(place.roadAddress.isNotEmpty ? place.roadAddress : place.address),
          trailing: Text(place.phone),
          onTap: () => onTap(place),
        );
      },
    );
  }
}
