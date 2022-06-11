import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HorasTrabajoWidget extends ConsumerStatefulWidget {
  const HorasTrabajoWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HorasTrabajoWidgetState();
}

class _HorasTrabajoWidgetState extends ConsumerState<HorasTrabajoWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Horas de trabajo',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
