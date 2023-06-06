FactoryBot.define do
  factory :batch, class: 'Batch' do
    name { 'Ruby on rails batch 1' }
    capacity { 100 }
    start_date { Date.today }
    end_date { Date.today + 30.days }
    description { 'test batch'}
  end
end
