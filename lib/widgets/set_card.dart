import 'package:flutter/material.dart';
import 'package:push_up_flutter/models/set_model.dart';
import 'package:push_up_flutter/widgets/counter.dart';

class SetCard extends StatefulWidget {
  const SetCard({
    super.key,
    required this.model,
    this.onChange,
    this.onDelete,
    this.title = "",
    this.defaultOpen = false,
    this.child,
  });

  final SetModel model;
  final Function(SetModel model)? onChange;
  final Function(SetModel model)? onDelete;
  final String title;
  final bool defaultOpen;
  final Widget? child;

  @override
  State<SetCard> createState() => _SetCardState();
}

class _SetCardState extends State<SetCard> with TickerProviderStateMixin {
  bool _open = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _open = widget.defaultOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.hintColor),
          color: theme.colorScheme.surfaceContainerHighest,
        ),
        clipBehavior: Clip.antiAlias,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => setState(() => _open = !_open),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLow.withAlpha(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title),

                      Expanded(
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 250),
                          offset: _open ? Offset.zero : const Offset(0, -2),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: AlignmentGeometry.centerRight,
                            children: [
                              Positioned(
                                top: 65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("${widget.model.reps} rep"),
                                    const SizedBox(width: 10),
                                    Text("${widget.model.weight} kg"),
                                  ],
                                ),
                              ),
                              widget.onDelete != null
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _open = false;
                                        });
                                        widget.onDelete?.call(widget.model);
                                      },
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                      icon: Icon(Icons.delete),
                                      iconSize: 20,
                                      constraints: BoxConstraints(
                                        maxHeight: 30,
                                        maxWidth: 30,
                                      ),
                                    )
                                  : SizedBox(height: 30, width: 30),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (_open)
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reps:"),
                          widget.onChange != null
                              ? Counter(
                                  value: widget.model.reps,
                                  unit: "rep",
                                  onChange: (v) {
                                    widget.model.reps = v;
                                    widget.onChange?.call(widget.model);
                                  },
                                )
                              : Text("${widget.model.reps} rep"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Weight:"),
                          widget.onChange != null
                              ? Counter(
                                  value: widget.model.weight,
                                  unit: "kg",
                                  onChange: (v) {
                                    widget.model.weight = v;
                                    widget.onChange?.call(widget.model);
                                  },
                                )
                              : Text("${widget.model.weight} kg"),
                        ],
                      ),
                      if (widget.child != null) widget.child!,
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
