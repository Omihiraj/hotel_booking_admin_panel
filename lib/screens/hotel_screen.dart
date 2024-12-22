import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/main.dart';
import 'package:hotel_booking_admin_panel/providers/hotel_form_provider.dart';
import 'package:hotel_booking_admin_panel/widgets/main_image_selector.dart';
import 'package:hotel_booking_admin_panel/widgets/multiple_image_selector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widgets/package_price_includer.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  TextEditingController hotelNameController = TextEditingController();
  TextEditingController aminitiesController = TextEditingController();
  TextEditingController googleMapLocationUrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog();
        },
        child: const Icon(Icons.add),
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 200,
                child: Stack(
                  children: [
                    Image.network(
                      "https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      fit: BoxFit.fitHeight,
                    ),
                    Positioned(
                      bottom: 95,
                      child: Container(
                        height: 50,
                        width: 300,
                        color: const Color.fromARGB(198, 0, 0, 0),
                        child: const Text(
                          "Sudu Araliya",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(100.0),
          child: Card(
            child: Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Form(
                child: SizedBox(
                  width: 500,
                  height: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Hotel Name"),
                          SizedBox(
                              width: 300,
                              height: 100,
                              child: TextFormField(
                                controller: hotelNameController,
                              )),
                          const Text("Amenities"),
                          SizedBox(
                            width: 300,
                            height: 100,
                            child: TextFormField(
                              controller: aminitiesController,
                              decoration: InputDecoration(
                                suffix: IconButton(
                                    onPressed: () {
                                      context
                                          .read<HotelFormProvider>()
                                          .addNewAmenity(
                                              amenity: aminitiesController
                                                  .value.text);

                                      aminitiesController.text = "";
                                    },
                                    icon: const Icon(Icons.add)),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          context
                                  .watch<HotelFormProvider>()
                                  .allSelectedAmenities
                                  .isNotEmpty
                              ? SizedBox(
                                  width: 500,
                                  height: 60,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: context
                                          .watch<HotelFormProvider>()
                                          .allSelectedAmenities
                                          .length,
                                      itemBuilder: (context, index) {
                                        List<String> selectedList = context
                                            .watch<HotelFormProvider>()
                                            .allSelectedAmenities;
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Row(
                                                children: [
                                                  Text(selectedList[index]),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              HotelFormProvider>()
                                                          .removeAmenity(
                                                            amenity:
                                                                selectedList[
                                                                    index],
                                                          );
                                                    },
                                                    icon: const Icon(
                                                      Icons.close,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        );
                                      }),
                                )
                              : Container(),
                          const PackagePriceIncluder(
                            packageName: "FullBoard",
                          ),
                          const PackagePriceIncluder(
                            packageName: "HalfBoard",
                          ),
                          const PackagePriceIncluder(
                            packageName: "Room Only",
                          ),
                          const PackagePriceIncluder(
                            packageName: "All Inclusive",
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const MainImageSelector(),
                          const MultipleImageSelector(),
                          SizedBox(
                            width: 500,
                            height: 70,
                            child: TextField(
                              controller: googleMapLocationUrl,
                              decoration: const InputDecoration(
                                label: Text("Location"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print(context
                                  .read<HotelFormProvider>()
                                  .allPackagePrice);
                            },
                            child: const Text("SUBMIT"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
