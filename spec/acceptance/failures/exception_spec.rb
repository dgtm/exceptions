require 'acceptance_helper'

feature Exception::Failure do
  # let(:failure) { Failure.create!(:type => "A", :message => "Hello", :backtrace => "Trace")}
  let(:user) { User.create!(:name => "Jack") }
  # background do
  #   User.make(:email => 'user@example.com', :password => 'caplin')
  # end
  scenario "unauth user" do
    # within("#session") do
      visit user_path(user)
      visit exceptions_path
      page.should have_content("StandardError")
      page.should have_content("Error from User")
    # end
  end

end