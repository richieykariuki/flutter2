import 'package:flutter/material.dart';

class AnimatedlistDesign extends StatelessWidget {
  const AnimatedlistDesign({super.key});

  @override
  Widget build(BuildContext context) =>const MaterialApp(
    home: AnimatedListDesignMain(),
    debugShowCheckedModeBanner: false,
  );
}


class AnimatedListDesignMain extends StatefulWidget {
  const AnimatedListDesignMain({super.key});

  @override
  State<AnimatedListDesignMain> createState() => _AnimatedListDesignMainState();
}

class _AnimatedListDesignMainState extends State<AnimatedListDesignMain> {

final items = [
  'one','two','three','four','five'
];

final keyState = GlobalKey<AnimatedListState>();

void clearItems(item) {
  keyState.currentState!.removeItem(item, (context, animation) {
final removedItem = items.removeAt(item);
return SizeTransition(sizeFactor:animation, child: ListTile(title: Text(removedItem),));
  },duration: const Duration(milliseconds: 300));
  setState(() {
    
  });
}


void addItems(){
  items.insert(items.length, 'added ${items.length}');
  keyState.currentState!.insertItem(items.length-1);
  setState(() {
    
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(16),child: AnimatedList(
        initialItemCount: items.length,
        key: keyState,
        itemBuilder: (context,item,animation){
return SlideTransition(position: Tween(begin: const Offset(1, 0),end: Offset.zero).animate(animation),
child: ListTile(title: Text(items[item]),trailing:  IconButton(onPressed:()=>clearItems(item),icon:const Icon (Icons.clear)),),);
      },),),
      floatingActionButton: FloatingActionButton(onPressed: addItems,child: const Icon(Icons.home),),
    );
  }
}