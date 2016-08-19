class UsersController < ApplicationController
before_action :authenticate_user!

	def index
		if current_user.role == "administrator"
        	@users = User.all
        else
			redirect_to root_path
        end
    end

    def show
      @user = User.find_by_id(params[:id])
    end

    def new
    	if current_user.role == "administrator"
        	@user = User.new
        else
        	redirect_to root_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to usuarios_path, notice: "Usuario actualizado correctamente."
        else
            render :edit
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to usuarios_path, notice: "Usuario creado satisfactoriamente." 
        else
            render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        if @user.destroy
            redirect_to usuarios_path, notice: "Usuario eliminado correctamente."
        end
    end

    def profile
        @user = current_user
    end


	private

		def user_params
            params.require(:user).permit(:name, :lastname, :email, :role)
		end

        def profile_params
            params.require(:user).permit(:name, :lastname, :email, :role)
        end

end
