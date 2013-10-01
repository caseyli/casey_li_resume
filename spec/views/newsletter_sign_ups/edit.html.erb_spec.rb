require 'spec_helper'

describe "newsletter_sign_ups/edit.html.erb" do
  before(:each) do
    @newsletter_sign_up = assign(:newsletter_sign_up, stub_model(NewsletterSignUp,
      :email => "MyString",
      :category => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit newsletter_sign_up form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newsletter_sign_ups_path(@newsletter_sign_up), :method => "post" do
      assert_select "input#newsletter_sign_up_email", :name => "newsletter_sign_up[email]"
      assert_select "input#newsletter_sign_up_category", :name => "newsletter_sign_up[category]"
      assert_select "textarea#newsletter_sign_up_notes", :name => "newsletter_sign_up[notes]"
    end
  end
end
