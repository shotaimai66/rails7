class SlackNotifier
  attr_reader :client

  # 環境SLACK_WEBHOOK_URLにwebhook urlを格納
  WEBHOOK_URL = ENV['SLACK_WEBHOOK_URL']
  CHANNEL = ENV['SLACK_CHANNEL']

  def initialize
    @client = Slack::Notifier.new(WEBHOOK_URL, channel: CHANNEL)
  end

  def send(message)
    return if Rails.env == 'test'

    client.ping(message)
  end
end
