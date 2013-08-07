Expertiza::Application.routes.draw do |map|

  resources :admin do
    collection do
      get :list_super_administrators
      get :list_administrators
      get :new_administrator
      get :list_instructors
      get :show_instructor
      get :new_instructor
      get :remove_instructor
    end
  end

  resources :assessment360 do
    collection do
      get :one_course_all_assignments
    end
  end

  resources :assignment do
    collection do
      delete :delete
      post :remove_assignment_from_course
      get :associate_assignment_with_course
      get :toggle_access
      get :copy
    end
  end

  resources :auth do
    collection do
      post :login
      post :logout
    end
  end

  resources :content_pages do
    collection do
      get :list
      match ':id', action: :show
    end
  end

  resources :controller_actions do
    collection do
      get 'list'
      post ':id', action: :update
      get 'new_for'
    end
  end

  resources :course do
    collection do
      post :delete
      post :toggle_access
      post :copy
      get :view_teaching_assistants
    end
  end

  resources :course_evaluation do
    collection do
      get :list
    end
  end

  resources :export_file do
    collection do
      get :start
    end
  end

  resources :grades do
    collection do
      get :view
    end
  end

  resources :impersonate do
    collection do
      get :start
      post :impersonate
    end
  end

  resources :import_file do
    collection do
      get :start
    end
  end

  resources :institution do
    collection do
      get :list
    end
  end

  resources :join_team_requests

  resources :leaderboard, constraints: { id: /\d+/ } do
    collection do
      get :index
    end
  end
  match 'leaderboard/index', controller: :leaderboard, action: :index

  resources :markup_styles

  resources :menu_items do
    collection do
      get :move_down
      get :move_up
      get :new_for
      get :link
      get :list
    end
  end

  resources :participants do
    collection do
      get :list
    end
  end

  resources :password_retrieval do
    collection do
      get :forgotten
    end
  end

  resources :permissions, constraints: { id: /\d+/ } do
    collection do
      get :list
    end
  end

  resources :profile, constraints: { id: /\d+/ } do
    collection do
      get :edit
    end
  end

  resources :publishing do
    collection do
      get :view
    end
  end

  resources :questionnaire do
    collection do
      get :view
      post :delete
      post :toggle_access
      post :copy
    end
  end

  resources :review_mapping do
    collection do
      get :list_mappings
      get :review_report
    end
  end

  resources :roles do
    collection do
      get :list
    end
  end

  resources :roles_permissions do
    collection do
      get :new_permission_for_role
    end
  end

  resources :sign_up_sheet do
    collection do
      get :add_signup_topics
      get :add_signup_topics_staggered
      get :view_publishing_rights
    end
  end

  resources :site_controllers do
    collection do
      get :list
      get :new_called
    end
  end

  resources :statistics do
    collection do
      get :list_surveys
      get :list
    end
  end

  resources :student_task do
    collection do
      get :list
      get :view
    end
  end

  resources :suggestion do
    collection do
      get :list
    end
  end

  resources :survey do
    collection do
      get :assign
    end
  end

  resources :survey_deployment do
    collection do
      get :list
      get :delete
      get :reminder_thread
    end
  end

  resources :survey_response do
    collection do
      get :view_responses
    end
  end

  resources :system_settings do
    collection do
      get :list
    end
  end

  resources :team do
    collection do
      get :list
    end
  end

  resources :tree_display do
    collection do
      get ':action'
    end
  end

  resources :users do
    collection do
      get :list
      get :show_selection
      get :auto_complete_for_user_name
    end
  end

  match '/menu/*name', controller: :menu_items, action: :link
  match ':page_name', controller: :content_pages, action: :view, method: :get

  root to: 'pages#home'

  map.connect 'question/select_questionnaire_type', :controller => "questionnaire", :action => 'select_questionnaire_type'
  map.connect ':controller/service.wsdl', :action => 'wsdl'
end
