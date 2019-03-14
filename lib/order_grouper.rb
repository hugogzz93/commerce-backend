module OrderGrouper
  def self.make_group(orders)
    id = SecureRandom.uuid
    orders.each { |e| e.group_id = id }
  end

  def self.create_group!(ungrouped_orders)
    ActiveRecord::Base.transaction do
      make_group(ungrouped_orders).each(&:save!)
    end
  end
end
