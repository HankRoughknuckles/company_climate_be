# typed: strict

# create all the years from 1985 to present
[*1985..Time.now.year].each do |year|
  Year.find_or_create_by(name: year)
end

year_2018 = Year.find_by(name: 2018)

amazon = Company.find_or_create_by(name: 'Amazon')
amazon_in_2018 = CompanyYear.find_or_create_by(year: year_2018, company: amazon)
amazon_in_2018.update_attributes(co2_produced: 44.4)

google = Company.find_or_create_by(name: 'Google')
google_in_2018 = CompanyYear.find_or_create_by(year: year_2018, company: google)
google_in_2018.update_attributes(co2_produced: 15, co2_captured: 15)

facebook = Company.find_or_create_by(name: 'Facebook')
facebook_in_2018 = CompanyYear.find_or_create_by(year: year_2018, company: facebook)
facebook_in_2018.update_attributes(co2_produced: 0.339)

aramco = Company.find_or_create_by(name: 'Saudi Aramco')
aramco.update_attributes(total_co2_produced: 59_000)
