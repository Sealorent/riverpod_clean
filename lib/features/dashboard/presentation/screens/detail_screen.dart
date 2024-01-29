import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/presentation/providers/dashboard_state_provider.dart';
import 'package:flutter_project/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:flutter_project/routes/app_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardNotifierProvider);

    ref.listen(
      dashboardNotifierProvider.select((value) => value),
      ((DashboardState? previous, DashboardState next) {
        //show Snackbar on failure
        if (next.state == DashboardConcreteState.detailProduct) {
          if (next.product != null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }

        if(next.state == DashboardConcreteState.fetchedAllProducts){
          AutoRouter.of(context)
              .pushAndPopUntil(const DashboardRoute(), predicate: (_) => false);
        }

      }),
    );
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () =>  ref.read(dashboardNotifierProvider.notifier).getBack()
        ),
      ),
    );
  }
}