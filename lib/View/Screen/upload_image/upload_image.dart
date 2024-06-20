

import 'package:checkup/Controller/Questions/OCT_Controller.dart';
import 'package:checkup/Core/Class/handlingdataview.dart';
import 'package:checkup/Core/Class/statusrequest.dart';
import 'package:checkup/Core/Constant/Color.dart';
import 'package:checkup/Core/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/Auth/customdrawer.dart';


class UploadImage extends StatelessWidget {
  UploadImage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OctControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Upload OCT",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.white),
          ),
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: GetBuilder<OctControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest:controller.statusRequest!,
              widget:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (controller.file != null)
                  Image.file(
                    controller.file!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.primaryColor,
                    ),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () async {
                        await controller.getImageGallary();
                      },
                      child: const Text(
                        "Gallary",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: AppColor.primaryColor,
                //     ),
                //     width: double.infinity,
                //     child: MaterialButton(
                //       onPressed: () async {
                //         await controller.getImageCamera();
                //       },
                //       child: const Text(
                //         "Camera",
                //         style: TextStyle(
                //             fontSize: 30,
                //             fontWeight: FontWeight.bold,
                //             color: AppColor.white),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.primaryColor,
                    ),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {

                        controller.PostDataOCT();

                      },
                      child: const Text(
                        "Upload OCT",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            );
          }

        ));
  }
}


