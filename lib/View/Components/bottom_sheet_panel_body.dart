import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrypotterapp/Core/Constants/App/app_constanst.dart';
import 'package:harrypotterapp/Core/Notifier/theme_provider.dart';
import 'package:harrypotterapp/View/Components/setting_button.dart';
import 'package:provider/provider.dart';

import '../../Core/Extension/context_extension.dart';
import '../../Core/Extension/locale_extension.dart';
import '../../Core/Extension/string_extension.dart';
import '../../Core/Service/Localization/language_service.dart';

class BottomSheetPanelBody extends StatelessWidget {
  const BottomSheetPanelBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: context.height * .25,
        minHeight: context.height * .15,
      ),
      color: context.theme.primaryColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildRowTheme(context),
          buildRowLang(context),
        ],
      ),
    );
  }

  Row buildRowTheme(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: AppConstansts.themeDataList.keys
            .map(
              (e) => SettingButton(
                onPressed: () {
                  themeProvider.setTheme(e);
                },
                bigSizeBorder: themeProvider.getTheme == e,
                text: AppConstansts.themeDataList[e].locale,
              ),
            )
            .toList());
  }

  Row buildRowLang(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: LanguageService.instance.locales
          .map(
            (e) => SettingButton(
              onPressed: () {
                EasyLocalization.of(context).locale = e;
              },
              bigSizeBorder: EasyLocalization.of(context).locale == e,
              text: e.localeTag,
            ),
          )
          .toList(),
    );
  }
}
