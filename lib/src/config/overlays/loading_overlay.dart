import 'package:flutter/material.dart';
import 'package:misterblast_flutter/src/widgets/app_loading.dart';

class LoadingOverlay {
  late OverlayEntry _overlayEntry;

  void show(BuildContext context, [Widget? subWidget]) {
    _overlayEntry = _createOverlay(subWidget);
    Overlay.of(context).insert(_overlayEntry);
  }

  void hide() => _overlayEntry.remove();

  _createOverlay(Widget? subWidget) {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
            dismissible: false,
            color: Colors.black.withAlpha(30),
          ),
          Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLoading(),
              subWidget != null
                  ? Material(
                      color: Colors.transparent,
                      child: subWidget,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
