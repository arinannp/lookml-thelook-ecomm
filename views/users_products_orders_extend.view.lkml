include: "/views/*.view.lkml"

view: users_products_orders_extend {
  extends: [users, products, orders]
}
