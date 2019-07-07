require 'rails_helper'

RSpec.describe "Astronaut Index" do
  describe "As a visitor" do
    describe "When I visit the astronauts index page" do
    before :each do
      @astronaut_1 = Astronaut.create!(name: "Neil Armstrong", age: 37, job: "Commander")
      @astronaut_2 = Astronaut.create!(name: "Buzz Aldrin", age: 35, job: "Pilot")
      @astronaut_3 = Astronaut.create!(name: "Tom Hanks", age: 36, job: "Actor")
      @mission_1 = Mission.create!(name: "Apollo 13")
      @mission_2 = Mission.create!(name: "Capricorn")
      @mission_3 = Mission.create!(name: "Gemini 7")
    end

      it "I see a list of astronauts and their details" do

        visit astronauts_path

        #within "astronaut-#{...}" do
        expect(current_path).to eq(astronauts_path)
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_1.age)
        expect(page).to have_content(@astronaut_1.job)
      end

      it "I see the average age of all astronauts" do

        visit astronauts_path

        expect(page).to have_content("Average Age of Astronauts:")
        expect(page).to have_content(36)
      end

      it "I see a list of space missions in alpabetical order for each astronaut" do

        visit astronauts_path

      #within "astronaut-#{...}" do
        expect(page).to have_content("Apollo 13")
        expect(page).to have_content("Capricorn 4")
        expect(page).to have_content("Gemini 7")
      end
    end
  end
end
