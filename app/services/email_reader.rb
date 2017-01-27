require 'mail'

class EmailReader
  attr_reader :message_id

  def initialize(message_id)
    @message_id = message_id
  end

  def message
    @message ||= Aws::S3::Resource
      .new
      .bucket(ENV['AWS_S3_BUCKET'])
      .object(message_id)
      .get
  end

  def read
    @contents ||= message.body.read
  end

  def envelope
    @envelope ||= Mail.read_from_string(read)
  end

  def persist
    user = User.find_or_create_by(email: envelope.from.first)
    user.emails.find_or_create_by(message_id: message_id)
  end

  def method_missing(method, *arguments, &block)
    envelope.send(method, *arguments, &block)
  end
end
