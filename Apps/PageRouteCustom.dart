import 'package:flutter/material.dart';
import 'package:precursorapp/Properties.dart';

class CustomRoutePage extends StatelessWidget {
  const CustomRoutePage({super.key});

  @override
  Widget build(BuildContext context) =>const MaterialApp(
    home: CustomRoutePageMain(),
    debugShowCheckedModeBanner: false,
  );
}

class CustomRoutePageMain extends StatefulWidget {
  const CustomRoutePageMain({super.key});

  @override
  State<CustomRoutePageMain> createState() => _CustomRoutePageMainState();
}

class _CustomRoutePageMainState extends State<CustomRoutePageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1'),centerTitle: true,),
      body: Center(child: TextButton(onPressed: (){
        Navigator.of(context).push(
          CustomRoute(child: const SecondPage()),
        );
      }, child: const Text('Open page 2')),),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Page 2'),backgroundColor:pink),
      body: Center(child:TextButton(onPressed:(){
        Navigator.of(context).pop();
      },child:const Text('Pop this page')),),
    );
  }
}

class CustomRoute extends PageRouteBuilder{
  CustomRoute({required this.child}):super(
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder:(BuildContext context,animation,secondaryAnimation)=>child );
  final Widget child;

  @override 
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) => SlideTransition(position: Tween(begin: const Offset(0, 1),end: Offset.zero).animate(animation),child: child,);
}