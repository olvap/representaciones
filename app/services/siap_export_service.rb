class SiapExportService
  def initialize invoices
    @comprobantes = invoices.map do |i|
      { fecha: i.date.iso8601,
        tipo_comprobante: i.invoice_type,
        punto_de_venta: i.sales_point,
        numero_comprobante: i.number,
        gravado_21: i.tax_21_cents,
        iva_21: i.tax_21,
        gravado_10: i.tax_105_cents,
        iva_10: i.tax_105,
        no_gravado: i.not_taxed_cents,
        exento: i.exempt_cents }.merge(operator_data(i.operator))
    end
  end

  def zip
    @zip ||= build_zip
  end
  
  private

  def operator_data operator
    case operator
    when Wholesaler
      { denominacion_vendedor: operator.name,
        numero_identificacion_vendedor: operator.cuit }
    when Retailer
      { denominacion_comprador: operator.name,
        numero_identificacion_comprador: operator.cuit }
    else raise "Invalid Operator"
    end
  end

  def archivos
    @archivos ||= SiapExporter::ComprasVentas.generate @comprobantes
  end
    
  def build_zip
    Zip::OutputStream.write_buffer do |out|
      %w[ compras alicuotas_compras ventas alicuotas_ventas ].each do |file|
        out.put_next_entry "#{ file }.txt"
        out.print archivos[file.to_sym]
      end
    end.string
  end
end
