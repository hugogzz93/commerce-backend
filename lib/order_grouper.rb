module OrderGrouper
  def make_group(orders)
    id = SecureRandom.uuid
    orders.each { |e| e.group_id = id }
  end

  def create_group(ungrouped_orders)
    begin
      ActiveRecord::Base.transaction do
        make_group(ungrouped_orders).each(&:save!)
      end
    rescue ActiveRecord::RecordInvalid
      return ungrouped_orders
    end
  end
end
