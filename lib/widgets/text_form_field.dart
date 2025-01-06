import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workerapp/blocs/worker_bloc/worker_bloc.dart';

class SearchTextFormField extends StatefulWidget {
  final TextEditingController controller;

  // Constructor
  SearchTextFormField({
    super.key,
    required this.controller,
  });

  @override
  _SearchTextFormFieldState createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  late WorkerBloc newsBloc;

  @override
  void initState() {
    super.initState();
    newsBloc = BlocProvider.of<WorkerBloc>(context); // Get the bloc from context
    newsBloc.add(GetProjectList()); // Initial fetch when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: TextFormField(
          controller: widget.controller,
          onChanged: (query) => searchCovid(query),
          decoration: InputDecoration(
            hintText: 'Search Projects',
            hintStyle: TextStyle(fontSize: 15),
            suffixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a search term';
            }
            return null; // Return null if valid
          },
        ),
      ),
    );
  }

  searchCovid(String? query) {
    if (query!.isNotEmpty) {
      newsBloc.add(GetProjectList(query: query)); // Trigger search event with query
    } else {
      newsBloc.add(GetProjectList()); // Fetch the complete list if query is empty
    }
  }
}
