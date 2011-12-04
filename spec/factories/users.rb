# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    uid "MyString"
    nickname "MyString"
    basecamp_token "MyString"
    basecamp_login "MyString"
    basecamp_password "MyString"
    synced false
    admin false
    authorized false
  end
end
