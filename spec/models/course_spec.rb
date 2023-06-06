require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "Course validations" do
    let(:school) { create(:school)}

    it "name should the present" do
      course = build(:course, school_id: school.id, name: nil)
      expect(course).not_to be_valid
    end

    it "description should the present" do
      course = build(:course, school_id: school.id, description: nil)
      expect(course).not_to be_valid
    end

    it "duration should the present" do
      course = build(:course, school_id: school.id, duration: nil)
      expect(course).not_to be_valid
    end

    it "start_date should the present" do
      course = build(:course, school_id: school.id, start_date: nil)
      expect(course).not_to be_valid
    end

    it "end_date should the present" do
      course = build(:course,school_id: school.id, end_date: nil)
      expect(course).not_to be_valid
    end

    it "should be pass with valid attribute" do
      course = build(:course, school_id: school.id,)
      expect(course).to be_valid
    end
  end

  describe "Course associations test" do
    it "should belongs to school" do
      course = Course.reflect_on_association(:school)
      expect(course.macro).to eq(:belongs_to)
    end

    it "has many batches" do
      course = Course.reflect_on_association(:batches)
      expect(course.macro).to eq(:has_many)
    end
  end
end
