class TechnologiesController < ApplicationController
  def index
    @technologies = ::Graph::Technology.all
  end

  def show
    # WARNING! There're some settings created just for Cassius&Ivy's project.
    # To be used in production env., the json template need several changes.
    @technology = ::Graph::Technology.where(id: params[:id]).first
  end

  def relationships
    @relationships = ::Graph::Technology.query_as(:n).match("(n)-[:often_viewed_with]-(related_technologies)").return("{ source: n, target: related_technologies}").response.map {|r| r["{ source: n, target: related_technologies}"]}
    @nodes = []
    @relationships.each {|r| @nodes << r[:source] << r[:target]}
    @nodes.uniq!
  end
end
