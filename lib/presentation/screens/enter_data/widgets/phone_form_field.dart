import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../../core/resources/color_manager.dart';

class PhoneFieldView extends StatelessWidget {
  static const supportedLocales = [
    Locale('ar'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('hi'),
    Locale('hu'),
    Locale('it'),
    Locale('nb'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('tr'),
    Locale('uz'),
    Locale('zh'),
    // ...
  ];

  final PhoneController controller;
  final FocusNode focusNode;
  final CountrySelectorNavigator selectorNavigator;
  final bool withLabel;
  final bool outlineBorder;
  final bool isCountryButtonPersistant;
  final bool mobileOnly;
  final Locale locale;

  const PhoneFieldView({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.selectorNavigator,
    required this.withLabel,
    required this.outlineBorder,
    required this.isCountryButtonPersistant,
    required this.mobileOnly,
    required this.locale,
  }) : super(key: key);

  PhoneNumberInputValidator? _getValidator(BuildContext context) {
    List<PhoneNumberInputValidator> validators = [];
    if (mobileOnly) {
      validators.add(PhoneValidator.validMobile(context));
    } else {
      validators.add(PhoneValidator.valid(context));
    }
    return validators.isNotEmpty ? PhoneValidator.compose(validators) : null;
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Localizations.override(
        context: context,
        locale: locale,
        child: Builder(
          builder: (context) {
            final label = PhoneFieldLocalization.of(context).phoneNumber;
            return SizedBox(
              width: 350.0,
              height: 57.0,
              child: PhoneFormField(
                focusNode: focusNode,
                controller: controller,
                isCountryButtonPersistent: isCountryButtonPersistant,
                autofocus: false,
                autofillHints: const [AutofillHints.telephoneNumber],
                countrySelectorNavigator: selectorNavigator,
                decoration: InputDecoration(
                  label: withLabel ? Text(label) : null,
                  border: outlineBorder
                      ?  OutlineInputBorder( borderRadius: BorderRadius.circular(8.0),)
                      : const UnderlineInputBorder(),
                  hintText: withLabel ? '' : label,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
                enabled: true,
                countryButtonStyle: const CountryButtonStyle(
                  showFlag: true,
                  showIsoCode: false,
                  showDialCode: true,
                  showDropdownIcon: true,
                ),
                validator: _getValidator(context),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: Theme.of(context).colorScheme.primary,
                // ignore: avoid_print
                onSaved: (p) => print('saved $p'),
                // ignore: avoid_print
                onChanged: (p) => print('changed $p'),
              ),
            );
          },
        ),
      ),
    );
  }
}
