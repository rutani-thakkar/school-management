Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" 

  resources :schools do
    resources :courses, shallow: true do
      resources :batches, shallow: true do
        member do
          put 'enroll_batch'
          put 'discard_enrolled_batch'
          # put '/enroll_batch', to: 'batches#enroll_batch', as: 'enroll', on: :member
          # put '/discard_enrolled_batch/:batch_id', to: 'batches#discard_enrolled_batch', as: 'discard_enrolled', on: :member
        end
      end
    end
  end
  resources :users do
    collection do
      get 'students_list'
      get 'school_admin_list'
      post 'create_student'
      post 'create_school_admin'
    end
    patch '/add_student_to_batch/:batch_id', to: 'users#add_student_to_batch', as: 'add_student_to_batch', on: :member
  end
  get '/enrollments', to: 'enrollments#index', as: 'enrollments'
  patch '/accept_request/:id', to: 'enrollments#accept_request', as: 'enrollment_accept_request'
  patch '/denied_request/:id', to: 'enrollments#denied_request', as: 'enrollment_denied_request'
end
