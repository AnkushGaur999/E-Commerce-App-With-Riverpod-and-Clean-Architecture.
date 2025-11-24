import 'package:flutter/material.dart';
import 'package:plux/src/data/models/product/dimensions.dart';
import 'package:plux/src/data/models/product/product_model.dart';
import 'package:plux/src/presentation/views/product/widgets/product_detail_row.dart';

List<Widget> buildSpecificationRows(ProductModel product) {
  final rows = <Widget>[];

  void addRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    rows.add(DetailRow(icon: icon, label: label, value: value));
  }

  if (product.brand != null) {
    addRow(icon: Icons.factory_outlined, label: 'Brand', value: product.brand!);
  }

  if (product.category != null) {
    addRow(
      icon: Icons.category_outlined,
      label: 'Category',
      value: product.category!,
    );
  }

  if (product.sku != null) {
    addRow(icon: Icons.qr_code_2_rounded, label: 'SKU', value: product.sku!);
  }

  if (product.weight != null) {
    addRow(
      icon: Icons.monitor_weight_outlined,
      label: 'Weight',
      value: '${product.weight} g',
    );
  }

  final dimensions = formatDimensions(product.dimensions);
  if (dimensions.isNotEmpty) {
    addRow(
      icon: Icons.straighten_rounded,
      label: 'Dimensions',
      value: dimensions,
    );
  }

  if (product.minimumOrderQuantity != null) {
    addRow(
      icon: Icons.format_list_numbered_rtl,
      label: 'Minimum order',
      value: '${product.minimumOrderQuantity} unit(s)',
    );
  }

  return rows;
}

List<Widget> buildLogisticsRows(ProductModel product) {
  final rows = <Widget>[];

  void addRow({
    required IconData icon,
    required String label,
    required String? value,
  }) {
    if (value == null || value.trim().isEmpty) return;
    rows.add(DetailRow(icon: icon, label: label, value: value.trim()));
  }

  addRow(
    icon: Icons.local_shipping_outlined,
    label: 'Shipping',
    value: product.shippingInformation,
  );
  addRow(
    icon: Icons.shield_outlined,
    label: 'Warranty',
    value: product.warrantyInformation,
  );
  addRow(
    icon: Icons.assignment_return_outlined,
    label: 'Return policy',
    value: product.returnPolicy,
  );
  addRow(
    icon: Icons.event_available_outlined,
    label: 'Availability',
    value: product.availabilityStatus,
  );

  return rows;
}

List<Widget> buildMetaRows(ProductModel product) {
  final rows = <Widget>[];
  final meta = product.meta;

  void addRow({
    required IconData icon,
    required String label,
    required String? value,
  }) {
    if (value == null || value.trim().isEmpty) return;
    rows.add(DetailRow(icon: icon, label: label, value: value.trim()));
  }

  addRow(
    icon: Icons.confirmation_number,
    label: 'Barcode',
    value: meta?.barcode,
  );
  addRow(
    icon: Icons.qr_code_scanner_rounded,
    label: 'QR code',
    value: meta?.qrCode,
  );
  addRow(
    icon: Icons.calendar_today_outlined,
    label: 'Created',
    value: formatDate(meta?.createdAt),
  );
  addRow(
    icon: Icons.update,
    label: 'Updated',
    value: formatDate(meta?.updatedAt),
  );

  return rows;
}

String formatDimensions(Dimensions? dimensions) {
  if (dimensions == null) return '';
  final segments = <String>[];
  if (dimensions.width != null) {
    segments.add('${dimensions.width!.toStringAsFixed(1)} W');
  }
  if (dimensions.height != null) {
    segments.add('${dimensions.height!.toStringAsFixed(1)} H');
  }
  if (dimensions.depth != null) {
    segments.add('${dimensions.depth!.toStringAsFixed(1)} D');
  }
  if (segments.isEmpty) return '';
  return '${segments.join(' × ')} cm';
}

String formatDate(String? rawDate) {
  if (rawDate == null || rawDate.isEmpty) return '';
  final parsed = DateTime.tryParse(rawDate);
  if (parsed == null) return rawDate;
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final month = months[parsed.month - 1];
  final day = parsed.day.toString().padLeft(2, '0');
  return '$day $month ${parsed.year}';
}


class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
