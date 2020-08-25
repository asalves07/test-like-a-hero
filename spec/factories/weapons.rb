FactoryBot.define do
  factory :weapon do
    weaponName {FFaker::Lorem.word}
    description {FFaker::Lorem.word}
    power_base {FFaker::Random.rand(100..3000) }
    power_step {FFaker::Random.rand(10..100) }
    weapon_level {FFaker::Random.rand(1..25) }
  end
end
