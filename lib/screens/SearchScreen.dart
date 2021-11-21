import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';
import 'package:zap/models/locations.dart';

import '../loading.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  @override
  Widget build(BuildContext context) {
    return FirestoreSearchScaffold(
      firestoreCollectionName: 'offices',
      searchBy: 'name',
      appBarBackgroundColor: Color(appbarcolor),
      scaffoldBackgroundColor: Color(scaffoldcolor),
      scaffoldBody: const Center(child: Text('Search for a location')),
      dataListFromSnapshot: LocationModel().dataListFromSnapshot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<LocationModel>? dataList = snapshot.data;
          return ListView.builder(
              itemCount: dataList?.length ?? 0,
              itemBuilder: (context, index) {
                final LocationModel data = dataList![index];
                return ListTile(
                  onTap: (){
                    
                  },
                  title: Text(
                        '${data.name}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                  subtitle: Text('${data.region}',
                          style: Theme.of(context).textTheme.bodyText1),
                );
              });
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No Results Returned'),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
