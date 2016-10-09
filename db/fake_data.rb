agencia = Retailer.create_with(
  name: "Tito Puente", tax_category: "R.INSCRIPTO"
).find_or_create_by!(cuit: "27224686604")

p agencia

venta = Invoice.create_with(
  date: '2016-07-04',
  invoice_type: "A",
  sales_point: 4,
  number: 1220,
  taxed_21_cents: 144950,
  taxed_105_cents: 0,
  not_taxed_cents: 1873400,
  exempt_cents: 1765741
).find_or_create_by!(operator: agencia)

p venta

operadora = Wholesaler.create_with(
    name: "BUSINESS & TRAVEL SRL",
    tax_category: "MONOTRIBUTO"
  ).find_or_create_by!(cuit: "30642724459")

p operadora

compra = Invoice.create_with(
  date: '2016-07-01',
  invoice_type: "A",
  sales_point: 1,
  number: 44391,
  taxed_21_cents: 1777856,
  taxed_105_cents: 0,
  not_taxed_cents: 2057422,
  exempt_cents: 16
).find_or_create_by!(operator: operadora)

p compra
