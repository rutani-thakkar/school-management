require 'rails_helper'

RSpec.describe Batch, type: :model do
  describe "Batch validations" do

    let(:school) { create(:school)}
    let(:course) { create(:course, school_id: school.id)}

    it "name should the present" do
      batch = build(:batch, course_id: course.id, name: nil)
      expect(batch).not_to be_valid
    end

    it "description should the present" do
      batch = build(:batch, course_id: course.id, description: nil)
      expect(batch).not_to be_valid
    end

    it "capacity should the present" do
      batch = build(:batch, course_id: course.id, capacity: nil)
      expect(batch).not_to be_valid
    end


    it "start_date should the present" do
      batch = build(:batch, course_id: course.id, start_date: nil)
      expect(batch).not_to be_valid
    end

    it "end_date should the present" do
      batch = build(:batch, course_id: course.id, end_date: nil)
      expect(batch).not_to be_valid
    end

    it "should be pass with valid attribute" do
      batch = build(:batch, course_id: course.id)
      expect(batch).to be_valid
    end
  end

  describe "Batch associations test" do
    it "should belongs to course" do
      batch = Batch.reflect_on_association(:course)
      expect(batch.macro).to eq(:belongs_to)
    end

    it "has many students" do
      batch = Batch.reflect_on_association(:students)
      expect(batch.macro).to eq(:has_many)
    end

      it "has many enrollments" do
      batch = Batch.reflect_on_association(:enrollments)
      expect(batch.macro).to eq(:has_many)
    end
  end
end
