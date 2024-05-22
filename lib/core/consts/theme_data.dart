import 'package:flutter/material.dart';
import 'app_color.dart';

class Styles {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkTheme
            ? AppColor.darkscaffoldcolor
            : AppColor.lightscaffoldcolor,
        cardColor: isDarkTheme
            ? const Color.fromARGB(255, 13, 6, 37)
            : AppColor.lightcardcolor,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
          iconTheme:
          IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
          backgroundColor: isDarkTheme
              ? AppColor.darkscaffoldcolor
              : AppColor.lightscaffoldcolor,
          elevation: 0.0,
          centerTitle: false,
          titleTextStyle:
          TextStyle(color: isDarkTheme ? Colors.white : Colors.black),
        ),
        // inputDecorationTheme: InputDecorationTheme(
        //   filled: true,
        //   contentPadding: const EdgeInsets.all(10.0),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //       width: 1.0,
        //       color: Colors.transparent,
        //     ),
        //     borderRadius: BorderRadius.circular(8.0),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       width: 1.0,
        //       color: isDarkTheme? Colors.white : Colors.black,
        //     ),
        //     borderRadius: BorderRadius.circular(8.0),
        //   ),
        //   errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         width: 1.0,
        //         color: Theme.of(context).colorScheme.error
        //     ),
        //     borderRadius: BorderRadius.circular(8.0),
        //   ),
        //   focusedErrorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         width: 1.0,
        //         color: Theme.of(context).colorScheme.error
        //     ),
        //     borderRadius: BorderRadius.circular(8.0),
        //   ),
        // )
    );
  }
}
