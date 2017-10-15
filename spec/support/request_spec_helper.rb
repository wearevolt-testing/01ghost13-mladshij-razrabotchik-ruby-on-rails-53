module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
  def data
    json['data']
  end
  def attributes
    json['data']['attributes']
  end
end