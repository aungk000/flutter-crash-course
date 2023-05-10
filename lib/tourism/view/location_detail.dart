import 'package:crash_course/tourism/model/location.dart';
import 'package:crash_course/tourism/network/location_api.dart';
import 'package:crash_course/tourism/view/component/item_location_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../style.dart';
import 'component/custom.dart';

class LocationDetail extends StatefulWidget {
  const LocationDetail({super.key, required this.locationId});

  final int locationId;

  @override
  State<StatefulWidget> createState() => _LocationDetailState();
}

class _LocationDetailState extends State<LocationDetail> {
  var location = Location.blank();

  @override
  void initState() {
    super.initState();
    loadLocation();
  }

  Future<void> loadLocation() async {
    final location = await LocationApi.getLocation(widget.locationId);
    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            _renderBody(context, location),
            _renderFooter(context, location)
          ],
        ));
  }

  Widget _renderBody(BuildContext context, Location location) {
    var result = <Widget>[];
    //result.add(ImageNetwork(url: location.url, height: 250.0));
    result.add(
      ImageNetwork(
        imageUrl: location.url,
        height: 200.0,
      ),
    );
    result.add(_renderHeader(context, location));
    result.addAll(_renderFacts(context, location));
    result.add(Container(
      height: 75.0,
    ));

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: result,
      ),
    );
  }

  Widget _renderFooter(BuildContext context, Location location) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 75.0,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
        padding: Styles.paddingLarge,
        child: TextButton(
            onPressed: _handleBook,
            style: Styles.flatButtonStyle,
            child: Text('Book'.toUpperCase())),
      ),
    );
  }

  Future<void> _handleBook() async {
    final url = Uri.parse('mailto:hello@tourism.co?subject=inquiry');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print(url);
    }
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    var result = <Widget>[];
    for (int i = 0; i < location.facts!.length; i++) {
      result.add(_sectionTitle(location.facts![i].title));
      result.add(_sectionText(location.facts![i].text));
    }
    return result;
  }

  Widget _renderHeader(BuildContext context, Location location) {
    return Container(
      padding: Styles.paddingLarge,
      child: ItemLocationList(location: location, darkTheme: false),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: Styles.paddingLarge,
      child: Text(
        title,
        style: Styles.headerLarge,
      ),
    );
  }

  Widget _sectionText(String text) {
    return Padding(
      padding: Styles.paddingLarge,
      child: Text(
        text,
        style: Styles.textDefault,
      ),
    );
  }
}
