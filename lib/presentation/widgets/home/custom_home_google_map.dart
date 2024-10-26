import 'package:ambulance/view_model/homeCubit/home_cubit.dart';
import 'package:ambulance/view_model/homeCubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomHomeGoogleMap extends StatefulWidget {
  final HomeCubit cubit;
  const CustomHomeGoogleMap({super.key, required this.cubit});

  @override
  State<CustomHomeGoogleMap> createState() => _CustomHomeGoogleMapState();
}

class _CustomHomeGoogleMapState extends State<CustomHomeGoogleMap> {
  @override
  void initState() {
    HomeCubit.get(context).checkConnection(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return HomeCubit.get(context).isconnect
          ? GoogleMap(
              onMapCreated: (controller) {
                widget.cubit.setGoogleMapController(controller);
              },
              mapType: widget.cubit.mapType,
              initialCameraPosition: widget.cubit.initialCameraPosition,
             // minMaxZoomPreference: const MinMaxZoomPreference(6.0, 20.0),

              markers: {
                if (widget.cubit.latitude != null &&
                    widget.cubit.latitude != null)
                  Marker(
                    markerId: const MarkerId('1'),
                    position: LatLng(
                      widget.cubit.latitude!,
                      widget.cubit.longitude!,
                    ),
                  )
              },
              style: Theme.of(context).colorScheme.brightness == Brightness.dark
                  ? widget.cubit.mapStyle
                  : null,
             // cameraTargetBounds: CameraTargetBounds(
                // LatLngBounds(
                //   southwest: const LatLng(22.6333, 51.5833),
                //   northeast: const LatLng(26.0649, 56.3838),
                // ),
                // LatLngBounds(
                //   southwest: const LatLng(8.6, 21.8),
                //   northeast: const LatLng(22.0, 38.6),
                // ),
            //  ),

              zoomControlsEnabled: false,
              //  myLocationEnabled: true,
            )
          : const Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off, size: 100, color: Colors.red),
                SizedBox(height: 20),
                Text('No Internet Connection', style: TextStyle(fontSize: 18)),
              ],
            ));
    });
  }
}
