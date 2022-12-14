Rails.application.routes.draw do
    resources :users
    resources :financials
    get 'top/main'
    root 'top#main'
    post 'top/login'
    get 'top/logout'
    get 'top/login_page'
    get 'top/passcode'
    post 'top/confirmation'
    get 'financials/new'
    get 'financials/show'
end
