class DemoController < ApplicationController
  layout 'application'
  def index
    render('index') #Default sets the view template
  end

  def hello
    @array = [1,2,3,4,5] # instance variable
    render('hello')
  end

  def other_hello
    redirect_to(:action => 'hello')
  end

  def escape_output
    
  end
end 
