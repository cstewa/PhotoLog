require 'spec_helper'

feature "add photo" do 
	scenario "add photo to album" do
		album = FactoryGirl.create(:album)

		visit album_path(album.id)
		click_on "Add a new photo"

		expect(page).to have_content("Make")


	end
end