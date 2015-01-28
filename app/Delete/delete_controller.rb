require 'rho/rhocontroller'
require 'helpers/browser_helper'

class DeleteController < Rho::RhoController
  include BrowserHelper

  # GET /Delete
  def index
    @deletes = Delete.find(:all)
    render :back => '/app'
  end

  # GET /Delete/{1}
  def show
    @delete = Delete.find(@params['id'])
    if @delete
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Delete/new
  def new
    @delete = Delete.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Delete/{1}/edit
  def edit
    @delete = Delete.find(@params['id'])
    if @delete
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Delete/create
  def create
    @delete = Delete.create(@params['delete'])
   
      @personalforms1 = PersonalForm.find(:all)
      
    @personalforms1.each do |personalform|
    
           personalform.destroy             
    end
    
    @finforms1 = FinancialForm.find(:all)
     
   @finforms1.each do |personalform|
   
          personalform.destroy             
   end
   
    @genhealth = GeneralHealth.find(:all)
     
   @genhealth.each do |personalform|
   
          personalform.destroy             
   end
   
    @narcotics = Narcotics.find(:all)
     
   @narcotics.each do |personalform|
   
          personalform.destroy             
   end
   
    @familyhistory = FamliyHistory.find(:all)
     
   @familyhistory.each do |personalform|
   
          personalform.destroy             
   end
   
    @femalesection = FemaleSection.find(:all)
     
   @femalesection.each do |personalform|
   
          personalform.destroy             
   end
 
    @dentalissues = DentalIssues.find(:all)
     
   @dentalissues.each do |personalform|
   
          personalform.destroy             
   end  
 
    @dentalissues = DentalIssues.find(:all)
      
    @dentalissues.each do |personalform|
    
           personalform.destroy             
    end    
   
    @lung = Lungs.find(:all)
         
       @lung.each do |personalform|
       
              personalform.destroy             
       end    
       
    @heartblood = HeartBlood.find(:all)
         
       @heartblood.each do |personalform|
       
              personalform.destroy             
       end    
      
    @stomach = Stomach.find(:all)
         
       @stomach.each do |personalform|
       
              personalform.destroy             
       end    
      
    @excretary = ExcretarySystem.find(:all)
         
       @excretary.each do |personalform|
       
              personalform.destroy             
       end    
      
    @nervous = NervousSystem.find(:all)
         
       @nervous.each do |personalform|
       
              personalform.destroy             
       end    
    
    @body = BodyStructure.find(:all)
         
       @body.each do |personalform|
       
              personalform.destroy             
       end    
    @diabetes = Diabetes.find(:all)
         
       @diabetes.each do |personalform|
       
              personalform.destroy             
       end    
    @other = OtherDiseases.find(:all)
         
       @other.each do |personalform|
       
              personalform.destroy             
       end    
    @bodydefects = BodilyDefects.find(:all)
         
       @bodydefects.each do |personalform|
       
              personalform.destroy             
       end    
    redirect :action => :index
  end
  
   
  # POST /Delete/{1}/update
  def update
    @delete = Delete.find(@params['id'])
    @delete.update_attributes(@params['delete']) if @delete
    redirect :action => :index
  end

  # POST /Delete/{1}/delete
  def delete
    @delete = Delete.find(@params['id'])
    @delete.destroy if @delete
    redirect :action => :index  
  end
end
