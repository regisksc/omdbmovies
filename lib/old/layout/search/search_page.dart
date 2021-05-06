// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import './search_controller.dart';

// class SearchPage extends StatelessWidget {
//   final controller = Get.find<SearchController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('SearchPage')),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 15,
//             child: Container(
//               padding: EdgeInsets.all(15),
//               child: TextField(
//                 controller: controller.fieldController,
//                 onChanged: (value) => controller.searchQuery.value = value,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.clear),
//                     onPressed: () {
//                       controller.fieldController.clear();
//                       controller.searchQuery.value = '';
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 85,
//             child: Obx(
//               () {
//                 if (controller.isLoading.value == true) return CircularProgressIndicator();
//                 if (controller.listOfMovies.isEmpty) return Text('nothing to show');
//                 return ListView.separated(
//                   itemCount: controller.listOfMovies.length,
//                   separatorBuilder: (context, index) => SizedBox(height: 40),
//                   itemBuilder: (context, index) {
//                     final movie = controller.listOfMovies.elementAt(index);
//                     return Container(
//                       margin: EdgeInsets.symmetric(horizontal: 30),
//                       child: Row(
//                         children: [
//                           Expanded(flex: 4, child: Image.network(movie.poster)),
//                           Expanded(
//                             flex: 6,
//                             child: Column(
//                               children: [
//                                 Text(movie.title),
//                                 Text(movie.type),
//                                 Text(movie.year),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }