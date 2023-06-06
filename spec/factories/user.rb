FactoryBot.define do
  factory :user, class: 'User' do
    first_name { 'Rutani' }
    last_name { 'Thakkar' }
    phone { '1234567899' }
    email {  Faker::Internet.email }
    role { 'super-admin'}
    password { 'test@123'}
  end
end
