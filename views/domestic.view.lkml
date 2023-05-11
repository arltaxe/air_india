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

  measure: passengers_carried_avg {
    type: average
    label: "passengers carried (avg)"
    sql: ${TABLE}.PASSENGERS_CARRIED_ ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: max_capacity{
    type: sum
    sql: round(case when  ${TABLE}._PAX__LOAD_FACTOR___IN___    <> 0 then  (${TABLE}.PASSENGERS_CARRIED_ / ${TABLE}._PAX__LOAD_FACTOR___IN___ ) * 100 else 0 end,0)  ;;
  }

  dimension: quarter {
    case: {
      when: {
        sql: ${TABLE}.Month in ('JAN','FEB','MAR');;
        label: "Q1"
      }
      when: {
        sql: ${TABLE}.Month in ('APR','MAY','JUNE');;
        label: "Q2"
      }
      when: {
        sql: ${TABLE}.Month in ('JULY','AUG','SEP');;
        label: "Q3"
      }
      when: {
        sql: ${TABLE}.Month in ('OCT','NOV','DEC');;
        label: "Q4"
      }
      else:"Unknown"
    }
  }

  dimension: month_nbr {
    type: number
    label: "month nbr"
    sql: case ${TABLE}.Month  when 'JAN' then 1
                              when 'FEB' then 2
                              when 'MAR' then 3
                              when 'APR' then 4
                              when 'MAY' then 5
                              when 'JUNE' then 6
                              when 'JULY' then 7
                              when 'AUG' then 8
                              when 'SEP' then 9
                              when 'OCT' then 10
                              when 'NOV' then 11
                              when 'DEC' then 12
          else -1 end ;;
  }

}
