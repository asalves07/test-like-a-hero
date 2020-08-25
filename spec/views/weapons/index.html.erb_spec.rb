require 'rails_helper'

RSpec.describe "weapons/index", type: :view do
  before(:each) do
    assign(:weapons, [
      Weapon.create!(
        :weaponName => "Weapon Name",
        :description => "Description",
        :power_base => 2,
        :power_step => 3,
        :weapon_level => 4
      ),
      Weapon.create!(
        :weaponName => "Weapon Name",
        :description => "Description",
        :power_base => 2,
        :power_step => 3,
        :weapon_level => 4
      )
    ])
  end

  it "renders a list of weapons" do
    render
    assert_select "tr>td", :text => "Weapon Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
