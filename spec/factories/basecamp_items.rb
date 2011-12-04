FactoryGirl.define do
  class Dummy 
    attr_accessor :id
    attr_accessor :name
    attr_accessor :content
    attr_accessor :completed

    def save!
      true 
    end 
  end 

  sequence :id do |n|
    n
  end
  sequence :name do |n|
    "item #{n}"
  end 
  factory :b_project, :class => "Dummy" do
    id  { Factory.next(:id) }
    name  { Factory.next(:name) }
  end

  factory :b_list,    :class => "Dummy" do
    id  { Factory.next(:id) }
    name  { Factory.next(:name) }
  end

  factory :b_todo,    :class => "Dummy" do
    id  { Factory.next(:id) }
    content  { Factory.next(:name) }
    completed false
  end
  

end

