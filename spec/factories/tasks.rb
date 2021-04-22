FactoryBot.define do
  factory :task do
    name { "test task" }
    detail { "This is test task." }

    trait :blank_name do
      name { nil }
    end

    trait :overflow_name do
      name { "a" * 26 }
    end

    trait :overflow_detail do
      detail { "a" * 661 }
    end
  end
end
