class ResourcesController < ApplicationController
  def index
    @resources = ::Graph::Resource.all
  end

  def show
    @resource = ::Graph::Resource.where(id: params[:id]).first
  end
end
