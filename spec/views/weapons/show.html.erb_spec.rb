require 'rails_helper'

RSpec.describe "weapons/show", type: :view do
  before(:each) do
    @weapon = assign(:weapon, Weapon.create!(
      :weaponName => "Weapon Name",
      :description => "Description",
      :power_base => 2,
      :power_step => 3,
      :weapon_level => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Weapon Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
