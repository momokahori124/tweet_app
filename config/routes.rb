Rails.application.routes.draw do
  get "users/index" => "users#index"

  get "posts/index" => "posts#index"
  get "/" => "home#top"
  get "about" => "home#about"

  # <-----posts------>

  # 新規投稿画面のルーティング(:idよりも上に書くことに注意)
  get "posts/new" => "posts#new"

  # 投稿詳細ページのルーティング
  get "posts/:id" => "posts#show"

  # データを送信するためのルーティング
  post "posts/create" => "posts#create"
  get "posts/create" => "posts#create"

  # editアクションへのルーティング
  get "posts/:id/edit" => "posts#edit"

  # updateアクションへのルーティング
  post "posts/:id/update" => "posts#update"

  # destroyアクションへのルーティング
  post "posts/:id/destroy" => "posts#destroy"

  # <-----users------>

  # 新規投稿画面のルーテイング
  get "signup" => "users#new"
  post "users/index" => "users#index"

  post "users/create" => "users#create"

  # 投稿詳細ページのルーティング
  get "users/:id" => "users#show"

  # ユーザー編集アクションへのルーティング
  get "/users/:id/edit" => "users#edit"

  # updateアクションへのルーティング
  post "users/:id/update" => "users#update"

  # destroyアクションへのルーティング 
  post "users/:id/destroy" => "users#destroy"

  # <----- login ----->

  # ログイン機能
  get "login" => "users#login_form"
  post "login" => "users#login"

  # ログアウト機能
  post "logout" => "users#logout"
  get "logout" => "users#logout"


  # <----- Like ----->
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get "users/:id/likes" => "users#likes"

end
