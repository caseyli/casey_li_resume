require 'spec_helper'

describe PagesController do
  render_views
  before(:each) do
    @base_title = "Casey Li"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get :home
      response.should be_success
    end
    
    it "should have the right title" do
      get :home
      response.should have_selector("title", :content => "#{@base_title} | Home")
    end
    
  end
  
  describe "GET 'skills'" do
    it "should be successful" do
      get :skills
      response.should be_success
    end
    
    it "should have the right title" do
      get :skills
      response.should have_selector("title", :content => "#{@base_title} | Skills")
    end
    
  end

  describe "GET 'work_experience'" do
    it "should be successful" do
      get :work_experience
      response.should be_success
    end
    
    it "should have the right title" do
      get :work_experience
      response.should have_selector("title", :content => "#{@base_title} | Work Experience")
    end
    
  end

  describe "GET 'education'" do
    it "should be successful" do
      get :education
      response.should be_success
    end
    
    it "should have the right title" do
      get :education
      response.should have_selector("title", :content => "#{@base_title} | Education")
    end
  end

  describe "GET 'hobbies'" do
    it "should be successful" do
      get :hobbies
      response.should be_success
    end
    
    it "should have the right title" do
      get :hobbies
      response.should have_selector("title", :content => "#{@base_title} | Hobbies")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get :contact
      response.should be_success
    end
    
    it "should have the right title" do
      get :contact
      response.should have_selector("title", :content => "#{@base_title} | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get :about
      response.should be_success
    end
    
    it "should have the right title" do
      get :about
      response.should have_selector("title", :content => "#{@base_title} | About")
    end
  end

end
