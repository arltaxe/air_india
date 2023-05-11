view: flight_duration {
  derived_table: {
    #persist_for: "2 minutes"
    sql: SELECT
          domestic.FY  AS domestic_fy,
          domestic.Month  AS domestic_month,
          case domestic.Month  when 'JAN' then 1
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
                else -1 end  AS domestic_month_nbr,
          CASE
      WHEN domestic.Month in ('JAN','FEB','MAR') THEN '0'
      WHEN domestic.Month in ('APR','MAY','JUNE') THEN '1'
      WHEN domestic.Month in ('JULY','AUG','SEP') THEN '2'
      WHEN domestic.Month in ('OCT','NOV','DEC') THEN '3'
      ELSE '4'
      END AS domestic_quarter__sort_,
          CASE
      WHEN domestic.Month in ('JAN','FEB','MAR') THEN 'Q1'
      WHEN domestic.Month in ('APR','MAY','JUNE') THEN 'Q2'
      WHEN domestic.Month in ('JULY','AUG','SEP') THEN 'Q3'
      WHEN domestic.Month in ('OCT','NOV','DEC') THEN 'Q4'
      ELSE 'Unknown'
      END AS domestic_quarter,
         round( case when COALESCE(SUM(domestic.DEPARTURES_ ), 0) <> 0 then COALESCE(SUM(domestic.HOURS_ ), 0) / COALESCE(SUM(domestic.DEPARTURES_ ), 0) end , 2) as flight_duration
      FROM `air-india-looker.AirIndia_Domestic.Domestic`
           AS domestic
      GROUP BY
          1,
          2,
          3,
          4,
          5
      ORDER BY
          6 DESC
      LIMIT 500
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

  dimension: domestic_month {
    type: string
    sql: ${TABLE}.domestic_month ;;
  }

  dimension: domestic_month_nbr {
    type: number
    sql: ${TABLE}.domestic_month_nbr ;;
  }

  dimension: domestic_quarter__sort_ {
    type: string
    sql: ${TABLE}.domestic_quarter__sort_ ;;
  }

  dimension: domestic_quarter {
    type: string
    sql: ${TABLE}.domestic_quarter ;;
  }

  dimension: flight_duration {
    type: number
    sql: ${TABLE}.flight_duration ;;
  }

  set: detail {
    fields: [
      domestic_fy,
      domestic_month,
      domestic_month_nbr,
      domestic_quarter__sort_,
      domestic_quarter,
      flight_duration
    ]
  }
}
