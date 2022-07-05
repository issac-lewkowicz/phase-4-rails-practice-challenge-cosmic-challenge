class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_resp
  rescue_from ActiveRecord::RecordInvalid, with: :not_valid_resp

  private

  def not_found_resp(exception)
    render json: { error: "#{exception.model} not found"}, status: :not_found
  end

  def not_valid_resp(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
