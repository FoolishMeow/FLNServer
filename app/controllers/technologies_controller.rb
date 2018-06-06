class TechnologiesController < ApplicationController
  #caches_action :index, expires_in: 100.hour
  def index
    @technologies = ::Graph::Technology.all
  end

  def show
    @technology = ::Graph::Technology.where(id: params[:id]).first
  end

  def search
    render json: {results: ::Graph::Technology.search(params[:q])}
  end

  def relationships
    render json: ::Graph::Technology.all_with_relationships
  end
end
