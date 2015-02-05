require 'io/console'
require 'watir'
require 'watir-webdriver' #comment this out to use ie
require 'mechanize'
require 'titleize'
#require 'irb'
#require 'irb/completion'
#require 'pry'

#inconsistent use of => vs. , should be cleaned up at some point.

if STDIN.respond_to?(:noecho)
  def get_password(prompt="Password: ")
    print prompt
    STDIN.noecho(&:gets).chomp
  end
else
  def get_password(prompt="Password: ")
    `read -s -p "#{prompt}" password; echo $password`.chomp
  end
end

puts "What's your user name? "

$user = gets.chomp.to_s

$password = get_password("What's your password? \n")

browser = Watir::Browser.new 
browser.goto 'http://eres.sais-jhu.edu/eres/default.aspx'
	browser.link(:text => "Admin Login").click
	u = browser.text_field :id => 'ctl00_BodyContent_docutek_login_myTextBox'
	u.set $user
	p = browser.text_field :id => 'ctl00_BodyContent_docutek_pass_myPass'
	p.set $password
	browser.button(:name => 'ctl00$BodyContent$btn_login').click

sleep 1
	browser.link(:text => "SAIS ERes Home").click 
	browser.link(:text => "Main Menu").click
	browser.link(:text => "Document").click