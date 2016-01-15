FactoryGirl.define do
  factory :team do
    sequence :name do |n|
      "name#{n}"
    end
    description "MyString"
    user
  end

end
