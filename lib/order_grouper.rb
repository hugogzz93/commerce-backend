module OrderGrouper
  def make_group(orders)
    id = SecureRandom.uuid
    orders.each { |e| e.group_id = id }
  end
end
