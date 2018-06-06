class ForceLayoutJob < ApplicationJob
  queue_as :default
  def perform(layout_type, data)
    ForceLayout.set :tick_interval, 5
    ForceLayout.set :energy_threshold, 100
    ForceLayout.send("#{layout_type}_layout!", JSON.parse(data.to_json))
    ForceLayout::Node.all.each do |fnode|
      node = Node.find_or_create_by(uid: fnode.id)
      node.update(
          zh_name: fnode.data["zh_name"],
          en_name: fnode.data["en_name"],
          tipe: fnode.data["type"],
          klass: fnode.data["klass"],
          summary: fnode.data["summary"]
                  )
      node.position[layout_type] = {
          x: fnode.point.position.x,
          y: fnode.point.position.y,
          z: fnode.point.position.z
      }
      node.save
    end
    ForceLayout::Edge.all.each do |fedge|
      Edge.where(source: fedge.source.id, target: fedge.target.id).first || Edge.create(source: fedge.source.id, target: fedge.target.id)
    end
  end
end
