class EmailPersister
  attr_reader :reader

  def initialize(reader)
    @reader = reader
  end

  def persist
    user = User.find_or_create_by(email: reader.parsed.from.first)

    user.emails.find_or_create_by(remote_message_id: reader.remote_message_id) do |email|
      # Complete email document
      email.document = reader.read

      # Destructured attributes
      email.message_id = reader.parsed.message_id
      email.in_reply_to = reader.parsed.in_reply_to
      email.to = reader.parsed.to
      email.from = reader.parsed.from
      email.subject = reader.parsed.subject
      email.date = reader.parsed.date
    end
  end
end
