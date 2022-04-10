class InquiryForm
  include ActiveModel::Model

  TYPE = {
    'システムの不具合': 'system', # usage: InquiryForm::TYPE[:'システムの不具合'], TYPE.key('system')
    '操作方法':     'operation',
    'その他':      'other'
  }.freeze

  attr_accessor :name, :content, :type, :email

  validates :name,    presence: true, length:    { maximum: 20 }
  validates :content, presence: true, length:    { maximum: 4000 }
  validates :type,    presence: true, inclusion: { in: TYPE.values }
  validates :email,   presence: true, email: { mode: :strict } # gem 'email_validator'

  def save
    return false if invalid?

    notify_slack(self)
    true
  end

  private

  def notify_slack(inquiry)
    slack_client = ::SlackNotifier.new
    messege = generate_message(inquiry)
    slack_client.send messege
  end

  def generate_message(inquiry)
    <<~MSG
      ========お問い合わせが入りました！===========

      名前：#{inquiry.name}
      email: #{inquiry.email}
      お問い合わせ種別： #{TYPE.key(inquiry.type)}
      お問い合わせ内容： #{inquiry.content}
      ========================================
    MSG
  end
end
