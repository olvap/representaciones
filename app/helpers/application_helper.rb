module ApplicationHelper

  # list periods available for export (last 6 monts)
  def periods
    @periods ||=
      6.times.map do |n|
        period = Date.current.months_ago(n)
        "#{ period.year }-#{ period.month }"
      end
  end

end
