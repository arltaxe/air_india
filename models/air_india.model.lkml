connection: "air_india"

datagroup: air_india_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: air_india_default_datagroup

include: "/views/*.view.lkml"
explore:domestic {}
