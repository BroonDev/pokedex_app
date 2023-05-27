import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/core.dart';
import '../store/home_store.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    Key? key,
    required this.filterController,
  }) : super(key: key);

  final TextEditingController? filterController;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  HomeStore homeStore = GetIt.instance<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: TextField(
          controller: widget.filterController,
          onChanged: (value) {
            homeStore.filterList(value);
          },
          style: AppTextStyles.body2.copyWith(color: AppColors.darkColor),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(bottom: 8, top: 8, left: 12, right: 16),
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              prefixIcon:
                  const Icon(AppIcons.search, color: AppColors.primaryColor),
              hintText: AppConsts.searchBarHintText,
              hintStyle:
                  AppTextStyles.body2.copyWith(color: AppColors.mediumColor),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.white)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.white))),
        ),
      ),
    );
  }
}
