FactoryGirl.define do
  factory :message do
    body        {Faker::Lorem.sentence}
    image       ""
    group_id    1
    created_at  {Faker::Time.between(DateTime.now - 1, DateTime.now)}
  end
end
