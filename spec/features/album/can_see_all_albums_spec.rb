require 'rails_helper'

context 'visit' do
  context 'index' do
    scenario 'has all album names' do
      album1 = Album.create(name: 'spacelounge')
      album2 = Album.create(name: 'space_lounge')
      album3 = Album.create(name: 'space lounge')

      visit albums_path

      expect(page).to have_content(album1.name)
      expect(page).to have_content(album2.name)
      expect(page).to have_content(album3.name)
    end
  end
end