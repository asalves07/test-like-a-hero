require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET /weapons" do

    it "returns success status" do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    it "the weapon's title and current power are presents" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
        expect(response.body).to include("#{weapon.current_power}")
      end
    end

  end
  describe "POST /weapons" do
    context "when it has valid parameters" do
      it "creates the weapon with correct attributes" do
        weapon_attributes = FactoryBot.attributes_for(:weapon)
        post weapons_path, params: {weapon: weapon_attributes}
        expect(Weapon.last).to have_attributes(weapon_attributes)
      end
    end

    context "when it has no valid parameters" do
      it "does not create weapon" do
        expect{
          post weapons_path, params: {weapon: {weaponName: '', description: '', power_base: '', power_step: '' , weapon_level:''}}
        }.to_not change(Weapon, :count)
      end
    end
  end

  describe "DELETE /weapons" do
    context 'when the weapon exists' do
      it 'returns status code 204' do
        weapon = create(:weapon)
        delete "/weapons/#{weapon.id}"
        expect(response).to have_http_status(302)
      end
      it 'destroy the record'
    end
    context 'when the enemy does not exists' do
      it 'returns status code 404'
      it 'returns a not found message'
    end
  end

  describe "GET /weapons" do
    it "shows the weapon with correct attributes" do
      #weapon = create(:weapon)
      #weapon_attributes = attributes_for(:weapon)
      #get "/weapons/#{weapon.id}", params: weapon_attributes

      #expect(weapon.reload).to have_attributes(json.except('created_at', 'updated_at'))
      # expect(response.body).to have_attributes(weapon_attributes)
    end
  end
end
