import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/main.dart';
import 'package:hotel_booking_admin_panel/providers/hotel_form_provider.dart';
import 'package:provider/provider.dart';

class PackagePriceIncluder extends StatefulWidget {
  const PackagePriceIncluder({super.key, required this.packageName});

  final String packageName;

  @override
  State<PackagePriceIncluder> createState() => _PackagePriceIncluderState();
}

class _PackagePriceIncluderState extends State<PackagePriceIncluder> {
  bool isChecked = false;
  TextEditingController packagePrice = TextEditingController();
  String? packagePriceError;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isChecked,
            onChanged: (value) {
              if (packagePrice.text.isEmpty) {
                setState(() {
                  packagePriceError =
                      "Please Enter Value Before Select Package";
                });
              } else {
                setState(() {
                  isChecked = value!;
                  packagePriceError = null;
                });
                if (value == true) {
                  context.read<HotelFormProvider>().addPrice({
                    widget.packageName: packagePrice.text,
                  });
                } else {
                  context
                      .read<HotelFormProvider>()
                      .removePrice(widget.packageName);

                  setState(() {
                    packagePrice.text = "";
                  });
                }
              }
            }),
        Text(widget.packageName),
        SizedBox(
          width: 300,
          height: 45,
          child: TextField(
            keyboardType: const TextInputType.numberWithOptions(),
            controller: packagePrice,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                errorText: packagePriceError),
          ),
        )
      ],
    );
  }
}
