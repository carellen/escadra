module Admin
  module Manage
    class UsersController < AdminController

      def index
        @users = User.all
      end

      def create
        @user = User.invite!(user_params)
      end

      private

      def user_params
        params.require(:user).permit(:email)
      end

    end
  end
end