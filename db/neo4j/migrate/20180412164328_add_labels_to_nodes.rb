class AddLabelsToNodes < Neo4j::Migrations::Base
  def up
    nodes = Neo4j::ActiveBase.current_session
                             .query('MATCH (n) WHERE n:Technology OR n:Resource OR n:Publication OR n:Product OR n:Paper OR n:Institution RETURN n')
                             .rows
                             .flatten
    nodes.each do |node|
      node.add_labels(*node.types) if node.types.present?
    end
  end

  def down
  end
end
