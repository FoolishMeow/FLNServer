class RecommandationController < ApplicationController
  def clear
    Node.all.map &:default!
    Edge.all.map &:default!
  end
end
