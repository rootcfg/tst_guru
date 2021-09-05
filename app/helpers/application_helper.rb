module ApplicationHelper
  def date_footer
    I18n.l(Time.current, format: :short)
  end

  def github_url(author, repo)
    link_to "#{author}", "#{repo}"
  end

end
