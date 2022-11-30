Rails.application.routes.draw do
    resources :users
    resources :financials
    get 'top/main'
    root 'top#main'
    get 'top/login_page'
    post 'top/login'
    get 'top/logout'
    #get 'moneys/expenditure_list'
    #get 'moneys/detailde_view'
    get 'financials/new
    '
end