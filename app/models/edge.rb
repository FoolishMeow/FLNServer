class Edge < ApplicationRecord
  enum state: [:default, :recommonded, :highlighted, :visited]

  def hash_data
    {
        id: self.id,
        source: self.source,
        target: self.target
    }
  end

  def self.find_from_nodes(source, target)
    Edge.where(source: source.uid, target: targte.uid).first
  end
end
