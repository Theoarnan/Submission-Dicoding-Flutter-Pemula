import 'package:flutter/material.dart';
import 'package:submission_bmafup_movie_dicoding_app/helper/constants_helper.dart';

class SettingComponent extends StatelessWidget {
  final Icon iconComponent;
  final String titleComponent;
  final Function? onTap;
  const SettingComponent(
      {Key? key,
      required this.iconComponent,
      required this.titleComponent,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: <Widget>[
            iconComponent,
            const SizedBox(
              width: 10,
            ),
            Text(titleComponent,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: ConstantsHelper.kBackSplash)),
            const Spacer(),
            const Icon(Icons.arrow_right_rounded),
          ],
        ),
      ),
    );
  }
}
