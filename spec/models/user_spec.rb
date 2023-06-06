require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User validations" do

    it "first_name should the present" do
      user = build(:user, first_name: nil)
      expect(user).not_to be_valid
    end

    it "last_name should the present" do
      user = build(:user, last_name: nil)
      expect(user).not_to be_valid
    end

    it "phone should the present" do
      user = build(:user, phone: nil)
      expect(user).not_to be_valid
    end

    it "phone should be 10 digit number" do
      user = build(:user, phone: "12345")
      expect(user).not_to be_valid
    end

    it "email should the present" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it "email should be in proper format" do
      user = build(:user, email: "test@gmail")
      expect(user).not_to be_valid
    end

    it "should be pass with valid attribute" do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe "User associations test" do
    it "belongs to school" do
      user = User.reflect_on_association(:school)
      expect(user.macro).to eq(:belongs_to)
    end

    it "has many batches" do
      user = User.reflect_on_association(:batches)
      expect(user.macro).to eq(:has_many)
    end


    it "has many enrollments" do
      user = User.reflect_on_association(:enrollments)
      expect(user.macro).to eq(:has_many)
    end
  end
end
