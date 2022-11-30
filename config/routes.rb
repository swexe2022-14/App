Rails.application.routes.draw do
    resources :users
    get 'top/main'
    root 'top#main'
<<<<<<< HEAD
    post 'top/login'
    get 'top/logout'
=======
    get 'top/login_page'
    post 'top/login'
    get 'top/logout'
    #get 'moneys/expenditure_list'
    #get 'moneys/detailde_view'
>>>>>>> fbc7486322309565b2d63f5810cf888bfd8755a6
end
