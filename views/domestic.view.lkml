view: domestic {
  sql_table_name: `air-india-looker.AirIndia_Domestic.Domestic`
    ;;

  dimension: fy {
    type: string
    label: "fiscal year"
    sql: ${TABLE}.FY ;;
  }

  dimension: month {
    type: string
    label: "month"
    sql: ${TABLE}.Month ;;
  }

  measure: _pax__load_factor___in___ {
    type: sum
    label: "passenger load factor"
    sql: ${TABLE}._PAX__LOAD_FACTOR___IN___ ;;
  }

  measure: available_seat_kilometre__th_ {
    type: sum
    label: "availabel seat-kms"
    sql: ${TABLE}.AVAILABLE_SEAT_KILOMETRE__TH_ ;;
  }

  measure: departures_ {
    type: sum
    label: "number of departures"
    sql: ${TABLE}.DEPARTURES_ ;;
  }


  measure: hours_ {
    type: sum
    label: "flight hours"
    sql: ${TABLE}.HOURS_ ;;
  }

  measure: kilometer__th_ {
    type: sum
    label: "flight kms"
    sql: ${TABLE}.KILOMETER__TH_ ;;
  }



  measure: passenger_kms__performed__th_ {
    type: sum
    label: "passenger-km performed"
    sql: ${TABLE}.PASSENGER_KMS__PERFORMED__TH_ ;;
  }

  measure: passengers_carried_ {
    type: sum
    label: "passengers carried"
    sql: ${TABLE}.PASSENGERS_CARRIED_ ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
