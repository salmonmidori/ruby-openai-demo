require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))
user_req = String.new
message_list = [
  {
    "role" => "system",
    "content" => "Pretend you are Donald Trump"
  }
] # closing
puts "Hello! How can I help you today? (To exit, enter 'bye')."
puts "-" * 50

loop do
  user_req = gets.chomp
  if user_req == "bye"
    break
  end

  message_list = message_list.push({
    "role" => "user",
    "content" => user_req
  })
  api_response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo",
      messages: message_list
    } # parameters
  ) # client.chat
  resp = api_response.dig("choices", 0, "message", "content")
  puts resp
  puts "-" * 50

  message_list = message_list.push({
    "role" => "assistant",
    "content" => resp
  })
  
end
