# frozen_string_literal: true

class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['admin_login'],
                               password: ENV['admin_password']
end
