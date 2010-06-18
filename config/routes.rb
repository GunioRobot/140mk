ActionController::Routing::Routes.draw do |map|
  map.error '/error', :controller => "welcome", :action => "error"

  map.root :controller => "welcome"
  map.resources :users
  map.resources :tweets, :collection => {:my => :get, :refresh => :post}
  map.resources :categories, :as => :categories, :member => {:create_on_twitter => :post}
  map.resources :subscriptions
  map.resources :tags, :only => [:index, :show]
  map.resource :session, :collection => {:callback => :get}
  
  map.login "/login", :controller => "sessions", :action => "create"
  map.logout "/logout", :controller => "sessions", :action => "destroy"
  map.settings "/settings", :controller => "settings", :action => "index"
  map.deactivate "/deactivate", :controller => "users", :action => "deactivate"
  map.about '/about', :controller => 'about', :action => 'index'
end
