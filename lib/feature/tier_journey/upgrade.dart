
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart' as rive;
import 'package:flutter/material.dart';

import '../../common/widgets/custom_app_bar.dart';

class UpgradeTierPage extends StatefulWidget {
  const UpgradeTierPage({super.key, required this.image});
  final String image;

  @override
  State<UpgradeTierPage> createState() => _UpgradeTierPageState();
}

class _UpgradeTierPageState extends State<UpgradeTierPage> {
  rive.SMIBool? riveBoolInput;
  RxBool showIMage = false.obs;
  void _onRiveInit(rive.Artboard artboard,) {
    final controller =
    rive.StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    riveBoolInput = controller.getBoolInput('Boolean 1')!;
    Future.delayed(const Duration(milliseconds: 900),(){
      showIMage.value = true;
    });
  }

  @override
  void initState() {
    super.initState();
    showIMage = false.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        isBackgroundTransparent:true,
        title: "".tr,
        onBackPressed: () {

          if(Navigator.canPop(context)){
            Get.back();
          }
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft, end: Alignment.centerRight,
              colors: [
                Colors.black26,
                Colors.black,
                Colors.black26,
              ], )
        ),
        child: Obx(
              ()=> Stack(
            alignment: Alignment.center,
            children: [
              rive.RiveAnimation.asset('assets/rive/game_upgrade.riv',
                  onInit: (artboard) {
                    _onRiveInit(artboard);

                  }),

              if(showIMage.value == true)
                Image.asset(widget.image, height: 200, width: 200,)
            ],
          ),
        ),
      ),
    );
  }
}
