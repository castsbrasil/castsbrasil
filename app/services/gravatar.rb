class Gravatar
  def initialize(email)
    @gravatar_id = build_gravatar_id(email.downcase)
  end

  def image_url
    URI.parse("http://gravatar.com/avatar/#{@gravatar_id}.png?size=26")
  end

  def exists?
    check_url = "http://gravatar.com/avatar/#{@gravatar_id}.png?d=404"

    uri      = URI.parse(check_url)
    http     = Net::HTTP.new(uri.host, uri.port)
    request  = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    response.code.to_i != 404
  end

  private

  def build_gravatar_id(email)
    Digest::MD5.hexdigest email
  end
end