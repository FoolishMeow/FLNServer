class RootController < ApplicationController
  def ai_digger
    options = ai_digger_params.to_query
    url = URI("https://jiqizhixin.aidigger.com/api/v1/search/machine_mind/sources/_search?#{options}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = 'application/json'

    response = http.request(request)

    render json: JSON.parse(response.read_body)
  end

  private
  def ai_digger_params
    params.permit(:size, :sort, :from, :q).to_h
  end
end