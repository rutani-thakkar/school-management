FactoryBot.define do
  factory :course, class: 'Course' do
    name { 'Ruby on rails' }
    duration { '1 month' }
    start_date { Date.today }
    end_date { Date.today + 30.days }
    description { 'test course'}
    school_id { nil }
  end
end
