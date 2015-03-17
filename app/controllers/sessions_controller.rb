class SessionsController < ApplicationController
   def new

   end

   def create
      uid = env['omniauth.auth']['uid']
      session[:user_id] = uid
      user = User.find_or_create_by(uid: uid)
      user.update_attributes(name: env['omniauth.auth']['info']['name'], email: env['omniauth.auth']['info']['email'])
      redirect_to '/articles#index'
   end

   def destroy
      session.clear
      redirect_to root_path
   end
end
