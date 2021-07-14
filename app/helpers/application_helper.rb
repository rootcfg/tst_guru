module ApplicationHelper
  def date_footer
    Time.now.to_formatted_s(:short)
  end
  def github_url(author, repo)
    link_to "#{author}", "#{repo}"
  end
end
