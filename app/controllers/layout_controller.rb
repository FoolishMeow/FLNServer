class LayoutController < ApplicationController
  def layout
    @result = {
        nodes: Node.all.to_a.uniq.map {|n| n.hashed_data(params[:layout])},
        edges: Edge.all.to_a.uniq.map(&:hash_data)
    }
    render json: @result
  end

  def all
    @result = {
        nodes: Node.all.to_a.uniq.map(&:all_data),
        edges: Edge.all.to_a.uniq.map(&:hash_data)
    }
    render json: @result
  end
end
