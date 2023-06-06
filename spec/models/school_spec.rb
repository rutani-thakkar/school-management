require 'rails_helper'

RSpec.describe School, type: :model do
  describe "School validations" do

    it "name should the present" do
      school = build(:school, name: nil)
      expect(school).not_to be_valid
    end

    it "address should the present" do
      school = build(:school, address: nil)
      expect(school).not_to be_valid
    end

    it "phone should the present" do
      school = build(:school, phone: nil)
      expect(school).not_to be_valid
    end

    it "phone should be 10 digit number" do
      school = build(:school, phone: "12345")
      expect(school).not_to be_valid
    end

    it "email should the present" do
      school = build(:school, email: nil)
      expect(school).not_to be_valid
    end

    it "email should be in proper format" do
      school = build(:school, email: "test@gmail")
      expect(school).not_to be_valid
    end

    it "email should be unique" do
      existing_school = FactoryBot.create(:school, email: "test@example.com")
      school = build(:school, email: "test@example.com")
      expect(school).not_to be_valid
    end

    it "should be pass with valid attribute" do
      school = build(:school)
      expect(school).to be_valid
    end
  end

  describe "School associations test" do
    it "has many courses" do
      school = School.reflect_on_association(:courses)
      expect(school.macro).to eq(:has_many)
    end

    it "has many batches" do
      school = School.reflect_on_association(:batches)
      expect(school.macro).to eq(:has_many)
    end
  end
end
