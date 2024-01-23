import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tour_app/ui/route/routes.dart';
import 'package:tour_app/ui/views/home.dart';

import '../widgets/violetButton.dart';

class PrivacyPolicy extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
          child: Column(
            children: [
              Expanded(
                  child: SfPdfViewer.network(
                'https://firebasestorage.googleapis.com/v0/b/tour-app-498ef.appspot.com/o/Honey%20-%20Job%20CV.pdf?alt=media&token=bb70ee15-86a1-4e2c-a02f-7228a2363616',
                onDocumentLoaded: ((PdfDocumentLoadedDetails details) {
                  _loaded.value = true;
                }),
              )),
              Obx(
                () => _loaded == true
                    ? VioletButton(
                        "Agree",
                        () => Get.toNamed(homepage),
                      )
                    : Text('Still Loading'),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
