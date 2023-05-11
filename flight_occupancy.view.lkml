view: flight_occupancy {
  derived_table: {
    sql: SELECT
          domestic.FY  AS domestic_fy,
          CASE
      WHEN domestic.Month in ('JAN','FEB','MAR') THEN 'Q1'
      WHEN domestic.Month in ('APR','MAY','JUNE') THEN 'Q2'
      WHEN domestic.Month in ('JULY','AUG','SEP') THEN 'Q3'
      WHEN domestic.Month in ('OCT','NOV','DEC') THEN 'Q4'
      ELSE 'Unknown'
      END AS domestic_quarter,
          COALESCE(SUM(domestic.PASSENGERS_CARRIED_ ), 0) AS domestic_passengers_carried_,
          COALESCE(SUM(domestic.DEPARTURES_ ), 0) AS domestic_departures_,
       round(COALESCE(SUM(domestic.PASSENGERS_CARRIED_ ), 0) / COALESCE(SUM(domestic.DEPARTURES_ ), 0),0) as avg_flight_occupation
      FROM `air-india-looker.AirIndia_Domestic.Domestic`
           AS domestic
      GROUP BY
          1,
          2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: domestic_fy {
    type: string
    sql: ${TABLE}.domestic_fy ;;
  }

  dimension: domestic_quarter {
    type: string
    sql: ${TABLE}.domestic_quarter ;;
  }

  dimension: domestic_passengers_carried_ {
    type: number
    sql: ${TABLE}.domestic_passengers_carried_ ;;
  }

  dimension: domestic_departures_ {
    type: number
    sql: ${TABLE}.domestic_departures_ ;;
  }

  dimension: avg_flight_occupation {
    type: number
    sql: ${TABLE}.avg_flight_occupation ;;
  }

  set: detail {
    fields: [domestic_fy, domestic_quarter, domestic_passengers_carried_, domestic_departures_, avg_flight_occupation]
  }
}
