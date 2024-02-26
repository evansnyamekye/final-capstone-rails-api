# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options={})
   render json: {
    status: { code:200, message: 'User signed in successfully', data: current_user }
   }, status: :ok
  end
end
