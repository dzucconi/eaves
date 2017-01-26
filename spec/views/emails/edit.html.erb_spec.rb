require 'rails_helper'

RSpec.describe "emails/edit", type: :view do
  before(:each) do
    @email = assign(:email, Email.create!(
      :from => "MyString",
      :body => "MyText",
      :to => "MyString",
      :subject => "MyString",
      :user => nil
    ))
  end

  it "renders the edit email form" do
    render

    assert_select "form[action=?][method=?]", email_path(@email), "post" do

      assert_select "input#email_from[name=?]", "email[from]"

      assert_select "textarea#email_body[name=?]", "email[body]"

      assert_select "input#email_to[name=?]", "email[to]"

      assert_select "input#email_subject[name=?]", "email[subject]"

      assert_select "input#email_user_id[name=?]", "email[user_id]"
    end
  end
end
