# == Schema Information
#
# Table name: years
#
#  id         :bigint           not null, primary key
#  name       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# typed: false
FactoryBot.define do
  factory :year do
    name { 1 }
  end
end
