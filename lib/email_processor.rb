class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    return if @email.headers.empty? # SNS subscription handling

    user = User.find_by_email(@email.from[:email])
    user.messages.create!(
      subject: @email.subject,
      body: @email.body
    )
  end
end
