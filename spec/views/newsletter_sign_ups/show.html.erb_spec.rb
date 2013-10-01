require 'spec_helper'

describe "newsletter_sign_ups/show.html.erb" do
  before(:each) do
    @newsletter_sign_up = assign(:newsletter_sign_up, stub_model(NewsletterSignUp,
      :email => "Email",
      :category => "Category",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Category/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
