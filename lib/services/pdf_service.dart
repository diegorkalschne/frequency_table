import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFSyncService {
  PDFSyncService(Uint8List? appImage) {
    _image = appImage;
  }

  Uint8List? _image;

  ///Gera um PDF para o relatório da sincronização
  Future<Uint8List> generatePDF({bool reportDev = false}) async {
    final pdf = pw.Document();

    pdf.addPage(pw.MultiPage(
      orientation: pw.PageOrientation.portrait,
      pageFormat: PdfPageFormat.a4,
      build: (_) => [_buildImage()],
    ));

    return await pdf.save();
  }

  pw.Widget _buildImage() {
    return pw.Container(
      margin: const pw.EdgeInsets.all(10),
      child: pw.Image(pw.MemoryImage(_image!)),
    );
  }
}
