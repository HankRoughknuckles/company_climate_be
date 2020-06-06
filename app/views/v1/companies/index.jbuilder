json.array! @companies do |company|
  json.id company.id
  json.name company.name
  json.total_co2_produced company.total_co2_produced
  json.total_co2_captured company.total_co2_captured
end
