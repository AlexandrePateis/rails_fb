FactoryBot.define do

  factory :user do
    email {"alepateis@gmail.com"}
    password {"asdfghjkl"}
  end

  factory :article do
    title {"Um titulo qualquer"}
    body {"Um body qualquer ksksksks"}
    status {"public"}
    association :user
  end

end
