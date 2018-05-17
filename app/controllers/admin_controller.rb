# frozen_string_literal: true

class AdminController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'admin'
end
