import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../needs/presentation/bloc/needs_bloc.dart';
import '../../../needs/presentation/bloc/needs_event.dart';
import '../../../needs/presentation/bloc/needs_state.dart';

/// Tab widget rendering the public aid needs list.
class NeedsTab extends StatelessWidget {
  /// Creates a [NeedsTab].
  const NeedsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NeedsBloc>(
      create: (_) => sl<NeedsBloc>()..add(const FetchNeedsEvent()),
      child: Builder(
        builder: (context) {
          return BlocBuilder<NeedsBloc, NeedsState>(
            builder: (context, state) {
              return switch (state) {
                NeedsInitial() || NeedsLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                NeedsError(message: final msg) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error loading needs: $msg',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          context.read<NeedsBloc>().add(
                            const FetchNeedsEvent(),
                          );
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
                NeedsLoaded(needs: final list) => RefreshIndicator(
                  onRefresh: () async {
                    context.read<NeedsBloc>().add(const FetchNeedsEvent());
                  },
                  child: list.isEmpty
                      ? ListView(
                          children: const [
                            SizedBox(height: 120),
                            Center(
                              child: Text(
                                'No needs available at the moment.',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final need = list[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                  child: const Icon(Icons.volunteer_activism),
                                ),
                                title: Text(
                                  need.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  need.brief ?? need.categoryName,
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Chip(
                                      label: Text(
                                        need.granted ? 'Granted' : 'Pending',
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                      visualDensity: VisualDensity.compact,
                                      padding: EdgeInsets.zero,
                                      backgroundColor: need.granted
                                          ? Colors.green.shade100
                                          : Colors.amber.shade100,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              };
            },
          );
        },
      ),
    );
  }
}
