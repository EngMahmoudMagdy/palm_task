import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_task/features/data_list/presentation/bloc/home_cubit.dart';
import 'package:palm_task/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = di<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Consuming Home Cubit to update UI when a new state is there
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Initial state with elevated button to load data
              if (state is HomeInitial)
                Center(
                  child: ElevatedButton(
                    onPressed: loadData,
                    child: Text('Load Data'),
                  ),
                ),
              //Home Loading indicator
              if (state is HomeLoading)
                Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
              //If there's an error, we show this text
              if (state is HomeError)
                Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ),
              //When data loaded we show them in list tiles
              if (state is HomeDataLoaded)
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = state.dataList[index];
                    return ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        item.description,
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    );
                  },
                  itemCount: state.dataList.length,
                ),
            ],
          ),
        );
      },
    );
  }

  void loadData() {
    homeCubit.getDataList();
  }
}
