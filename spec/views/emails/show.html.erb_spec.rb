require 'rails_helper'

RSpec.describe "emails/show", type: :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :from => "From",
      :body => "MyText",
      :to => "To",
      :subject => "Subject",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/From/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/To/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(//)
  end
end
