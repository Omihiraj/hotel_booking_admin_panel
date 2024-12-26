import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/providers/hotel_form_provider.dart';
import 'package:provider/provider.dart';

class PopupScreen {
  static Future<void> showMyDialog(context, {required bool isSuccess}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isSuccess
              ? 'Form Submition Success'
              : 'Form Submition UnSuccess'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
                context.read<HotelFormProvider>().clearForm();
              },
            ),
          ],
        );
      },
    );
  }
}
