// // import 'package:betak/features/categorie_products/presentation/cubit/categorie_products_cubit.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// //
// // import '../../../../../core/utils/styles.dart';
// //
// // class CustomSearchTextField extends StatelessWidget {
// //   const CustomSearchTextField({super.key, required this.screenWidth});
// //
// //   final double screenWidth;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final TextEditingController searchController = TextEditingController();
// //
// //     return Container(
// //       height: 55,
// //       width: screenWidth * .85,
// //       decoration: BoxDecoration(
// //         color: const Color(0xFFF3F7F8),
// //         borderRadius: BorderRadius.circular(15),
// //       ),
// //       child: Center(
// //         child: TextField(
// //           controller: searchController,
// //           decoration: InputDecoration(
// //             contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
// //             border: InputBorder.none,
// //             hintText: 'البحث عن المنتج',
// //             hintStyle: Styles.styleRegularInter16.copyWith(
// //               color: const Color(0xFF455A64),
// //               fontWeight: FontWeight.w500,
// //             ),
// //             suffixIcon: const Icon(
// //               Icons.search,
// //               color: Color(0xFF455A64),
// //               size: 30,
// //             ),
// //           ),
// //           style: const TextStyle(color: Colors.black),
// //           onChanged: (query) {
// //             context.read<CategorieProductsCubit>().searchProducts(query);
// //           },
// //
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:betak/core/utils/string_manager.dart';
// import 'package:betak/features/categorie_products/data/models/products_model.dart';
// import 'package:betak/features/categorie_products/presentation/cubit/categorie_products_cubit.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/utils/styles.dart';
//
// class CustomSearchTextField extends StatefulWidget {
//   const CustomSearchTextField({super.key, required this.screenWidth});
//
//   final double screenWidth;
//
//   @override
//   State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
// }
//
// class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
//   List<ProductsModel> searchHistory = [];
//
//   Iterable<Widget> getHistoryList(SearchController controller) {
//     return searchHistory.map(
//           (ProductsModel product) => ListTile(
//         leading: const Icon(Icons.history),
//         title: Text(product.pname!),
//         trailing: IconButton(
//           icon: const Icon(Icons.call_missed),
//           onPressed: () {
//             controller.text = product.pname!;
//             controller.selection =
//                 TextSelection.collapsed(offset: controller.text.length);
//             context.read<CategorieProductsCubit>().searchProducts( controller.text);
//
//           },
//         ),
//       ),
//     );
//   }
//
//
//   Iterable<Widget> getSuggestions(SearchController controller) {
//     final String input = controller.value.text;
//     final List<ProductsModel> products =
//         context.read<CategorieProductsCubit>().allProducts;
//
//     // Use a Set to track unique product names
//     final Set<String> seenProductNames = {};
//
//     // Filter products and remove duplicates based on pname
//     final filteredProducts = products.where((product) {
//       final pname = product.pname!.toLowerCase();
//       if (seenProductNames.contains(pname)) {
//         return false; // Skip duplicate
//       } else {
//         seenProductNames.add(pname);
//         return true; // Keep first occurrence
//       }
//     }).where((product) => product.pname!.toLowerCase().contains(input.toLowerCase())).toList();
//
//     return filteredProducts.map(
//           (ProductsModel product) => ListTile(
//         leading: const Icon(Icons.shopping_cart, color: Colors.blue),
//         title: Text(product.pname!),
//         trailing: IconButton(
//           icon: const Icon(Icons.call_missed),
//           onPressed: () {
//             controller.text = product.pname!;
//             controller.selection =
//                 TextSelection.collapsed(offset: controller.text.length);
//             context.read<CategorieProductsCubit>().searchProducts(controller.text);
//           },
//         ),
//         onTap: () {
//           controller.closeView(product.pname!);
//           handleSelection(product);
//         },
//       ),
//     );
//   }
//
//
//   void handleSelection(ProductsModel selectedProduct) {
//     setState(() {
//       searchHistory.removeWhere((product) => product.pname == selectedProduct.pname);
//       if (searchHistory.length >= 5) {
//         searchHistory.removeLast();
//       }
//       searchHistory.insert(0, selectedProduct);
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SearchAnchor.bar(
//       searchController: _searchController, // Attach controller here
//
//       barHintText: AppStrings.searchAboutProduct.tr(),
//       barOverlayColor: MaterialStateProperty.all(Colors.white),
//       constraints: BoxConstraints(
//         maxWidth: widget.screenWidth * 0.85,
//         minHeight: 55,
//       ),
//
//       barBackgroundColor: const MaterialStatePropertyAll(Color(0xFFF3F7F8)),
//       barShape: MaterialStatePropertyAll(
//         RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       barHintStyle: MaterialStatePropertyAll(
//         Styles.styleRegularInter16.copyWith(
//           color: const Color(0xFF455A64),
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       suggestionsBuilder: (context, controller) {
//
//         if (controller.text.isEmpty) {
//           if (searchHistory.isNotEmpty) {
//             return getHistoryList(controller);
//           }
//           return [
//              Center(
//               child: Text(
//                 AppStrings.emptySearchHistory.tr(),
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//           ];
//         }
//         return getSuggestions(controller);
//       },
//       viewLeading: GestureDetector(
//         onTap: () {
//           context.read<CategorieProductsCubit>().searchProducts(Wedgcontroller.text);
//
//         },
//         child: Icon(Icons.arrow_back), // Replace with any widget you want
//       ),
//       onChanged: (query){
//         print("********************************************************************************************************************11");
//         context.read<CategorieProductsCubit>().searchProducts(query);
//
//       },
//     );
//   }
// }
import 'package:betak/core/utils/string_manager.dart';
import 'package:betak/features/categorie_products/data/models/products_model.dart';
import 'package:betak/features/categorie_products/presentation/cubit/categorie_products_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  List<ProductsModel> searchHistory = [];
  final SearchController _searchController = SearchController();

  Iterable<Widget> getHistoryList(SearchController controller) {
    return searchHistory.map(
          (ProductsModel product) => ListTile(
        leading: const Icon(Icons.history),
        title: Text(product.pname!),
        trailing: IconButton(
          icon: const Icon(Icons.call_missed),
          onPressed: () {
            controller.text = product.pname!;
            controller.selection =
                TextSelection.collapsed(offset: controller.text.length);
            context.read<CategorieProductsCubit>().searchProducts(controller.text);
          },
        ),
      ),
    );
  }

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String input = controller.value.text;
    final List<ProductsModel> products =
        context.read<CategorieProductsCubit>().allProducts;

    final Set<String> seenProductNames = {};

    final filteredProducts = products.where((product) {
      final pname = product.pname!.toLowerCase();
      if (seenProductNames.contains(pname)) {
        return false;
      } else {
        seenProductNames.add(pname);
        return true;
      }
    }).where((product) => product.pname!.toLowerCase().contains(input.toLowerCase())).toList();

    return filteredProducts.map(
          (ProductsModel product) => ListTile(
        leading: const Icon(Icons.shopping_cart, color: Colors.blue),
        title: Text(product.pname!),
        trailing: IconButton(
          icon: const Icon(Icons.call_missed),
          onPressed: () {
            controller.text = product.pname!;
            controller.selection =
                TextSelection.collapsed(offset: controller.text.length);
            context.read<CategorieProductsCubit>().searchProducts(controller.text);
          },
        ),
        onTap: () {
          controller.closeView(product.pname!);
          handleSelection(product);
        },
      ),
    );
  }

  void handleSelection(ProductsModel selectedProduct) {
    setState(() {
      searchHistory.removeWhere((product) => product.pname == selectedProduct.pname);
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      searchHistory.insert(0, selectedProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      searchController: _searchController,
      barHintText: AppStrings.searchAboutProduct.tr(),
      barOverlayColor: MaterialStateProperty.all(Colors.white),
      constraints: BoxConstraints(
        maxWidth: widget.screenWidth * 0.85,
        minHeight: 55,
      ),
      barBackgroundColor: const MaterialStatePropertyAll(Color(0xFFF3F7F8)),
      barShape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      barHintStyle: MaterialStatePropertyAll(
        Styles.styleRegularInter16.copyWith(
          color: const Color(0xFF455A64),
          fontWeight: FontWeight.w500,
        ),
      ),
      suggestionsBuilder: (context, controller) {
        if (controller.text.isEmpty) {
          if (searchHistory.isNotEmpty) {
            return getHistoryList(controller);
          }
          return [
            Center(
              child: Text(
                AppStrings.emptySearchHistory.tr(),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ];
        }
        return getSuggestions(controller);
      },
      viewLeading: GestureDetector(
        onTap: () {

          context.read<CategorieProductsCubit>().searchProducts(_searchController.text);
          Navigator.of(context).pop();

        },
        child: Icon(Icons.arrow_back),
      ),
      onChanged: (query) {
        context.read<CategorieProductsCubit>().searchProducts(query);
      },
    );
  }
}
