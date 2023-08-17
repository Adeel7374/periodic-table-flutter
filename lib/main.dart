import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

void main() => runApp(PeriodicTableApp());

class PeriodicTableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Periodic Table',
      home: BlocProvider(
        create: (context) => PeriodicTableBloc(),
        child: PeriodicTableScreen(),
      ),
    );
  }
}

class PeriodicTableBloc extends Cubit<PeriodicTableState> {
  PeriodicTableBloc() : super(PeriodicTableInitial());

  // Define methods and logic for fetching periodic table data here

  // This is just a placeholder, replace with actual logic
  Future<void> fetchPeriodicTableData() async {
    // Simulate data fetching delay
    await Future.delayed(Duration(seconds: 2));

    // Emit a new state to represent the fetched data
    emit(PeriodicTableFetched());
  }
}

abstract class PeriodicTableState extends Equatable {
  const PeriodicTableState();

  @override
  List<Object> get props => [];
}

class PeriodicTableInitial extends PeriodicTableState {}

class PeriodicTableFetched extends PeriodicTableState {}

class PeriodicTableScreen extends StatefulWidget {
  @override
  State<PeriodicTableScreen> createState() => _PeriodicTableScreenState();
}

class _PeriodicTableScreenState extends State<PeriodicTableScreen> {
  late final PeriodicTableBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<PeriodicTableBloc>(context);
    _bloc.fetchPeriodicTableData(); // Fetch periodic table data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Periodic Table'),
      ),
      body: BlocBuilder<PeriodicTableBloc, PeriodicTableState>(
        builder: (context, state) {
          if (state is PeriodicTableFetched) {
            // The periodic table data has been fetched
            return _buildGrid();
          } else if (state is PeriodicTableInitial) {
            // The periodic table data is still being fetched
            return const Center(child: CircularProgressIndicator());
          } else {
            // An error occurred while fetching the periodic table data
            return const Center(child: Text('An error occurred'));
          }
        },
      ),
    );
  }

  Widget _buildGrid() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 3,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 118,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          'Element $index',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
