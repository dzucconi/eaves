require 'rails_helper'

RSpec.describe "emails/new", type: :view do
  before(:each) do
    assign(:email, Email.new(
      :from => "MyString",
      :body => "MyText",
      :to => "MyString",
      :subject => "MyString",
      :user => nil
    ))
  end

  it "renders new email form" do
    render

    assert_select "form[action=?][method=?]", emails_path, "post" do

      assert_select "input#email_from[name=?]", "email[from]"

      assert_select "textarea#email_body[name=?]", "email[body]"

      assert_select "input#email_to[name=?]", "email[to]"

      assert_select "input#email_subject[name=?]", "email[subject]"

      assert_select "input#email_user_id[name=?]", "email[user_id]"
    end
  end
end
