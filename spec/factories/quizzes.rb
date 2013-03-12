# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz do
    quiz_path "MyString"
    user_id 1
  end
end
