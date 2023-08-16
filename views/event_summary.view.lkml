# If necessary, uncomment the line below to include explore_source.

# include: "ecomm.model.lkml"

view: event_summary {
  derived_table: {
    explore_source: events {
      column: session_id {}
      column: session_landing_page { field: sessions.session_landing_page }
      column: session_exit_page { field: sessions.session_exit_page }
      column: session_state { field: events.state }
      column: session_city { field: events.city }
      column: session_traffic_source { field: events.traffic_source }
      column: user_full_name { field: users.full_name }
      column: user_age_tier { field: users.age_tier }
      column: user_gender { field: users.gender }
      column: user_continent { field: users.continent }
      column: user_country { field: users.country }
      column: user_city { field: users.city }
    }
  }
  dimension: session_id {
    description: ""
  }
  dimension: session_landing_page {
    description: ""
  }
  dimension: session_exit_page {
    description: ""
  }
  dimension: session_state {
    description: ""
  }
  dimension: session_city {
    description: ""
  }
  dimension: session_traffic_source {
    description: ""
  }
  dimension: user_full_name {
    description: ""
  }
  dimension: user_age_tier {
    description: ""
  }
  dimension: user_gender {
    description: ""
  }
  dimension: user_continent {
    description: ""
  }
  dimension: user_country {
    description: ""
  }
  dimension: user_city {
    description: ""
  }
}
