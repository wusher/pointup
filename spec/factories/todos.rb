# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    name "MyString"
    basecamp_id 1
    points 1
    completed false
    list nil
  end
end
