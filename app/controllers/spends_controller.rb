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
        @usable = Financial.sum(:usable)
        @used = Spend.sum(:spendmoney)
        @spends = Spend.order(:tag).all
        @chart = Spend.group(:tag).sum(:spendmoney)
    end
    
    def show
        @spend = Spend.find(params[:id])
    end
    
    def edit
        @financials = Financial.all
        @spend = Spend.find(params[:id])
    end
    
    def update
        spend = Spend.find(params[:id])
        if spend.update(
            insititution: params[:spend][:insititution],
            spendmoney: params[:spend][:spendmoney])
            redirect_to spends_path
        else 
            spend.destroy
            redirect_to spends_path
        end
    end
    
    def destroy
        spend = Spend.find(params[:id])
        spend.destroy
        redirect_to spends_path
    end
end
