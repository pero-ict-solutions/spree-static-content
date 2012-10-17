require 'spec_helper'

describe 'Static Content Page' do

  before do
    Spree::Page.create(:slug => '/page', :title => 'Test Page', :body => 'Test page body')
    Spree::Page.create(:slug => 'page2', :title => 'Test Page 2', :body => 'Test page body 2')
  end

  it 'should render page when there is a query string' do
    visit '/page?test'
    page.should have_content('Test page body')
  end

  it 'should render page with a slug not starting by /' do
    visit '/page2'
    page.should have_content('Test page body 2')
  end

end
