RailsAdmin.config do |config|

  ### Popular gems integration
  config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'radmin' && password == 'admin'
    end
  end

  config.main_app_name { ['My App', 'Admin'] }

  config.model Item do

    list do
      exclude_fields :lastname
      exclude_fields :avatar
      exclude_fields :email
      exclude_fields :pending
      exclude_fields :description      
      exclude_fields :address
      exclude_fields :phone
      exclude_fields :code
    end
    
    edit do
      exclude_fields :avatar
      exclude_fields :panding
    end

  end

  config.model Category do

  end

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
