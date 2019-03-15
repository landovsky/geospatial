class ApplicationController < ActionController::API
  before_action :load_resource, only: [:show, :update, :destroy]

  def load_resource
    @resource = controller_name.classify.constantize.find(params[:id])
  end
end
