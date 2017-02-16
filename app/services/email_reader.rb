require 'mail'

class EmailReader
  attr_reader :remote_message_id

  def initialize(remote_message_id)
    @remote_message_id = remote_message_id
  end

  def message
    @message ||= Aws::S3::Resource
      .new
      .bucket(ENV['AWS_S3_BUCKET'])
      .object(remote_message_id)
      .get
  end

  def read
    @contents ||= message.body.read
  end

  def parsed
    @parsed ||= Mail.read_from_string(read)
  end
end
