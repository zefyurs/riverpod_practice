import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/layout/default_layout.dart';
import 'package:riverpod_practice/riverpod/family_modifier_provider.dart';
import 'package:riverpod_practice/screen/autu_dispose_modifier_screen.dart';
import 'package:riverpod_practice/screen/famaily_modifier_screen.dart';
import 'package:riverpod_practice/screen/listen_provier_screen.dart';
import 'package:riverpod_practice/screen/provider_screen.dart';
import 'package:riverpod_practice/screen/select_provider_screen.dart';
import 'package:riverpod_practice/screen/state_notifier_provider_screen.dart';
import 'package:riverpod_practice/screen/state_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home',
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StateProviderScreen()));
              },
              child: const Text('StateProviderScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => StateNotifierProviderScreen()));
              },
              child: const Text('StateNotifierProviderScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => FamilyModifierScreen()));
              },
              child: const Text('FamilyModifierScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AutoDisposeModifierScreen()));
              },
              child: const Text('AutoDisposeModifierScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListenProviderScreen()));
              },
              child: const Text('ListenProviderScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => SelectProviderScreen()));
              },
              child: const Text('Selection provider Screen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProviderScreen()));
              },
              child: const Text('Provider Screen')),
        ],
      ),
    );
  }
}
