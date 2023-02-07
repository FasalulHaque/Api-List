import 'package:api_test3/fetchData.dart';
import 'package:api_test3/model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Data'),
          centerTitle: true,
        ),
        body: FutureBuilder<TestCase>(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot<TestCase> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data?.data;
              // print(data);
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 9,
                  mainAxisExtent: 270,
                ),
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final Datum datum = data[index];
                  print('------------------------------');
                  print(datum);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("${datum.avatar}"),
                      Text(snapshot.data!.total.toString()),
                      Text('${datum.email}'),
                      Text('${datum.firstName}'),
                      Text('${datum.lastName}'),
                      Text(snapshot.data!.page.toString()),
                    ],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
