import 'dart:async';
import 'package:crash_course/tourism/network/location_api.dart';
import 'package:flutter/material.dart';
import '../style.dart';
import '../model/location.dart';
import 'component/item_location_list.dart';
import 'component/custom.dart';
import 'location_detail.dart';

class LocationList extends StatefulWidget {
  const LocationList({super.key});

  @override
  State<StatefulWidget> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = <Location>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    if (mounted) {
      setState(() => loading = true);
      Timer(const Duration(milliseconds: 3000), () async {
        final locations = await LocationApi.getAll();
        setState(() {
          this.locations = locations;
          loading = false;
        });
      });
    }
  }

  void navigateTo(BuildContext context, Location location) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationDetail(
                  locationId: location.id,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: RefreshIndicator(
          onRefresh: loadData,
          child: Stack(
              children: [_renderListView(context), _renderProgress(context)]),
        ));
  }

  Widget _renderProgress(BuildContext context) {
    return loading
        ? const LinearProgressIndicator(
            value: null,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          )
        : Container();
  }

  Widget _renderListView(BuildContext context) {
    return ListView.builder(
      itemBuilder: _listViewItemBuilder,
      itemCount: locations.length,
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var location = locations[index];

    return Container(
      height: 250.0,
      child: Stack(children: [
        ImageNetwork(imageUrl: location.url),
        Align(alignment: Alignment.bottomLeft, child: _locationText(location)),
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => navigateTo(context, location),
          ),
        ))
      ]),
    );
  }

  Widget _locationText(Location location) {
    final item = ItemLocationList(
      location: location,
      darkTheme: true,
    );

    return ContainerOverlay(padding: Styles.paddingDefault, child: item);
  }
}
