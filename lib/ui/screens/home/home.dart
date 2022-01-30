import 'package:flutter/material.dart';
import 'package:flutter_auth/config/colors.dart';
import 'package:flutter_auth/states/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                  if (state.isIncreasing) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('incremented !'),
                      duration: Duration(milliseconds: 300),
                      backgroundColor: Colors.blueGrey,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    state.value.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: Colors.deepPurple),
                  );
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
