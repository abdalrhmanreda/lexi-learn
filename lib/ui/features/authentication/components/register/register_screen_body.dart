import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lexi_learn/config/routes/routes_path.dart';
import 'package:lexi_learn/core/components/custom_navigatation.dart';
import 'package:lexi_learn/ui/features/authentication/components/register/select_gender.dart';

import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../core/components/custom_button.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../core/components/animated_loading_indector.dart';
import '../../../../../core/components/flutter_toast.dart';
import '../../controller/auth_cubit.dart';
import '../common/build_rich_text.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var ageController = TextEditingController();
    var nameController = TextEditingController();
    String gender = '';
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is CreateUserSuccessState) {
          showToast(
              message: 'تم انشاء الحساب بنجاح', state: ToastState.SUCCESS);
        } else if (state is FailureState) {
          showToast(message: state.error, state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: AppConstant.deviceHeight(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRichText(
                        textPartOne: S.of(context).register,
                        textPartTwo: '',
                      ),
                      const Gap(30),
                      CustomTwoTextFromField(
                        textInputType: TextInputType.name,
                        textInputType2: TextInputType.emailAddress,
                        controller1: nameController,
                        controller2: emailController,
                        label1: S.of(context).name,
                        label2: S.of(context).email,
                        isPass: false,
                        isPass2: false,
                        prefixIcon1: IconlyBroken.message,
                        prefixIcon2: IconlyBroken.lock,
                      ),
                      const GenderSelection(),
                      const Gap(10),
                      CustomTwoTextFromField(
                        textInputType: TextInputType.number,
                        textInputType2: TextInputType.visiblePassword,
                        controller1: ageController,
                        controller2: passController,
                        label1: S.of(context).age,
                        label2: S.of(context).pass,
                        isPass: false,
                        isPass2: true,
                        prefixIcon1: IconlyBroken.calendar,
                        prefixIcon2: IconlyBroken.lock,
                      ),
                      const Gap(30),
                      const Gap(20),
                      ConditionalBuilder(
                        condition: state is! LoadingState,
                        builder: (context) => CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.get(context).userRegister(
                                email: emailController.text,
                                password: passController.text,
                                name: nameController.text,
                                age: int.parse(ageController.text),
                              );
                            }
                          },
                          text: S.of(context).register,
                          height: 37.h,
                          color: AppColors.kPrimaryColor,
                          width: AppConstant.deviceWidth(context),
                          horizontal: 0,
                          vertical: 0,
                          radius: 10,
                          textColor: AppColors.kWhiteColor,
                          fontSize: 20,
                        ),
                        fallback: (context) => const AnimatedLoadingIndector(),
                      ),
                      const Gap(30),
                      customTextNextToTextButton(
                          context: context,
                          text: S.of(context).haveAccount,
                          textButton: S.of(context).login,
                          onPressed: () {
                            CustomNavigation.navigateByNamedTo(
                                context, RoutePath.login);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
