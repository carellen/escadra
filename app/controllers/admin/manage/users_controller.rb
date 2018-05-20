module Admin
  module Manage
    class UsersController < AdminController

      def index
        @users = User.all
      end

    end
  end
end