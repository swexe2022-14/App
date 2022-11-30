class FinancialsController < ApplicationController
    def new
        @financial = Financial.new
    end
    def create
        @financial = Financial.new(
            insititution: params[:financial][:insititution],
            usable: params[:financial][:usable])
    end
end
