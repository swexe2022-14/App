Rails.application.routes.draw do
    resources :users
    resources :financials
    resources :spends
    get 'top/main'
    root 'top#main'
    post 'top/login'
    get 'top/logout'
    get 'top/login_page'
    post 'top/confirmation_1'
    get 'top/passcode_1'
    post 'top/confirmation_2'
    get 'top/passcode_2'
end
