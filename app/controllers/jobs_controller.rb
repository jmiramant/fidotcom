require 'open-uri'
class JobsController < ApplicationController

  OPENINGS_URL = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20xml%20where%20url%3D'http%3A%2F%2Fwww.jobvite.com%2FCompanyJobs%2FXml.aspx%3Fc%3Dq0g9Vfw4'&format=json";

  def index
    @jobs = Rails.cache.fetch(:jobs, expires_in: 1.hour) do
      open(OPENINGS_URL).read
    end
    json = JSON.parse(@jobs)

    if json && json['query']['results'] == nil
      Rails.logger.info("Deleted jobs, results is empty")
      Rails.cache.delete(:jobs)
    end

    render json: @jobs
  end
end
