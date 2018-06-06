class Node < ApplicationRecord
  self.primary_key = 'uid'
  enum state: [:default, :recommonded, :highlighted, :visited]
  class << self
    def calc_layout(type = :spherical)
      ForceLayoutJob.perform(type.to_s, ::Graph::Technology.all_with_relationships)
    end
  end

  def hashed_data(layout)
    {
      id: self.uid,
      zh_name: self.zh_name,
      en_name: self.en_name,
      type: self.tipe,
      summary: self.summary,
      position: {
        x: self.position[layout]['x'],
        y: self.position[layout]['y'],
        z: self.position[layout]['z']
      }
    }
  end

  def all_data
    {
        id: self.uid,
        zh_name: self.zh_name,
        en_name: self.en_name,
        type: self.tipe,
        position: self.position,
        spherical_position: self.position["spherical"],
        hierarchy_position: self.position["hierarchy"],
        summary: self.summary
    }
  end

  def compact?
    self.position["hierarchy"]["x"] && self.position["spherical"]["x"]
  end

  def self.check
    h, s = 0, 0
    self.all.each do |n|
      h += 1 if n["position"]["hierarchy"]["x"]
      s += 1 if n["position"]["spherical"]["x"]
    end
    puts "Count: #{self.all.size} nodes."
    puts "H Cover: #{h}, #{(100 * h / self.all.size).to_i}%"
    puts "S Cover: #{s}, #{(100 * s / self.all.size).to_i}%"
  end

  def self.f(name)
    self.where(zh_name: name).first
  end
end
