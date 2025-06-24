import 'package:flutter/material.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;

  const StateRenderer({super.key, required this.stateRendererType});

  var _isDialogDismissed = false;
  var _isDialogShowing = false;

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  @override
  Widget build(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _showPopupDialog(context, _buildLoadingWidget());
      case StateRendererType.popupErrorState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.fullScreenLoadingState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.fullScreenErrorState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.emptyState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.contentState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRendererType.nome:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Widget _buildLoadingWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 10),
        Text("Loading..."),
      ],
    );
  }

  Widget _buildEmptyWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 10),
        Text("Loading..."),
      ],
    );
  }

  Widget _showPopupDialog(BuildContext context, Widget content) {
    if (!_isThereCurrentDialogShowing(context)) {
      _isDialogShowing = true;
      WidgetsBinding.instance.addPersistentFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (context) => AlertDialog(content: content),
        ),
      );
    }
    return Container();
  }
}
