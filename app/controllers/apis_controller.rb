class ApisController < ApplicationController
  def portfolios
    @portfolios = Portfolio.all
    respond_to do |format|
      format.xml { render :xml => @portfolios.to_xml(:include => {:holdings =>{:include => :stock}}) }
      format.json { render :json => @portfolios.to_json(:include => {:holdings =>{:include => :stock}}) }
    end
  end
end
