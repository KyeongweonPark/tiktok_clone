import 'package:flutter/material.dart';

class VideoConfigData extends InheritedWidget {
  final bool autoMute;

  final void Function() toggleMuted;

  const VideoConfigData({
    super.key,
    required this.toggleMuted,
    required this.autoMute,
    required super.child,
  });

  static VideoConfigData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

class VideoConfig extends StatefulWidget {
  final Widget child;
  const VideoConfig({super.key, required this.child});

  @override
  State<VideoConfig> createState() => _VideoConfigState();
}

class _VideoConfigState extends State<VideoConfig> {
  bool autoMute = true;

  void toggleMuted() {
    setState(() {
      autoMute = !autoMute;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoConfigData(
      autoMute: autoMute,
      toggleMuted: toggleMuted,
      child: widget.child,
    );
  }
}
