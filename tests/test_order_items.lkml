test: order_items_explore {
  explore_source: order_items {
    column: count {}
    column: total_sale_price {}
    column: count_of_orders { field: orders.count }
    column: count_of_users { field: users.count }
    column: count_of_products { field: products.count }
    column: count_of_inventory { field: inventory_items.count }
    column: count_of_distribution { field: distribution_centers.count }
  }
  assert: order_items_has_data {
    expression: ${order_items.count} > 0 ;;
  }
  assert: users_has_data {
    expression: ${users.count} > 0 ;;
  }
  assert: products_has_data {
    expression: ${products.count} > 0 ;;
  }
  assert: inventory_has_data {
    expression: ${inventory_items.count} > 0 ;;
  }
  assert: distribution_has_data {
    expression: ${distribution_centers.count} > 0 ;;
  }
}
