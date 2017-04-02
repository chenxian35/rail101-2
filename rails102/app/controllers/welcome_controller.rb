class WelcomeController < ApplicationController
   def index
    flash[:notice]="Good morning,git"
    #flash[:alert]="Good night ,it's time to sleep"
    #flash[:warning]="This is warning"
   end
end
