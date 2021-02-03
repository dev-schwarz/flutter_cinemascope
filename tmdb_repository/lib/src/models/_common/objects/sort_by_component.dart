abstract class SortBy {
  SortBy(int index, List<String> values)
      : prefix = SortPrefix(index, values),
        order = SortOrder.asc;

  final SortPrefix prefix;
  SortOrder order;

  SortBy copy();

  SortBy setPrefix(SortBy other) {
    if (other != null && other.runtimeType == runtimeType) {
      prefix._index = other.prefix._index;
    }
    return this;
  }

  SortBy get asc => this..order = SortOrder.asc;

  SortBy get desc => this..order = SortOrder.desc;

  String get prefixString => prefix.toString();

  String get orderString => _orderValues[order.index];

  @override
  String toString() => prefixString == null ? null : '$prefixString.$orderString';

  @override
  bool operator ==(Object other) {
    return (other != null && other is SortBy && other.runtimeType == runtimeType)
        ? other.prefix == prefix && other.order.index == order.index
        : false;
  }

  @override
  int get hashCode => prefix.hashCode + order.index.hashCode;

  static const Map<int, String> _orderValues = <int, String>{0: 'asc', 1: 'desc'};
}

class SortPrefix {
  SortPrefix(this._index, List<String> values) : _sortValues = values.asMap();

  final Map<int, String> _sortValues;

  int get index => _index;
  int _index;

  @override
  String toString() => _sortValues[_index] == null ? null : _sortValues[_index];

  @override
  bool operator ==(Object other) =>
      (other != null && other is SortPrefix && other.runtimeType == runtimeType)
          ? other._index == _index
          : false;

  @override
  int get hashCode => _index.hashCode + _sortValues.hashCode;
}

enum SortOrder { asc, desc }
