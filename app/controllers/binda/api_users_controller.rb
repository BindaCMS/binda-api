require_dependency "binda/application_controller"

module Binda
  class ApiUsersController < ApplicationController
    before_action :load_user, only: [:edit, :update, :destroy]

    def index
      @users = ApiUser.all
    end

    def update
      if @user.update(user_params)
        redirect_to api_users_url, notice: 'Api User was successfully updated.'
      else
        render :edit
      end
    end

    def new
      @user = ApiUser.new
    end

    def create
      @user = ApiUser.new user_params
      if @user.save
        redirect_to api_users_url, notice: 'Api User was successfully created.'
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to api_users_url, notice: 'Api User was successfully destroyed.'
    end

    private
    def user_params
      params.fetch(:api_user, {}).permit( :name, :api_key, { structure_ids: [] } )
    end

    def load_user
      @user = ApiUser.find params[:id]
    end
  end
end
