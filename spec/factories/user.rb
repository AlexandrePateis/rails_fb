FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password {"asdfghjkl"}
    end
end
  