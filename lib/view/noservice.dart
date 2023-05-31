// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:zero_scarp/allpackages.dart';

class Noservice extends StatefulWidget {
  const Noservice({super.key});

  @override
  State<Noservice> createState() => _NoserviceState();
}

class _NoserviceState extends State<Noservice> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("No Service in this area"),
        ),
      ),
    );
  }
}
