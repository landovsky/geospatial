class ApplicationController < ActionController::API
  before_action :load_resource, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def load_resource
    model = controller_name.classify.constantize
    @resource = model.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    record_not_found
  end

  def record_not_found
    render status: :not_found
  end
end
