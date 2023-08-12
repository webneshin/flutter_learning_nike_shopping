import 'package:flutter/material.dart';
import 'package:flutter_learning_nike_shopping/generated/assets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(theme.colorScheme.onPrimary),
            foregroundColor: MaterialStateProperty.all(theme.colorScheme.primary)
          ),
        ),
          colorScheme: theme.colorScheme
              .copyWith(onSurface: theme.colorScheme.onInverseSurface),
          scaffoldBackgroundColor: theme.colorScheme.inverseSurface,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: theme.colorScheme.onInverseSurface),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.colorScheme.onInverseSurface),
            ),
          )),
      child: Scaffold(
        // backgroundColor: theme.colorScheme.inverseSurface,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                Assets.imgNikeLogo,
                width: 120,
                color: theme.colorScheme.onInverseSurface,
              )),
              const SizedBox(
                height: 24,
              ),
              Text(
                "خوش آمدید!",
                style: theme.textTheme.titleLarge
                    ?.copyWith(color: theme.colorScheme.onInverseSurface),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "لطفا وارد حساب کاربری خود شوید!",
                style: TextStyle(color: theme.colorScheme.onInverseSurface),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text('آدرس ایمیل'),
                ),
                style: TextStyle(color: theme.colorScheme.onInverseSurface),
              ),
              const SizedBox(
                height: 16,
              ),
              const _PasswordTextField(),
              const SizedBox(
                height: 16,
              ),
              SizedBox(width: double.infinity, height: 36, child: ElevatedButton(onPressed: () {}, child: const Text('ورود'))),
              Row(children: [
                Text(
                    'حساب کاربری ندارید؟',
                  style: TextStyle(color: theme.colorScheme.onInverseSurface),
                ),
                TextButton(
                  onPressed: () {  },
                  child: Text('ثبت نام'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(theme.colorScheme.primaryContainer)
                  ),
                )
              ],)
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    super.key,
  });

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: theme.colorScheme.onInverseSurface.withOpacity(0.5),
            size: 18,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        // suffixIconColor: theme.colorScheme.onInverseSurface,

        label: const Text('رمز عبور'),
      ),
      style: TextStyle(color: theme.colorScheme.onInverseSurface),
    );
  }
}
