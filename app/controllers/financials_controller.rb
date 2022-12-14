class FinancialsController < ApplicationController
    def new
        @financial = Financial.new
    end
    
    def create
        @financial = Financial.new(
            insititution: params[:financial][:insititution],
            usable: params[:financial][:usable])
        if @financial.save
            redirect_to financials_show_path
        else
            render financials_new_path
        end
    end
    
    def show
        @financials = Financial.all
    end
end
