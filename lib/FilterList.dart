import 'package:flutter/material.dart';
import 'package:precursorapp/Properties.dart';
import 'package:provider/provider.dart';

class FilterList extends StatelessWidget {
  const FilterList({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => MyProvider(),
        builder: (context, child) => const MaterialApp(
          home: FilterListMain(),
          debugShowCheckedModeBanner: false,
        ),
      );
}

class FilterListMain extends StatefulWidget {
  const FilterListMain({super.key});

  @override
  State<FilterListMain> createState() => _FilterListMainState();
}

class _FilterListMainState extends State<FilterListMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  didChangeDependencies() {
    jobs = {
      'jobs': {...context.watch<MyProvider>().jobItems},
    };

    super.didChangeDependencies();
  }

  void showJobSheet() {
    scaffoldKey.currentState!.showBottomSheet((context) =>
        SlideMenu(job: job, mcontext: context, callback: addJobMethod));
  }

  addJobMethod() {
    print(Provider.of<MyProvider>(context, listen: false).jobItems);
    Provider.of<MyProvider>(context, listen: false).addJob({'location': 'job'});
  }

  Map<String, dynamic>? jobs;

  TextEditingController controller = TextEditingController(),
      job = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _TextField(
                  controller: controller,
                  hint: 'Search for jobs that are available',
                  borderColor: pink,
                  hintColor: grey,
                  textColor: black,
                  icon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, item) =>
                      Text(jobs!['jobs']!.elementAt(item).values.first),
                  itemCount: jobs!['jobs']!.length,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: pureBlue),
              child: IconButton(
                onPressed: showJobSheet,
                icon: Icon(Icons.add, color: white),
              ),
            ),
          ),
        ],
      ),
      key: scaffoldKey,
    );
  }
}

class MyProvider extends ChangeNotifier {
  String changeLocation = 'Mombasa';

  Iterable<Map<String, String>> jobItems = [
    {'Mombasa': 'Teacher'},
    {'Mombasa': 'Soldier'},
    {'Kilifi': 'Chef'},
  ];

  void searchQuery(controller) {
    Iterable<Map<String, String>> onFly = jobItems;
    if (controller.text.isNotEmpty) {
      Iterable<Map<String, String>> queriedJobs = jobItems.where((element) {
        return element.containsKey(controller.text);
      });

      jobItems = [];
      jobItems = [...queriedJobs];
    } else {
      jobItems = onFly;
    }

    notifyListeners();
  }

  void locationChanged(location) {
    changeLocation = location;
    notifyListeners();
  }

  void addJob(Map<String, String> job) {
    jobItems.toList().add(job);
    notifyListeners();
  }
}

class SlideMenu extends StatelessWidget {
  SlideMenu(
      {super.key,
      required this.job,
      required this.mcontext,
      required this.callback});

  final TextEditingController job;

  final BuildContext mcontext;

  final VoidCallback callback;

  final locations = [
    'Mombasa',
    'Nairobi',
    'Nakuru',
    'Kisumu',
    'Kericho',
    'Voi',
    'Kilifi',
    'Kwale',
    'Malindi',
    'Lamu',
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size!.height * .8,
      width: size!.width,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(29)),
        color: pureBlue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: size!.width,
            child: Container(
              height: 4,
              width: size!.width * .2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                color: white,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
              'Want to post a job, feel free to do so right here, make sure to start with the location of the job followed by the job description itself',
              style: TextStyle(color: white)),
          const SizedBox(height: 30),
          Text('Job Location:', style: TextStyle(color: white)),
          const SizedBox(height: 12),
          DropdownButton(
              borderRadius: BorderRadius.circular(19),
              value: context.watch<MyProvider>().changeLocation,
              iconDisabledColor: white,
              iconEnabledColor: white,
              dropdownColor: grey,
              underline: const SizedBox(),
              menuMaxHeight: size!.height * .3,
              style: TextStyle(color: white),
              items: [
                for (var i = 0; i < locations.length; i++)
                  DropdownMenuItem(
                    value: locations[i],
                    child: Text(locations[i]),
                  ),
              ],
              onChanged: (value) {
                context.read<MyProvider>().locationChanged(value);
              }),
          const SizedBox(height: 30),
          Text('Inform possible clients of the nature of your job:',
              style: TextStyle(color: white)),
          const SizedBox(height: 12),
          _TextFieldMultiple(
              controller: job, hintText: 'Enter job decsription here.....'),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: callback,
            child: const _ButtonCustom(
              action: 'Upload job',
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonCustom extends StatelessWidget {
  const _ButtonCustom({Key? key, required this.action}) : super(key: key);
  final String action;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: size!.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: white,
      ),
      child: Text(
        action,
        style: TextStyle(color: black, fontSize: 12),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  _TextField({
    required this.controller,
    required this.hint,
    required this.borderColor,
    required this.hintColor,
    required this.icon,
    required this.textColor,
  });

  TextEditingController controller = TextEditingController();
  final String hint;
  final Color borderColor, hintColor, textColor;
  Widget icon = const SizedBox();
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: borderColor),
      borderRadius: BorderRadius.circular(29),
    );
    return SizedBox(
      height: 40,
      child: TextField(
        style: TextStyle(color: textColor),
        controller: controller,
        decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          hintText: hint,
          hintStyle: TextStyle(color: hintColor),
          suffixIcon: IconButton(
            onPressed: () => context.read<MyProvider>().searchQuery(controller),
            icon: icon,
          ),
        ),
      ),
    );
  }
}

class _TextFieldMultiple extends StatelessWidget {
  _TextFieldMultiple(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);
  OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: white),
    borderRadius: BorderRadius.circular(29),
  );

  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        maxLines: 5,
        minLines: 5,
        style: TextStyle(color: white, fontSize: 12),
        decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          hintText: hintText,
          hintStyle: TextStyle(color: white, fontSize: 12),
        ),
      );
}
