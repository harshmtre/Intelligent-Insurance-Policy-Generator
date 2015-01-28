require 'rho/rhocontroller'
require 'helpers/browser_helper'

class PersonalFormController < Rho::RhoController
  include BrowserHelper

  # GET /PersonalForm
  def index
    @personalforms = PersonalForm.find(:all)
    render :back => '/app'
  end

  # GET /PersonalForm/{1}
  def show
    @personalform = PersonalForm.find(@params['id'])
    if @personalform
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /PersonalForm/new
  def new
    @personalform = PersonalForm.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /PersonalForm/{1}/edit
  def edit
    @personalform = PersonalForm.find(@params['id'])
    if @personalform
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /PersonalForm/create
  def create
    @personalform = PersonalForm.create(@params['personalform'])
   #url_for :controller => :Model001, :action => :page
      redirect :controller => :FinancialForm, :action => :new
  end

  # POST /PersonalForm/{1}/update
  def update
    @personalform = PersonalForm.find(@params['id'])
    @personalform.update_attributes(@params['personalform']) if @personalform
    redirect :action => :index
  end

  # POST /PersonalForm/{1}/delete
  def delete
    @personalform = PersonalForm.find(@params['id'])
    @id = @personalform.Id
   
    @finance = FinancialForm.find(:first, :conditions => {'Id' => @id})
         @finance.destroy
      @generalhealth = GeneralHealth.find(:first, :conditions => {'Id' => @id})
           @generalhealth.destroy
      @narcotics = Narcotics.find(:first, :conditions => {'Id' => @id})
           @narcotics.destroy
      
       @familyhistory = FamliyHistory.find(:first, :conditions => {'Id' => @id})
               @familyhistory.destroy
           @gender=@personalform.Gender
          if @gender == 'Female'
             @femalesection = FemaleSection.find(:first, :conditions => {'Id' => @id})
                        @femalesection.destroy
            end  
           
   
   
                @body = BodyStructure.find(:first, :conditions => {'id' => @id})
                @body.destroy
                @diabetes = Diabetes.find(:first, :conditions => {'id' => @id})
                @diabetes.destroy
    @bodily=BodilyDefects.find(:first, :conditions => {'id' => @id})
                @bodily.destroy
   @other=OtherDiseases.find(:first, :conditions => {'id' => @id})
                @other.destroy
   
   @dentalissues = DentalIssues.find(:first, :conditions => {'id' => @id})
                   @dentalissues.destroy
            @lungs = Lungs.find(:first, :conditions => {'id' => @id})
   
        @lungs.destroy
                @excretary = ExcretarySystem.find(:first, :conditions => {'id' => @id})
                @excretary.destroy
                @heart=HeartBlood.find(:first, :conditions => {'id' => @id})
                @heart.destroy
                @nervous=NervousSystem.find(:first, :conditions => {'id' => @id})
                @nervous.destroy
                
                @stomach=Stomach.find(:first, :conditions => {'id' => @id})
                @stomach.destroy   
            
           
   

    @personalform.destroy if @personalform
    redirect :action => :index  
  end
end
