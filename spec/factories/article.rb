FactoryBot.define do
    factory :article do
      title { Faker::Name.name }
      body { Faker::Lorem.paragraph }
      status {"public"}
      user
    end
end