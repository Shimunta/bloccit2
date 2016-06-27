FactoryGirl.define do
  factory :label do
    sequence(:name){|n| "labels#{n}"}
  end
end
