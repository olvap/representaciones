json.extract! reserva, :id, :salida, :hotel, :monto, :operator_id, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)