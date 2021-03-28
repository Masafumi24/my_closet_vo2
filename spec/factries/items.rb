FactoryBot.define do
  factory :item do
    image                    {"image"}
    purchase_date            {"1994/4/1"}
    prefecture_id            { 1 }
    parts_id                 { 1 }
  end
end