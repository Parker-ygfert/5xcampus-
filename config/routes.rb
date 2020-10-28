Rails.application.routes.draw do
  # devise_for :users
  root to: "users#sign_up"

  resource :users, only: [:create, :edit, :update] do
    collection do
      get :sign_up
      get :sign_in
      post :login
      delete :sign_out
    end
  end

  resource :coupon
end
