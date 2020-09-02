import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrypotterapp/Core/Constants/app_constanst.dart';
import 'package:harrypotterapp/Core/Extension/context_extension.dart';
import 'package:harrypotterapp/Core/Extension/locale_extension.dart';
import 'package:harrypotterapp/Core/Extension/string_extension.dart';
import 'package:harrypotterapp/Core/Notifier/themeprovider.dart';
import 'package:harrypotterapp/Core/Service/Localization/language_service.dart';
import 'package:provider/provider.dart';

class BottomSheetPanelBody extends StatelessWidget {
  const BottomSheetPanelBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .25,
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

  Row buildRowLang(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: LanguageService.instance.locales
          .map(
            (e) => FlatButton(
              onPressed: () {
                EasyLocalization.of(context).locale = e;
              },
              child: Container(
                alignment: Alignment.center,
                width: context.width * .2,
                padding: EdgeInsets.symmetric(vertical: context.constLowValue),
                decoration: EasyLocalization.of(context).locale == e
                    ? buildBoxDecorationHight(context)
                    : buildBoxDecorationLow(context),
                child: Text(
                  e.localeTag,
                  style: context.textTheme.bodyText1
                      .copyWith(color: context.theme.backgroundColor),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Row buildRowTheme(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var theme = themeProvider.getTheme;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: AppConstansts.themeDataList.keys
            .map(
              (e) => FlatButton(
                onPressed: () {
                  themeProvider.setTheme(e);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: context.width * .2,
                  padding:
                      EdgeInsets.symmetric(vertical: context.constLowValue),
                  decoration: theme == e
                      ? buildBoxDecorationHight(context)
                      : buildBoxDecorationLow(context),
                  child: Text(
                    AppConstansts.themeDataList[e].locale,
                    style: context.textTheme.bodyText1
                        .copyWith(color: context.theme.backgroundColor),
                  ),
                ),
              ),
            )
            .toList());
  }

  BoxDecoration buildBoxDecorationHight(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(context.constMediumValue),
      border: Border.all(width: 3, color: context.theme.backgroundColor),
    );
  }

  BoxDecoration buildBoxDecorationLow(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(context.constMediumValue),
      border: Border.all(
          width: 1, color: context.theme.backgroundColor.withOpacity(.7)),
    );
  }
}
