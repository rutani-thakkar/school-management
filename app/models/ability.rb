# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.super_admin?
      can :manage, :all
    elsif user.school_admin?
      can :edit, School, id: user.school_id
      can :manage, User
      can :index, School
      can :manage, [Course, Batch, Enrollment]
      can [:create_student,:add_student_to_batch], User
      cannot [:school_admin_list, :create_school_admin], User
    elsif user.student?
      can [:show, :students_list], User
      can :show, Course
      can [:index, :show, :enroll_batch], Batch
      cannot :manage, Enrollment
      can :index, School
    end
  end
end
