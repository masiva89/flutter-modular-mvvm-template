import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:flutter_modular_mvvm/product/navigation/app_router.dart';
import 'package:flutter_modular_mvvm/product/utility/constants/index.dart';
import 'package:flutter_modular_mvvm/product/widget/button/index.dart';

/// Unauthorized information view.
class UnauthorizedInfoView extends StatelessWidget {
  /// Creates a new unauthorized information view instance.
  const UnauthorizedInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    transform: const GradientRotation(-0.5),
                    colors: [
                      ColorName.backgroundPrimary.withOpacity(1),
                      ColorName.backgroundPrimary.withOpacity(1),
                      ColorName.backgroundPrimary.withOpacity(0.9),
                      ColorName.backgroundPrimary.withOpacity(0.5),
                      ColorName.backgroundPrimary.withOpacity(0.1),
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcOver,
                child: Assets.images.onboardBackgroundImage.image(
                  package: 'gen',
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: ProjectPadding.horizontalMedium(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tüm özelliklerden faydalanmak için',
                      style: TextStyles.subtitle1(
                        context,
                      ),
                    ),
                    Text(
                      'Giriş Yapın',
                      style: TextStyles.header1(context),
                    ),
                    ProjectSpacer.largeHeight(context),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: ProjectPadding.allMedium(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Üye olarak aşağıdaki özelliklerin tadını çıkarma fırsatını yakalayın:',
                  style: TextStyles.body(context),
                ),
                ProjectSpacer.largeHeight(context),
                Padding(
                  padding: ProjectPadding.horizontalXLarge(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• Kişiselleştirilmiş önerilerden faydalanın',
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                      ProjectSpacer.smallHeight(context),
                      Text(
                        '• İzlediğiniz filmleri ve dizileri değerlendirin',
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                      ProjectSpacer.smallHeight(context),
                      Text(
                        '• Geliştirilmiş arama ile istediğiniz içeriği anında bulun',
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                      ProjectSpacer.smallHeight(context),
                      Text(
                        '• İstediğiniz tarzlarda listeler olşuturun ve arkadaşlarınızla paylaşın',
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                    ],
                  ),
                ),
                ProjectSpacer.xLargeHeight(context),
                MiniButton(
                  //isPrimary: false,
                  buttonType: ButtonType.tertiary,
                  title: 'Giriş Yap',
                  onPressed: () {
                    // TODO: Complete the function.
                    //context.router.replaceAll([const AuthNavRoute()]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
