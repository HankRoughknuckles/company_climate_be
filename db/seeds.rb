# typed: strict

# create all the years from 1985 to present
[*1985..Time.now.year].each do |year|
  Year.find_or_create_by(name: year)
end
