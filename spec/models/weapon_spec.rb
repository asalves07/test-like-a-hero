require 'rails_helper'

RSpec.describe Weapon, type: :model do

  it "returns the correct current power" do
    power_base = FFaker::Random.rand(100..3000)
    power_step = FFaker::Random.rand(10..100)
    weapon_level = FFaker::Random.rand(1..25)
    weapon = create(:weapon, power_base: power_base, power_step: power_step, weapon_level: weapon_level)
    expect(weapon.current_power).to eq(power_base + ((weapon_level - 1) * power_step))
  end

  it "returns the correct weapon title" do
    weaponName = FFaker::Lorem.word
    weapon_level = FFaker::Random.rand(1..25) 

    weapon = create(:weapon, weaponName: weaponName, weapon_level: weapon_level)
    expect(weapon.title).to eq("#{weaponName} ##{weapon_level}")
  end
end
