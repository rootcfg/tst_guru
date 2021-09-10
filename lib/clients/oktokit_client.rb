class OktokitClient

  require 'octokit'

  attr_reader :oktokit

  def initialize
    @oktokit = Octokit::Client.new(:access_token => "#{Rails.application.credentials.git[:access_token]}")
  end

  def create_gist(gist_params)
     [@oktokit.create_gist(gist_params), @oktokit.last_response.status]
  end

end