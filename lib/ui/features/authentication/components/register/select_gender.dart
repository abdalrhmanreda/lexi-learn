import 'package:flutter/material.dart';
import 'package:lexi_learn/ui/features/authentication/controller/auth_cubit.dart';

import '../../../../../generated/l10n.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: S.of(context).male,
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                  AuthCubit.get(context).gender = _selectedGender!;
                });
              },
            ),
            Text(S.of(context).male),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: S.of(context).female,
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                  AuthCubit.get(context).gender = _selectedGender!;
                });
              },
            ),
            Text(S.of(context).female),
          ],
        ),
      ],
    );
  }
}
