connection: "air_india"

datagroup: air_india_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: air_india_default_datagroup

include: "/views/*.view.lkml"
explore:domestic {
  join:  flight_occupancy{
      type: left_outer
      sql_on: ${domestic.fy}=${flight_occupancy.domestic_fy} and ${domestic.quarter} = ${flight_occupancy.domestic_quarter} ;;
      relationship: one_to_one
      }
  join:  flight_duration{
    type: left_outer
    sql_on: ${domestic.fy}=${flight_duration.domestic_fy} and ${domestic.quarter} = ${flight_duration.domestic_quarter} ;;
    relationship: one_to_one
  }
}
