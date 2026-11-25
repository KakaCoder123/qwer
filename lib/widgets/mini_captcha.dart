import 'dart:math';

import 'package:flutter/material.dart';

final double cW = 300, cH = 180, pSize = 50, totalRotate = 2.0;

class MiniCaptcha extends StatefulWidget {
  final VoidCallback onTap;
  const MiniCaptcha({super.key, required this.onTap});

  @override
  State<MiniCaptcha> createState() => _MiniCaptchaState();
}

class _MiniCaptchaState extends State<MiniCaptcha> {
  bool isVerify = false;
  double targetX = 0, targetY = 0, sliderProgress = 0.0;
  int imageIndex = 1;
  final random = Random();



  void updateP() {
    imageIndex = random.nextInt(3) + 1;
    targetX = (cW / 2) + random.nextDouble() * ((cW/2) - pSize);
    targetY = 10 + random.nextDouble() * (cH - 10 - pSize);
    isVerify = false;
    sliderProgress = 0.0;
  }

  double get currentX => sliderProgress * (cW - pSize);
  double get currentAngle => sliderProgress * totalRotate * 2 * pi;
  double get targetAngle => (targetX / (cW - pSize)) * totalRotate * 2 * pi;

  Widget buildP(Widget child) => Container(
    width: pSize,
    height: pSize,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white, width: 2)
    ),
    child: ClipRect(child: child,),
  );



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateP();
  }

  @override
  Widget build(BuildContext context) {
    final back = Image.asset("assets/media/images/captcha_$imageIndex.jpg", width: cW, height: cH, fit: BoxFit.cover,);
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: cW,
            height: cH,
            child: Stack(
              children: [
                back,

                Positioned(
                    top: targetY,
                    left: targetX,
                    child: Transform.rotate(
                        angle: targetAngle,
                        child: buildP(
                          ColoredBox(color: Colors.black54),
                        ),
                    )
                ),

                Positioned(
                    top: targetY,
                    left: currentX,
                    child: Transform.rotate(
                        angle: currentAngle,
                        child: buildP(
                          Transform.rotate(angle: -targetAngle,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(child: back, top: -targetY, left: -targetX,)
                              ],
                            ),
                          )
                        ),
                    )
                )

              ],
            ),
          ),
        ),

        SizedBox(height: 20,),

        SizedBox(
          width: cW,
          child: Slider(
              value: sliderProgress,
              onChanged: isVerify
                  ? null
                  :(double NewValue) => setState(() {
                    sliderProgress = NewValue;
                  }),
              onChangeEnd: (_){
                if((currentX - targetX).abs() < 5) {
                  setState(() {
                    isVerify = true;
                  });
                  widget.onTap();
                }else{
                  setState(() {
                    updateP();
                  });
                }
              },
          ),
        )


      ],
    );
  }
}
