require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FinancialFormController < Rho::RhoController
  include BrowserHelper

  # GET /FinancialForm
  def index
    @financialforms = FinancialForm.find(:all)
    render :back => '/app'
  end

  # GET /FinancialForm/{1}
  def show
   @financialform = FinancialForm.find(:first, :conditions => {'Id' => @params['id'][1..-1].chop})
      
  #  @financialform = FinancialForm.find(@params['id'])
   
     if @financialform
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /FinancialForm/new
  def new
    @financialform = FinancialForm.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /FinancialForm/{1}/edit
  def edit
    @financialform = FinancialForm.find(@params['id'])
    if @financialform
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /FinancialForm/create
  def create
    @financialform = FinancialForm.create(@params['financialform'])

    redirect :controller => :GeneralHealth, :action => :new
  end

  # POST /FinancialForm/{1}/update
  def update
    @financialform = FinancialForm.find(@params['id'])
    @financialform.update_attributes(@params['financialform']) if @financialform
    redirect :action => :index
  end

  # POST /FinancialForm/{1}/delete
  def delete
    @financialform = FinancialForm.find(@params['id'])
    @id = @financialform.Id
       #  @personal = PersonalForm.find(:first, :conditions => {'Id' => @id})
       #  @personal.destroy 
    
    @financialform.destroy if @financialform
    redirect :action => :index  
  end
end
