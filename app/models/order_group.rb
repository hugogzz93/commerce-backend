class OrderGroup
  attr_reader :id, :orders
  def initialize(group_id)
    @id = group_id
  end

  def orders
    Order.where({group_id: @id})
  end

  def created_at
    orders.first.created_at
  end

  def total
    orders.joins(:order_items).sum(:price)
  end
  
  def status
    return :canceled if orders.all?(&:canceled?)
    return :delivered if orders.all?(&:delivered?)
    return :in_progress
  end
end
