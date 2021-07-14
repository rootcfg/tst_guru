module ApplicationHelper
  def date_footer
    Time.now.to_formatted_s(:short)
  end
end
