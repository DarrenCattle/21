json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :days, :reason, :user_id
  json.url challenge_url(challenge, format: :json)
end
