import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:myapp/common_widgets/custom_box.dart';
import 'package:myapp/resources/app_extentions.dart';
import 'package:myapp/resources/color_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        drawer: Drawer(),
        body: Stack(children: [
          OSMFlutter(
              controller: controller,
              osmOption: OSMOption(
                userTrackingOption: UserTrackingOption(
                  enableTracking: true,
                  unFollowUser: false,
                ),
                zoomOption: ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: MarkerIcon(
                    icon: Icon(
                      Icons.location_history_rounded,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: MarkerIcon(
                    icon: Icon(
                      Icons.point_of_sale,
                      size: 48,
                    ),
                  ),
                ),
                roadConfiguration: RoadOption(
                  roadColor: Colors.yellowAccent,
                ),
              )),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                CustomBox(
                  onTap: () {},
                  borderColor: Colors.black,
                  padding: 10,
                  height: 60,
                  width: 150,
                  color: ColorManager.whiteColor,
                  child: Text(
                    '2324\$' + '\n' + 'Collected',
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                ToggleSwitch(
                  minWidth: 150,
                  minHeight: 60,
                  initialLabelIndex: 0,
                  cornerRadius: 20.0,
                  activeFgColor: ColorManager.greenColor,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  activeBgColor: [
                    Colors.black,
                    const Color.fromARGB(255, 52, 52, 52),
                  ],
                  customTextStyles: [
                    TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ],
                  totalSwitches: 2,
                  labels: ['Offline', 'Online'],
                  icons: [
                    Icons.error,
                    Icons.online_prediction,
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
                CustomBox(
                  padding: 10,
                  height: context.height * 0.1,
                  width: double.infinity,
                  color: ColorManager.blackColor,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'You are online now',
                        style: TextStyle(
                            color: ColorManager.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          Text(
                            'Rating:    4.5',
                            style: TextStyle(
                                color: ColorManager.whiteColor, fontSize: 20),
                          ),
                          Icon(
                            Icons.turn_sharp_right_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            'Total Trips:  10',
                            style: TextStyle(
                                color: ColorManager.whiteColor, fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
