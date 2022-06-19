class Payload {
  final String model;
  final Map<String, dynamic> filters;
  final String fields;
  final String sort;

  Payload(this.model, this.filters, this.fields, this.sort);

  @override
  String toString() {
    return "Model: $model\nFilters: $filters\nFields: $fields";
  }
}
