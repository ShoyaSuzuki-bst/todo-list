FactoryBot.define do
  factory :task do
    name { "test task" }
    detail { "This is test task." }
  end

  factory :blankname, class: :task do
    name { nil }
    detail { "This is blank name task." }
  end
end
