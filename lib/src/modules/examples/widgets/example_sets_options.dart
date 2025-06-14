import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misterblast_flutter/src/models/set.dart';

class ExampleSetsOptions extends ConsumerStatefulWidget {
  const ExampleSetsOptions({
    super.key,
    this.selectedSetId,
    required this.sets,
    this.onSetSelected,
  });

  final int? selectedSetId;
  final List<ExampleSet> sets;
  final void Function(int setId)? onSetSelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExampleSetsOptionsState();
}

class _ExampleSetsOptionsState extends ConsumerState<ExampleSetsOptions> {
  bool isScrollable = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        if (_scrollController.position.maxScrollExtent >
            _scrollController.position.minScrollExtent) {
          setState(() {
            isScrollable = true;
          });
        } else {
          setState(() {
            isScrollable = false;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: widget.sets
                  .map(
                    (item) => InkWell(
                      onTap: () => widget.onSetSelected?.call(item.id),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: widget.selectedSetId == item.id
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        child: Text(
                          item.name,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: widget.selectedSetId == item.id
                                        ? Colors.white
                                        : Theme.of(context).colorScheme.primary,
                                  ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        if (isScrollable)
          InkWell(
            onTap: () {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                size: 28,
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
