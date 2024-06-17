# frozen_string_literal: true

# Controller for managing errors...
# This controller is responsible for handling errors in the application
# It is the place to define methods for handling errors
# For example, methods for handling 404 errors
class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!

  def not_found
    render status: :not_found
  end
end
