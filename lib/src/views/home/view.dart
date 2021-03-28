import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lib/src/blocs/counter_bloc.dart';
import 'package:flutter_bloc_lib/src/events/counter_event.dart';
import 'package:flutter_bloc_lib/src/middlewares/navigator_middleware.dart';
import 'package:flutter_bloc_lib/src/routes/app_pages.dart';
import 'package:flutter_bloc_lib/src/theme/theme.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (_, count) {
          return Center(
            child: Text('$count', style: Theme.of(context).textTheme.headline1),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'increment',
              child: const Icon(Icons.add),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterEvent.increment),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'decrement',
              child: const Icon(Icons.remove),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterEvent.decrement),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.brightness_6),
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'error',
              backgroundColor: Colors.red,
              child: const Icon(Icons.error),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterEvent.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 'navigator',
              backgroundColor: Colors.green,
              child: const Icon(Icons.forward),
              onPressed: () =>
                  NavigatorMiddleware.pushScreen(context, Routes.PROFILE),
            ),
          ),
        ],
      ),
    );
  }
}
