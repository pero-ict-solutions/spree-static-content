FactoryGirl.define do
  factory :page, class: Spree::Page do
    title { generate(:random_string) }
    body  { generate(:random_description) }

    sequence(:slug) { |n| "/page#{n}" }

    trait :with_foreign_link do
      foreign_link { Faker::Internet.http_url }
    end
  end
end