class Edge < ApplicationRecord
  enum state: [:default, :recommonded, :highlighted, :visited]
end
