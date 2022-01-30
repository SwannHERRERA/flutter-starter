import 'package:flutter/material.dart';
import 'package:flutter_auth/config/colors.dart';
import 'package:flutter_auth/states/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final increseSnackbar = const SnackBar(
    backgroundColor: Colors.yellow,
    content: Text('Increase'),
    duration: Duration(milliseconds: 100),
  );
  final descreaseSnackbar = const SnackBar(
    backgroundColor: Colors.cyan,
    content: Text('descrase'),
    duration: Duration(milliseconds: 100),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(color: AppColors.lightBlue, width: 2.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrease();
                },
                icon: const Icon(Icons.arrow_left),
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.value > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(increseSnackbar);
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(descreaseSnackbar);
                  }
                },
                builder: (context, state) {
                  return Text(state.value.toString());
                },
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                icon: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
