json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :booking_date, :start_time, :end_time, :status
  json.url reservation_url(reservation, format: :json)
end
