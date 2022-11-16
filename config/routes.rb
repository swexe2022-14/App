Rails.application.routes.draw do
    get 'top/main'
    root 'top#main'
    get 'moneys/expenditure_list'
    get 'moneys/detailde_view'
end
