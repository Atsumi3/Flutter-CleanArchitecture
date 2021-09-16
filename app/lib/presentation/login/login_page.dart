import 'package:app/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  Widget _buildUserName() {
    return HookConsumer(builder: (context, ref, widget) {
      final user = ref
          .watch(loginControllerProvider.select((value) => value.currentUser));
      if (user == null) {
        return Container();
      } else {
        return Text(user.name);
      }
    });
  }

  Widget _buildActionButton() {
    return HookConsumer(builder: (context, ref, widget) {
      final user = ref
          .watch(loginControllerProvider.select((value) => value.currentUser));
      if (user == null) {
        return _ActionButton(
            text: "ログイン",
            onTap: () {
              ref.read(loginControllerProvider.notifier).onLoginTap();
            });
      } else {
        return _ActionButton(
            text: "ログアウト",
            onTap: () {
              ref.read(loginControllerProvider.notifier).onLogoutTap();
            });
      }
    });
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildActionButton(),
        const SizedBox(height: 8),
        _buildUserName(),
      ],
    );
  }

  void _loadFirst(WidgetRef ref) {
    ref.read(loginControllerProvider.notifier).load();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _loadFirst(ref);
    return Scaffold(
      body: Center(
        child: _buildBody(),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _ActionButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onTap,
        child: Text(
          text,
        ),
      );
}
