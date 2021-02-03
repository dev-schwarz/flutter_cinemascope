import 'package:flutter/material.dart';

class LabeledDropdown<T> extends StatelessWidget {
  const LabeledDropdown({
    Key key,
    @required this.label,
    @required this.value,
    @required this.items,
    @required this.itemBuilder,
    @required this.onChanged,
    this.padding = const EdgeInsets.all(16.0),
  })  : assert(label != null, 'label must not be null'),
        assert(value != null, 'value must not be null'),
        assert(items != null, 'items must not be null'),
        assert(itemBuilder != null, 'itemBuilder must not be null'),
        super(key: key);

  final String label;
  final T value;
  final List<T> items;
  final String Function(T) itemBuilder;
  final ValueChanged<T> onChanged;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          const SizedBox(width: 24.0, height: 24.0),
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            flex: 2,
            child: DropdownButton<T>(
              isExpanded: true,
              value: value,
              items: items.map<DropdownMenuItem<T>>((i) {
                return DropdownMenuItem<T>(
                  value: i,
                  child: Text(
                    itemBuilder(i),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: onChanged == null ? null : (T newValue) => onChanged(newValue),
              style: Theme.of(context).textTheme.subtitle1,
              // underline: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
