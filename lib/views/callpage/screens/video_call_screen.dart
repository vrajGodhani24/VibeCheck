import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  final String callID;
  final String userID;
  final String nickName;
  const CallPage(
      {super.key,
      required this.callID,
      required this.userID,
      required this.nickName});

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          1864854115, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "edf514d93a9b1ba631d51610dc23a337f08aa6603ddd0fc5e4c7c19a8bf51fa5", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userID,
      userName: nickName,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
