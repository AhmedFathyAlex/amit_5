import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Tst extends StatelessWidget {
  const Tst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLifecycleDisplay(),
    );
  }
}

class AppLifecycleDisplay extends StatefulWidget {
   AppLifecycleDisplay({super.key});
  @override
  State<AppLifecycleDisplay> createState() => _AppLifecycleDisplayState();
}

class _AppLifecycleDisplayState extends State<AppLifecycleDisplay> {
 late final AppLifecycleListener _listener;
  final ScrollController _scrollController = ScrollController();
  final List<String> _states = <String>[];
  late AppLifecycleState? _state;

  
   @override
  void initState() {
    super.initState();
    _state = SchedulerBinding.instance.lifecycleState;
    _listener = AppLifecycleListener(
      // Event handlers...
      // onShow: () {
      //   log('onShow');
      // },
      // onDetach: () {
      //   log('onDetach');
      // },
      // onHide: () {
      //   log('onHide');
      // },
      // onPause: () {
      //   log('onPause');
      // },
      // onRestart: () {
      //   log('onRestart');
      // },
      // onResume: () {
      //   log('onResume');
      // },
      onDetach: () {
        log('App is Killed');
      },
      onStateChange: (value) {
        log('State Changed from $_state to $value');
        _handleStateChange(value);
        _handleTransition(value.name);

      },
    );
    if (_state != null) {
      _states.add(_state!.name);
    }
  }
  void _handleTransition(String name) {
  setState(() {
    _states.add(name);
  });

  _scrollController.animateTo(
    _scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeOut,
  );
}

void _handleStateChange(AppLifecycleState state) {
  setState(() {
    _state = state;
  });
}
  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('App LifeCycle State'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: <Widget>[
                    Text('Current State: ${_state ?? 'Not initialized yet'}'),
                    const SizedBox(height: 30),
                    Text('State History:\n  ${_states.join('\n  ')}'),
                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context) {
                return Scaffold(appBar: AppBar(),);
              },));
            }, child: Text('Click'))
          ],
        ),
      ),
    );
  }
}