
Given /^there are (\d+) users$/ do |count|
  User.all.each { |x| x.destroy }
  (0..count).each do 
    User.create!
  end 
end

When /^I visit the sign in page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I sign in through github$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I am redirected to the home page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I my github user name is shown$/ do
  pending # express the regexp above with the code you wish you had
end
