Rails.application.routes.draw do
  get "posts/index" => "posts#index"
  get "/" => "home#top"
  get "about" => "home#about"

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

end
