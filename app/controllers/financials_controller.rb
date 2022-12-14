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
    
    def destroy
        financial = Financial.find(params[:id])
        financial.destroy
        redirect_to financials_show_path
    end
    
    def show
        @financials = Financial.all
    end
    
    def edit
        @financial = Financial.find(params[:id])
    end
    
    def update
        @financial = Financial.find(params[:id])
        if @financial.update(
            insititution: params[:financial][:insititution],
            usable: params[:financial][:usable])
            redirect_to financials_show_path
        else
            render edit_financial_path
        end
    end
    
end
