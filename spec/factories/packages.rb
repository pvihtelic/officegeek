# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :package do
    tutorial_id 1
    price "9.99"
    title "MyString"
    description "MyText"
    length 1
  end
end
