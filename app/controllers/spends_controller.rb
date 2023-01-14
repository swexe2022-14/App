class SpendsController < ApplicationController
    def new
        @financials = Financial.all
        @spend = Spend.new
    end
    
    def create
       @spend = Spend.new(
           insititution: params[:spend][:insititution],
           spendmoney: params[:spend][:spendmoney],
           tag: params[:spend][:tag])
       if @spend.save
           redirect_to spends_path
       else
           render new_spend_path
       end
    end
    
    def index
        @spends = Spend.all
    end
    
    def edit
        @spend = Spend.find(params[:id])
    end
    
    def update
        spend = Spend.find(params[:id])
        if spend.update(
            insititution: params[:spend][:insititution],
            spendmoney: params[:spend][:spendmoney])
            redirect_to spends_path
        else 
            render edit_spend_path
        end
    end
end
