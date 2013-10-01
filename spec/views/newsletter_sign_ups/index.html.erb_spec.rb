require 'spec_helper'

describe "newsletter_sign_ups/index.html.erb" do
  before(:each) do
    assign(:newsletter_sign_ups, [
      stub_model(NewsletterSignUp,
        :email => "Email",
        :category => "Category",
        :notes => "MyText"
      ),
      stub_model(NewsletterSignUp,
        :email => "Email",
        :category => "Category",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of newsletter_sign_ups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
