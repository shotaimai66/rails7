class InquiryForm
  include ActiveModel::Model

  TYPE = {
    'システムの不具合': 'system',
    '操作方法':        'operation',
    'その他':          'other'
  }

  attr_accessor :name, :content, :type, :email

  validates :name,    presence: true, length:    { maximum: 20 }
  validates :content, presence: true, length:    { maximum: 4000 }
  validates :type,    presence: true, inclusion: { in: TYPE.values }
  validates :email,   presence: true, format:    { with: EmailValidator.regexp(mode: :strict) }



  def save
    return false if invalid?
    notify_slack(self)
    true
  rescue StandardError
    false
  end

  private
    def notify_slack(inquiry)
      notifier = Slack::Notifier.new(
        ENV['WEBHOOK_URL'],
        channel: '#' + ENV['CHANNEL']
      )
      messege = generate_message(inquiry)
      notifier.ping messege
    end

    def generate_message(inquiry)
      <<~MSG
      ========お問い合わせが入りました！===========

      名前：#{inquiry.name}
      email: #{inquiry.email}
      お問い合わせ種別： #{TYPE.key(inquiry.type).to_s}
      お問い合わせ内容： #{inquiry.content}
      ========================================
      MSG
    end
end