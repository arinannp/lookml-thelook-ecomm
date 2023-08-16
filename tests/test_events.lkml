test: events_explore {
  explore_source: events {
    column: count {}
    column: session_landing_page { field: sessions.session_landing_page }
    column: session_exit_page { field: sessions.session_exit_page }
    column: identifier { field: sessions.identifier }
    column: user_age_tier { field: event_summary.user_age_tier }
    column: user_continent { field: event_summary.user_continent }
  }
  assert: events_has_data {
    expression: ${events.count} > 0 ;;
  }
  assert: landing_page_has_data {
    expression: NOT is_null(${sessions.session_landing_page}) ;;
  }
  assert: exit_page_has_data {
    expression: NOT is_null(${sessions.session_exit_page}) ;;
  }
}
