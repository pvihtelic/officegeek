# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    title "MyString"
    description "MyText"
    length 1
  end
end
