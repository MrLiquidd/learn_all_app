import 'package:flutter/material.dart';
import 'package:learn_all/core/app/common/helpers/helpers.dart';
import 'package:learn_all/core/di/app_component/app_component.dart';


class BaseResponsiveWidget extends StatelessWidget {
  const BaseResponsiveWidget({
    super.key,
    required this.buildWidget,
    this.initializeConfig = false,
  });

  final Widget Function(
    BuildContext context,
    ResponsiveUiConfig responsiveUiConfig,
    // AppConfigurations appConfigurations,
  ) buildWidget;
  final bool initializeConfig;

  @override
  Widget build(BuildContext context) {
    final ResponsiveUiConfig responsiveUiConfig = locator<ResponsiveUiConfig>();
    // final AppConfigurations appConfigurations = locator<AppConfigurations>();
    if (initializeConfig) {
      responsiveUiConfig.initialize(context);
    }
    return buildWidget(context, responsiveUiConfig);
  }
}
