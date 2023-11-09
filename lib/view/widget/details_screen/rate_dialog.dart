import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../controller/details_provider/details_provider.dart';
import '../../../core/constant/color.dart';
import '../../../core/extension/space_extension.dart';
import '../../../core/function/show_scaffold_message.dart';
import '../../../generated/assets.dart';
import '../shred_component/material_button.dart';

showRatingDialog(context, int id, String mediaType) {
  SmartDialog.show(
      builder: (_) => Consumer<DetailsProvider>(
            builder: (context, controller, child) => Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              height: 550,
              child: Column(
                children: [
                  Text("Rating Bar",
                      style: Theme.of(context).textTheme.headlineLarge),
                  Lottie.asset(Assets.lottieRating, height: 250, width: 250),
                  RatingBar.builder(
                    initialRating: controller.rating,
                    minRating: controller.rating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    wrapAlignment: WrapAlignment.center,
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) {
                      controller.rateValue = rating;
                      controller.notifyListeners();
                    },
                  ),
                  10.height,
                  Text("${controller.rateValue}",
                      style: const TextStyle(fontSize: 25)),
                  10.height,
                  MaterialCustomButton(
                      onPressed: () async {
                        await controller.addRate(
                            context, id, mediaType, controller.rateValue);
                        SmartDialog.dismiss();
                        showScaffoldMessage(context, "Successfully Add Rate");
                      },
                      title: "Save",
                      fontSize: 22,
                      color: AppColor.scaffoldBgColor),
                  if (controller.rating > 0.0)
                    MaterialCustomButton(
                        onPressed: () async {
                          await controller.removeRate(context, id, mediaType);
                          SmartDialog.dismiss();
                        },
                        title: "Delete",
                        fontSize: 22,
                        color: Colors.red),
                ],
              ),
            ),
          ));
}
