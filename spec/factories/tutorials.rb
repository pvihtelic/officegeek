# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tutorial do
    topic_id "MyString"
    price "9.99"
    title "MyString"
    description "MyText"
    length 1
  end
end
