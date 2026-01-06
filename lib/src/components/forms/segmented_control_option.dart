class SegmentedControlOption {
  final String label;
  final String value;
  final bool disabled;

  SegmentedControlOption({
    required this.label,
    required this.value,
    this.disabled = false,
  });
}