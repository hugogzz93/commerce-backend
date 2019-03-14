module OrderGrouper
  def self.make_group(orders)
    id = SecureRandom.uuid
    orders.each { |e| e.group_id = id }
  end

  def self.create_group!(ungrouped_orders)
    ActiveRecord::Base.transaction do
      OrderGroup.new make_group(ungrouped_orders).each(&:save!).sample.group_id
    end
  end
end
