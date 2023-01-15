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
           puts "入力内容に誤りがあります。"
       end
    end
    
    def index
        @spends = Spend.order(:tag).all
        @chart = Spend.group(:tag).count
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
            render edit_spend_path
            puts "編集内容に誤りがあります。"
        end
    end
    
    def destroy
        spend = Spend.find(params[:id])
        spend.destroy
        redirect_to spends_path
    end
end
