class EmailPersister
  attr_reader :reader

  def initialize(reader)
    @reader = reader
  end

  def persist
    # Create Users for recipients
    recipients = reader.parsed[:to].addrs.each do |recipient|
      User.find_or_create_by(email: recipient.address) do |u|
        u.name = recipient.display_name
      end
    end

    # Create User for sender
    sender = reader.parsed[:from].addrs.first
    from = User.find_or_create_by(email: sender.address) do |u|
      u.name = sender.display_name
    end

    from.emails.find_or_create_by(remote_message_id: reader.remote_message_id) do |e|
      # Complete email document
      e.document = reader.read

      # Destructured attributes
      e.message_id = reader.parsed.message_id
      e.in_reply_to = reader.parsed.in_reply_to
      e.to = reader.parsed.to
      e.from = reader.parsed.from
      e.subject = reader.parsed.subject
      e.date = reader.parsed.date
    end
  end
end
