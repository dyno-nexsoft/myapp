import 'package:flutter/material.dart';

import '../../../config/assets.gen.dart';
import '../../core/themes/dimens.dart';
import '../view_models/employees_viewmodel.dart';
import 'employees_empty_card.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key, required this.viewModel});

  final EmployeesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          if (viewModel.employees.isEmpty) {
            return EmployeesEmptyCard(viewModel: viewModel);
          } else {
            return child!;
          }
        },
        child: ListView(
          padding: Dimens.of(context).edgeInsetsAll,
          children: [
            ListTileTheme(
              data: ListTileTheme.of(context).copyWith(
                isThreeLine: true,
                titleTextStyle: TextTheme.of(context).titleMedium,
                shape: RoundedRectangleBorder(
                  borderRadius: Dimens.of(context).borderRadiusSmall,
                  side: const BorderSide(),
                ),
                contentPadding: EdgeInsetsDirectional.symmetric(
                  horizontal: Dimens.of(context).paddingSmall,
                ),
              ),
              child: GridView.extent(
                mainAxisSpacing: Dimens.of(context).paddingSmall,
                crossAxisSpacing: Dimens.of(context).paddingSmall,
                maxCrossAxisExtent: 300,
                childAspectRatio: 5 / 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  6,
                  (index) => ClipRect(
                    child: ListTile(
                      title: Text('Product (${index * 2})', maxLines: 1),
                      subtitle: Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: List.generate(
                          index * 2,
                          (index) => CircleAvatar(
                            radius: 16,
                            backgroundImage: AppAssets.images.user.provider(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
