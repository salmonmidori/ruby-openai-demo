require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))
message_list = [
  {
    "role" => "system",
    "content" => "Pretend you are Donald Trump"
  }, # message 1
  {
    "role" => "user",
    "content" => "Best pizza spots"
  } # message 2
] # closing

api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  } # parameters
) # client.chat
pp api_response
