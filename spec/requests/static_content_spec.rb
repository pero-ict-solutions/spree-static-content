require 'spec_helper'

describe 'Static Content Page' do

  it 'should render page with a slug not starting by /' do
    Spree::Page.create(:slug => 'page2', :title => 'Test Page 2', :body => 'Test page body 2')
    visit '/page2'
    page.should have_content('Test page body 2')
  end

  it 'should render page with a slug with multiple /' do
    Spree::Page.create(:slug => '/t/categories/page3', :title => 'Test Page 3', :body => 'Test page body 3')
    visit '/t/categories/page3'
    page.should have_content('Test page body 3')
  end

  it "should render a custom root page" do
    Spree::Page.create(:slug => '/', :title => 'Root Page', :body => 'Root Body')
    visit '/'
    page.should have_content('Root Body')
  end

  it 'should render page when there is a query string' do
    visit '/page?test'
    page.should have_content('Test page body')
  end

end
