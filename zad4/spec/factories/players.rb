FactoryBot.define do
  factory :player do
    captain { false }
    first_name { "MyString" }
    last_name { "MyString" }
    power { 1 }
  end
end
