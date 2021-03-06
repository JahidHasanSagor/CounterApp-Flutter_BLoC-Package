import 'package:bloc_todo_list/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  CounterBloc bloc = CounterBloc(CounterState.initial());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
      child: BlocBuilder(
        bloc: bloc,
        buildWhen : (oldState,newState) {
          return false;
        },
        builder: (context,state) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder(
                  bloc: bloc,
                  builder: (context,state){
                    String text = "Counter value is ${state.result}";
                    return Text(text);
                  },
                ),
                new TextField(
                  controller: _controller,
                  decoration: new InputDecoration(labelText: "Enter your number"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
                RaisedButton(
                  onPressed: () => bloc.add(CounterEvent.add(num.parse(_controller.text))),
                  child: const Text('Add', style: TextStyle(fontSize: 20)),
                ),
                RaisedButton(
                  onPressed: () => bloc.add(CounterEvent.subtract(num.parse(_controller.text))),
                  child: const Text('Subtract', style: TextStyle(fontSize: 20)),
                ),
                RaisedButton(
                  onPressed: () => bloc.add(CounterEvent.multiply(num.parse(_controller.text))),
                  child: const Text('Multiply', style: TextStyle(fontSize: 20)),
                ),
                RaisedButton(
                  onPressed: () => bloc.add(CounterEvent.divide(num.parse(_controller.text))),
                  child: const Text('Divide', style: TextStyle(fontSize: 20)),
                ),
              ],
          );
        },
      ),
      ),
    );
  }
}

