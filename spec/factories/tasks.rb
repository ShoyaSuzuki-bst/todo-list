FactoryBot.define do
  factory :task do
    name { "test task" }
    detail { "This is test task." }
  end

  factory :blank_name, class: :task do
    name { nil }
    detail { "This is blank name task." }
  end

  factory :overflow_name, class: :task do
    name { "a" * 26 }
    detail { "This is blank name task." }
  end

  factory :overflow_detail, class: :task do
    name { "test" }
    detail { "a" * 661 }
  end
end
