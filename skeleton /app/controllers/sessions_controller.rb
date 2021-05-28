class SessionController < ApplicationController
    def new
        render :new
    end 

    def create
        debugger
        username_param = params[:user][:username]
        password_param = params[:user][:password]
        
        @user = User.find_by_credentials(username_param, password_param)

        if @user 
            session_token = User.reset_session_token!
            update_session_token(session_token)
        else
        end 


    end 



#     def update_session_token(token)
#         @user.update({session_token => token})
#     end 

#     def update
#         @user = Cat.find(params[:id])
#         if @cat.update_attributes(cat_params)
#             redirect_to cat_url(@cat)
#         else
#             flash.now[:errors] = @cat.errors.full_messages
#             render :edit
#         end
#   end


#     end 
end 