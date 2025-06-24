import 'package:flutter/material.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;

  StateRenderer({
    super.key,
    required this.stateRendererType,
    this.message = "Loading...",
    this.title = "Error",
  });

  var _isDialogDismissed = false;
  var _isDialogShowing = false;

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  @override
  Widget build(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _showPopupLoadingDialog(context, _buildLoadingWidget());
      case StateRendererType.popupErrorState:
        return _showPopupErrorDialog(context,  _buildErrorWidget());
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
        Text(message),
      ],
    );
  }

  Widget _buildErrorWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline_outlined, size: 70, color: Colors.red),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(message),
      ],
    );
  }

  Widget _showPopupLoadingDialog(BuildContext context, Widget content) {
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

  Widget _showPopupErrorDialog(BuildContext context, Widget content) {
    if (!_isThereCurrentDialogShowing(context)) {
      _isDialogShowing = true;
      WidgetsBinding.instance.addPersistentFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: content,
            actions: [
              TextButton(
                onPressed: () {
                  _isDialogDismissed = true;
                  Navigator.of(context, rootNavigator: true).pop(true);
                },
                child: Text("Close"),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
