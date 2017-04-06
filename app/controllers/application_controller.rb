class ApplicationController < ActionController::API
  include ActionController::Serialization
  attr_reader :current_user

  protected

  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { error: ['Not Authenticated'] }, status: :unauthorized
  end

  private

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      puts 'http_token'
      puts request.headers['Authorization'].split(' ').last
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    puts 'user id in token'
    puts http_token
    binding.pry
    http_token && auth_token[0]['user_id'].to_i
  end
end
