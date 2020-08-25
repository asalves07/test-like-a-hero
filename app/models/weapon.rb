class Weapon < ApplicationRecord
  def current_power
    (self.power_base + ((self.weapon_level - 1)* self.power_step))
  end

  def title
    "#{self.weaponName} ##{self.weapon_level}"
  end
end
