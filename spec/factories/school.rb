FactoryBot.define do
  factory :school, class: 'School' do
    name { 'Kadi school' }
    address { 'gandhinagar' }
    email {  Faker::Internet.email }
    phone { '1234567899' }
    description { 'test school'}
  end
end
