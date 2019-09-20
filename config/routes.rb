Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	devise_for :users

	namespace 'api' do
		namespace 'v1' do
			mount_devise_token_auth_for 'User', at: 'auth', controllers: {
				registrations: 'api/v1/auth/registrations',
				sessions: 'api/v1/auth/sessions'
			}
			resources :memos
			resources :users, param: :username, path: '/' do
					get 'memos'
			end
			resources :user_relationships, param: :other_username do
			end

			delete 'user_relationships/:other_username', to: 'user_relationships#destory'
		end
	end
end
