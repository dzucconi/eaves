require 'rails_helper'

RSpec.describe "emails/index", type: :view do
  before(:each) do
    assign(:emails, [
      Email.create!(
        :from => "From",
        :body => "MyText",
        :to => "To",
        :subject => "Subject",
        :user => nil
      ),
      Email.create!(
        :from => "From",
        :body => "MyText",
        :to => "To",
        :subject => "Subject",
        :user => nil
      )
    ])
  end

  it "renders a list of emails" do
    render
    assert_select "tr>td", :text => "From".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "To".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
