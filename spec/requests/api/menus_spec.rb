require 'rails_helper'

RSpec.describe 'Menus API', type: :request do
  let(:menu1) { FactoryGirl.create(:menu, name: 'Menu 1') }
  let(:menu2) { FactoryGirl.create(:menu, name: 'Menu 2') }
  let(:place) do
    FactoryGirl.create(
      :place,
      hide: false,
      menus: [menu1, menu2]
    )
  end

  describe '#menu_info' do
    it 'returns a list of the menus of the place that are not hidden' do
      FactoryGirl.create(:menu, hide: true, place: place)

      get "/ios/menu_info/#{place.slug}.json"

      expect(response).to be_success
      expect(json.length).to eq(2)
      expect(json).to be_an_instance_of(Array)
      expect(response).to render_template('ios/menu_info')

      json_menu1, json_menu2 = *json
      expect(json_menu1['name']).to eq('Menu 1')
      expect(json_menu1['id']).to eq(menu1.id)
      expect(json_menu2['name']).to eq('Menu 2')
      expect(json_menu2['id']).to eq(menu2.id)
    end
  end
end
