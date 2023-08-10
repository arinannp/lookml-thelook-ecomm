# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thelook_ecommerce.orders` ;;
  drill_fields: [order_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Gender" in Explore.

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension_group: duration_shipping {
    type: duration
    intervals: [second, minute, hour, day, week, month, quarter, year]
    sql_start: ${TABLE}.created_at ;;
    sql_end: ${TABLE}.shipped_at ;;
  }

  dimension_group: duration_delivering {
    type: duration
    intervals: [day, week, month, quarter, year]
    sql_start: ${shipped_date} ;;
    sql_end: ${delivered_date} ;;
  }

  dimension_group: duration_accepted_by_user {
    type: duration
    intervals: [day, week, month, quarter, year]
    sql_start: ${created_date} ;;
    sql_end: ${delivered_date} ;;
  }

  dimension: num_of_item {
    type: number
    sql: ${TABLE}.num_of_item ;;
  }

  dimension: level_trx {
    type: string
    sql:
      case
        when ${num_of_item} <= 2 then "lower"
        when ${num_of_item} > 2 and ${num_of_item} < 4 then "medium"
        when ${num_of_item} >= 4 then "many"
      end ;;
  }

  dimension: is_there_more_one_orders {
    type: yesno
    sql: ${num_of_item} > 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id, users.last_name, users.id, users.first_name, order_items.count]
  }

  measure: total_num_of_item {
    type: sum
    sql: ${num_of_item} ;;
  }

}
