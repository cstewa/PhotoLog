require 'spec_helper'

describe Photo do

	it "has a picture that saves" do
		photo = FactoryGirl.create(:photo)
		expect(photo.picture).to_not be_nil
	end

end
