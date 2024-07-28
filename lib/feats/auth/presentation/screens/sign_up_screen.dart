import 'package:dot_coaching/core/core.dart';
import 'package:dot_coaching/feats/feats.dart';
import 'package:dot_coaching/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final msg = Strings.of(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.state == BaseState.failure || state.failure != null) {
          ToastModel(
            message: context.str?.failedSignUp,
            type: ToastType.error,
          ).fire(context);
        }
        if (state.status == AuthStatus.authenticated) {
          ToastModel(
            message: context.str?.successSignUp,
            type: ToastType.success,
          ).fire(context);

          context.read<AuthCubit>().clear();
          context.pushReplacementNamed(AppRoutes.authSignIn.name);
        }
      },
      child: Parent(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/hero/sign-up.png',
                width: 344.w,
                height: 260.w,
              ),
              SizedBox(height: 20.h),
              const SignUpFormWidget(),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                   Text(
                    context.str?.or ?? 'or',
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      height: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    msg?.alreadyHaveAnAccount ?? 'Already have an account?',
                  ),
                  SizedBox(width: 4.w),
                  InkWell(
                    onTap: () => context.pushNamed(AppRoutes.authSignIn.name),
                    child: Text(
                      msg?.signIn ?? 'Sign In',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
