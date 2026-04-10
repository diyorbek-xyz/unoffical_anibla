import 'package:application/features/template/presentation/bloc/template_bloc.dart';
import 'package:application/features/template/presentation/bloc/template_event.dart';
import 'package:application/features/template/presentation/bloc/template_state.dart';
import 'package:application/injection_container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TemplateBloc>()..add(GetTemplate()),
      child: BlocBuilder<TemplateBloc, TemplateState>(
        builder: (context, state) => Text(state.toString()),
      ),
    );
  }
}
