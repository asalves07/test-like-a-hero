require 'rails_helper'

RSpec.describe "weapons/new", type: :view do
  before(:each) do
    assign(:weapon, Weapon.new(
      :weaponName => "MyString",
      :description => "MyString",
      :power_base => 1,
      :power_step => 1,
      :weapon_level => 1
    ))
  end

  it "renders new weapon form" do
    render

    assert_select "form[action=?][method=?]", weapons_path, "post" do

      assert_select "input[name=?]", "weapon[weaponName]"

      assert_select "input[name=?]", "weapon[description]"

      assert_select "input[name=?]", "weapon[power_base]"

      assert_select "input[name=?]", "weapon[power_step]"

      assert_select "input[name=?]", "weapon[weapon_level]"
    end
  end
end
