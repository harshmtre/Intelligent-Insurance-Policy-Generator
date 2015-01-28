require 'rho/rhocontroller'
require 'helpers/browser_helper'

class BodilyDefectsController < Rho::RhoController
  include BrowserHelper

  # GET /BodilyDefects
  def index
    @bodilydefectses = BodilyDefects.find(:all)
    render :back => '/app'
  end

  # GET /BodilyDefects/{1}
  def show
    @bodilydefects = BodilyDefects.find(:first, :conditions => {'id' => @params['id'][1..-1].chop})

    #@bodilydefects = BodilyDefects.find(@params['id'])
    if @bodilydefects
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /BodilyDefects/new
  def new
    @bodilydefects = BodilyDefects.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /BodilyDefects/{1}/edit
  def edit
    @bodilydefects = BodilyDefects.find(@params['id'])
    if @bodilydefects
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /BodilyDefects/create
  def create
    @bodilydefects = BodilyDefects.create(@params['bodilydefects'])
   
      fileNameW = File.join(Rho::RhoApplication::get_base_app_path(), 'diseasefile.txt')
          afile=File.new(fileNameW,'a+')
    
        afile.write(@bodilydefects.handicap+"\n")
        @id=@bodilydefects.id
  @personalform = PersonalForm.find(:first, :conditions => {'Id' => @id})      
    @financialform = FinancialForm.find(:first, :conditions => {'Id' => @id})    
    @generalhealth = GeneralHealth.find(:first, :conditions => {'Id' => @id})      
      @narcotics = Narcotics.find(:first, :conditions => {'Id' => @id}) 
        @femalesection =   FemaleSection.find(:first, :conditions => {'Id' => @id})
          
    @famliyhistory = FamliyHistory.find(:first, :conditions => {'Id' => @id})        
             @dentalissues = DentalIssues.find(:first, :conditions => {'id' => @id})
             @lungs = Lungs.find(:first, :conditions => {'id' => @id})
             @body = BodyStructure.find(:first, :conditions => {'id' => @id})
             @diabetes = Diabetes.find(:first, :conditions => {'id' => @id})
             @excretary = ExcretarySystem.find(:first, :conditions => {'id' => @id})
             @heart=HeartBlood.find(:first, :conditions => {'id' => @id})
             @nervous=NervousSystem.find(:first, :conditions => {'id' => @id})
             @other=OtherDiseases.find(:first, :conditions => {'id' => @id})
             @stomach=Stomach.find(:first, :conditions => {'id' => @id})
       
    filePersonal = File.join(Rho::RhoApplication::get_base_app_path(), 'Personal.txt')
            pfile=File.new(filePersonal,'a+')
          pfile.write(@personalform.Id+","+@personalform.Fname+","+@personalform.Mname+","+@personalform.Lname+","+@personalform.Gender+","+@personalform.Dob+","+@personalform.Pob+","+@personalform.Age+","+@personalform.Address+","+@personalform.Nationality+","+@personalform.Relation_to_Insured+","+@personalform.Occupation+","+@personalform.Length_of_Service+"\n")
    fileFinancial = File.join(Rho::RhoApplication::get_base_app_path(), 'Financial.txt')
                ffile=File.new(fileFinancial,'a+')
              ffile.write(@financialform.Id+","+@financialform.Annual_Income+","+@financialform.Sum_Assured+","+@financialform.Payable_Time+","+@financialform.Amount_of_Deposit+"\n")
        
    fileGen = File.join(Rho::RhoApplication::get_base_app_path(), 'GeneralHealth.txt')
                 pfile1=File.new(fileGen,'a+')
               pfile1.write(@generalhealth.Id+","+@generalhealth.Email+","+@generalhealth.Army_Navy+","+@generalhealth.Height+","+@generalhealth.Weight+","+@generalhealth.Doc+","+@generalhealth.Prev_Surgeries+"\n")
       
    filePer = File.join(Rho::RhoApplication::get_base_app_path(), 'Narcotics.txt')
                    pfile2=File.new(filePer,'a+')
                  pfile2.write(@narcotics.Id+","+@narcotics.Alc_Quan+","+@narcotics.Alc_Type+","+@narcotics.Smoke_Quan+","+@narcotics.Tobacco_Quan+","+@narcotics.Drugs_Quan+","+@narcotics.Drugs_Type+"\n")
       
    filefam = File.join(Rho::RhoApplication::get_base_app_path(), 'FamilyHistory.txt')
                     pfile3=File.new(filefam,'a+')
                   pfile3.write(@famliyhistory.Id+","+@famliyhistory.Diabetes+","+@famliyhistory.Cancer+","+@famliyhistory.Infec_Diseases+"\n")
             
    @abc = PersonalForm.find(:first, :conditions => {'Id' => @id})
          @gender=@abc.Gender
          if @gender == 'Female'
            filePerson = File.join(Rho::RhoApplication::get_base_app_path(), 'FemaleSection.txt')
                          pfile4=File.new(filePerson,'a+')
                        pfile4.write(@femalesection.Id+","+@femalesection.Pregnant+","+@femalesection.Last_Delivery+","+@femalesection.Abortion+","+@femalesection.UMP+","+@femalesection.RMP+","+@femalesection.Complications+","+@femalesection.Weakness+"\n")

          end   
          
                   
               fileNameW1 = File.join(Rho::RhoApplication::get_base_app_path(), 'FinalDiseases2.txt')
            afile1=File.new(fileNameW1,'a+')
    afile1.write(@bodilydefects.handicap)
        
    afile1.write(@dentalissues.id+","+@dentalissues.pyrarrhoea+","+@dentalissues.missingteeth+",")
    afile1.write(@lungs.tuberculosis+","+@lungs.pneumonia+","+@lungs.spittingofblood+","+@lungs.bronchitis+","+@lungs.asthma+","+@lungs.persistentcough+",")
    afile1.write(@heart.chestpain+","+@heart.rheumaticfever+","+@heart.infraction+","+@heart.bp+","+@heart.breathlessness+","+@heart.palpitation+","+@heart.heartattack+",")
    afile1.write(@stomach.hepatitis+","+@stomach.ulcer+","+@stomach.colitis+","+@stomach.piles+","+@stomach.anaemia+","+@stomach.jaundice+","+@stomach.dysentery+","+@stomach.gallstone+",")
    afile1.write(@excretary.chronic+","+@excretary.prostratediseases+","+@excretary.urinary+","+@excretary.kidneystone+",")
    afile1.write(@nervous.epilepsy+","+@nervous.paralysis+","+@nervous.insanity+","+@nervous.nervousbreakdown+","+@nervous.alzheimer+","+@nervous.multiplesclerosis+","+@nervous.parkinson+",")
    afile1.write(@body.syphilis+","+@body.hernia+","+@body.goitre+","+@body.filariasis+","+@body.varicoseveins+","+@body.skineruptions+","+@body.gonorrhea+",")
    afile1.write(@diabetes.type1+","+@diabetes.typ2+","+@diabetes.gestationaldiabetes+",")
    afile1.write(@other.cancer+","+@other.hiv+","+@other.leprosy+","+@other.rheumatism+","+@other.tumor+","+@other.gout+","+"/n")

              
               
               @disease = Array.new(11)
        @disease= Array[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]     
        
  if @bodilydefects.handicap == 'y'
         @disease[0]=0.5
       end          
     
        
        if @dentalissues.missingteeth == 'y'
         @disease[1]=0.1
       end 
      if @dentalissues.pyrarrhoea == 'y'
        @disease[1]=1
      end  

    if @lungs.persistentcough == 'y'
        @disease[2]=0.2
      end 
     if @lungs.asthma == 'y'
       @disease[2]=0.3
     end
if @lungs.bronchitis == 'y'
       @disease[2]=0.3
     end          
if @lungs.spittingofblood == 'y'
       @disease[2]=0.7
     end          
if @lungs.pneumonia == 'y'
       @disease[2]=1
     end          
if @lungs.tuberculosis == 'y'
       @disease[2]=1
     end          
if @heart.bp == 'y'
       @disease[3]=0.2
     end          
if @heart.breathlessness == 'y'
       @disease[3]=0.5
     end  
if @heart.palpitation == 'y'
       @disease[3]=0.5
     end              
if @heart.heartattack == 'y'
       @disease[3]=0.5
     end                
if @heart.chestpain == 'y'
       @disease[3]=0.7
     end           
if @heart.infraction == 'y'
       @disease[3]=1
     end            
if @heart.rheumaticfever == 'y'
       @disease[3]=1
     end                
if @stomach.jaundice == 'y'
       @disease[4]=0.2
     end          
    
if @stomach.dysentery == 'y'
       @disease[4]=0.2
     end              
    
if @stomach.gallstone == 'y'
       @disease[4]=0.2
     end           
    
if @stomach.piles == 'y'
       @disease[4]=0.3
     end              
    
if @stomach.colitis == 'y'
       @disease[4]=0.5
     end          
    
if @stomach.anaemia == 'y'
       @disease[4]=0.5
     end           
    
if @stomach.ulcer == 'y'
       @disease[4]=0.5
     end              
if @stomach.hepatitis == 'y'
       @disease[4]=1
     end          
if @excretary.kidneystone == 'y'
       @disease[5]=0.3
     end                  
if @excretary.urinary == 'y'
       @disease[5]=0.3
     end                 
if @excretary.prostratediseases == 'y'
       @disease[5]=0.3
     end                 
if @excretary.chronic == 'y'
       @disease[5]=1
     end            
if @nervous.parkinson == 'y'
       @disease[6]=0.2
     end             
if @nervous.paralysis == 'y'
       @disease[6]=0.5
     end             
if @nervous.insanity == 'y'
       @disease[6]=0.5
     end            
if @nervous.nervousbreakdown == 'y'
       @disease[6]=0.5
     end             
if @nervous.alzheimer == 'y'
       @disease[6]=0.5
     end             

if @nervous.multiplesclerosis == 'y'
       @disease[6]=0.5
     end             

if @nervous.epilepsy == 'y'
       @disease[6]=1
     end             

if @body.veriscoseveins == 'y'
       @disease[7]=0.2
     end             
if @body.skineruptions == 'y'
       @disease[7]=0.2
     end             
if @body.gonorrhea == 'y'
       @disease[7]=0.2
     end             
if @body.hernia == 'y'
       @disease[7]=0.5
     end             
if @body.goitre == 'y'
       @disease[7]=0.5
     end             
if @body.filariasis == 'y'
       @disease[7]=0.5
     end             
if @body.syphilis == 'y'
       @disease[7]=1
     end             

if @diabetes.gestationaldiabetes == 'y'
       @disease[8]=0.5
     end          
     
 if @diabetes.type1 == 'y'
       @disease[8]=1
     end            
 
if @diabetes.typ2 == 'y'
       @disease[8]=1
     end           


if @other.gout == 'y'
       @disease[9]=0.5
     end          
if @other.tumor == 'y'
       @disease[9]=0.5
     end         
if @other.rheumatism == 'y'
       @disease[9]=0.5
     end           
if @other.leprosy == 'y'
       @disease[9]=0.5
     end          
         

if @other.hiv == 'y'
       @disease[9]=1
     end          

if @other.cancer == 'y'
       @disease[9]=1
     end          
filePersonal = File.join(Rho::RhoApplication::get_base_app_path(), 'FinalDiseases.txt')
          pfile=File.new(filePersonal,'a+')
          pfile.write("#{@disease}"+",")  
          pfile.write(@body.hernia)
     
     @final=0
#fileNameW1 = File.join(Rho::RhoApplication::get_base_app_path(), 'neu4.txt')
   
 #   Rho::AsyncHttp.download_file(
  #   :url => "http://localhost:80//neu2.txt",
   # :filename => fileNameW1,
   #:headers => {},
   # :callback => url_for(:action => :httpdownload_callback)
   # )
     fileNameW1 = File.join(Rho::RhoApplication::get_base_app_path(), '/public/network/testsync1.txt')
       afile1=File.new(fileNameW1,'r+')
       while line = afile1.gets
            linesplit = line.split(",")
       end
       
filePersonal3 = File.join(Rho::RhoApplication::get_base_app_path(), '/public/network/linesplit.txt')
          pfile3=File.new(filePersonal3,'a+')

          for k in 0..120
          pfile3.write(linesplit[k]+",")
        end
puts(fileNameW1)
       
       @c=0
 
  @n1=Array.new(10)
  
  for l in 0..9
    @n1[l]=0
end

     for i in 0..9
        for j in 0..10
                
            @n1[i] += ( @disease[j] * linesplit[@c].to_f )
            @c=@c+1
            
     end    
      @n1[i] =  (1/(1+(2.7183**(-@n1[i]))))
    
   end
   
   for i in 0..9
     @final +=(@n1[i]*linesplit[@c].to_f)
     @c=@c+1  
   end 

@final+=(@disease[10])*linesplit[@c].to_f
  
@final =  (1/(1+(2.7183**(-@final))))
filePersonal2 = File.join(Rho::RhoApplication::get_base_app_path(), '/public/network/FinalCompute.txt')
          pfile2=File.new(filePersonal2,'w+')

               
pfile2.write(@final)
@age=0
 @age=@personalform.Age.to_f
 @age=@age/60

               


filePersonal4 = File.join(Rho::RhoApplication::get_base_app_path(), 'random.txt')
          pfile4=File.new(filePersonal4,'a+')

pfile4.write(@age)
pfile4.write("next")
      @height1=@generalhealth.Height.to_f
#pfile4.write("working height")
      @weight1=@generalhealth.Weight.to_f
#pfile4.write("working weight")
   pfile4.write(@height1)
pfile4.write("next")
   pfile4.write(@weight1)
pfile4.write("next")
 # @bmi=0
  
  @b=@height1**2
  @bmi= @weight1/@b
pfile4.write(@b)
pfile4.write("next")
  @catbmi=0
pfile4.write(@bmi)
pfile4.write("next")
  
  if @bmi<=15.5
    @catbmi=7
  end

if @bmi>15.5 && @bmi<=16.5
    @catbmi=5
  end
if @bmi>16.5 && @bmi<=18.5
    @catbmi=2
  end
if @bmi>18.5 && @bmi<=25
    @catbmi=0
  end
if @bmi>25 && @bmi<=30
    @catbmi=2
  end
if @bmi>30 && @bmi<=35
    @catbmi=5
  end  
if @bmi>35 && @bmi<=40
    @catbmi=7
  end

  if @bmi>40
    @catbmi=8
  end
  
  @armynavy = @generalhealth.Army_Navy
  
  if @armynavy =='y'
    @catbmi=@catbmi+2
  end
  @catbmi=@catbmi.to_f
    @finalgenhealth = @catbmi/10
pfile4.write(@finalgenhealth)
pfile4.write("next")    
    @alcohol = @narcotics.Alc_Quan.to_f
    
    @smoke = @narcotics.Smoke_Quan.to_f
    @tobacco = @narcotics.Tobacco_Quan.to_f
    @drugs = @narcotics.Drugs_Quan.to_f
    
    @finalnarcotics = (@alcohol+@smoke+@tobacco+@drugs)/30
    
    if @finalnarcotics>1
      @finalnarcotics=1
    end
pfile4.write(@finalnarcotics)
pfile4.write("next")

filePersonal5 = File.join(Rho::RhoApplication::get_base_app_path(), 'random2.txt')
          pfile5=File.new(filePersonal5,'a+')

pfile5.write(@finalgenhealth)
pfile5.write("next")
pfile5.write(@finalnarcotics)
pfile5.write("next")

    @family1=@famliyhistory.Diabetes
    @family2=@famliyhistory.Cancer
    @family3=@famliyhistory.Infec_Diseases
   @finalfamily=0 
    @c2=0
    if @family1 == 'y' 
      @c2=@c2+1
    end
    if @family2 == 'y'
      @c2=@c2+1
    end
 if @family3 != '0'
      @c2=@c2+1
 end
 
 if @c2==1
   @finalfamily=0.2
 end
if @c2==2
  @finalfamily=0.5
end
if @c2==3
  @finalfamily=1
end
pfile5.write(@finalfamily)
pfile5.write("next")

@c3=0
if @gender == 'Female'


@preg=@femalesection.Pregnant

@abortion=@femalesection.Abortion
@ump=@femalesection.UMP
@rmp=@femalesection.RMP
@complications=@femalesection.Complications
@weakness=@femalesection.Weakness


if @preg == 'y' 
     @c3=@c3+1
   end
if @abortion == 'y' 
     @c3=@c3+1
   end
if @ump == 'y' 
     @c3=@c3+1
   end
if @rmp == 'y' 
     @c3=@c3+1
   end
if @complications == 'y' 
     @c3=@c3+1
   end
if @weakness == 'y' 
     @c3=@c3+1
   end  

   if @c3>0
   @c3=@c3/6
   end
   if @c3==0
     @c3=0.1
   end
end   
pfile5.write(@c3)
pfile5.write("next")
filePersonal6 = File.join(Rho::RhoApplication::get_base_app_path(), 'random3.txt')
          pfile6=File.new(filePersonal6,'a+')

pfile6.write(@finalfamily)
pfile6.write("next")

@hazardous=@personalform.Occupation

@hazardous1=0

  if @hazardous == 'Army' || @hazardous == 'Navy' || @hazardous == 'Chemical Plants' || @hazardous == 'Nuclear'

       @hazardous1=1
   
       
         
       else
            if @hazardous == 'Construction' 
             @hazardous1=0.5
            else
         @hazardous1 = 0
      end 
  end
pfile6.write(@hazardous1)
#filePersonal31 = File.join(Rho::RhoApplication::get_base_app_path(), 'FinalCompute3.txt')
 #       pfile31=File.new(filePersonal31,'a+')
 # pfile31.write(@final+","+@age+","+@c3+","+@finalfamily+","+@finalnarcotics+","+@finalgenhealth+","+@hazardous1)

#Rho::AsyncHttp.download_file(
#:url => "http://localhost:80//neu3.txt",
#:filename => fileNameW6,
#:headers => {},
#:callback => url_for(:action => :httpdownload_callback)

#)

fileNameW6 = File.join(Rho::RhoApplication::get_base_app_path(), '/public/network/testsync.txt')

       afile6=File.new(fileNameW6,'r+')
       while line = afile6.gets
            linesplit6 = line.split(",")
       end
filePersonal13 = File.join(Rho::RhoApplication::get_base_app_path(), '/public/network/linesplit6.txt')
          pfile13=File.new(filePersonal13,'a+')

          for k in 0..63
          pfile13.write(linesplit6[k]+",")
        end
          
@lastcomp = Array.new(8)
 @lastcomp= Array[0, 0, 0, 0, 0, 0, 0, 1]     
 
@lastcomp[0]=@age
@lastcomp[1]=@finalgenhealth
@lastcomp[2]=@finalnarcotics
@lastcomp[3]=@finalfamily
@lastcomp[4]=@c3
@lastcomp[6]=@hazardous1
@lastcomp[5]=@final

@d=0
@d2=0
@d3=0
@d4=0

@final2=0
@n3=Array.new(7)
@final3=0
@final4=0
@final5=0

for v in 0..6
@n3[v]=0
end

for z in 0..6
 for x in 0..7
         
     @n3[z] += ( @lastcomp[x] * linesplit6[@d].to_f )
     @d=@d+1
     
end    
@n3[z] =  (1/(1+(2.7183**(-@n3[z]))))

end

for z in 0..6
@final2 +=(@n3[z]*linesplit6[@d].to_f)
@d=@d+1  
end 
@final2= @final2 + (@lastcomp[7])*linesplit6[@d].to_f

@final2 =  (1/(1+(2.7183**(-@final2))))
#@d=@d+1

#for z in 0..6
#@final3 +=(@n3[z]*linesplit6[@d].to_f)
#@d=@d+1  
#end 

#@final3= @final3 + (@lastcomp[7])*linesplit6[@d].to_f

#@final3 =  (1/(1+(2.7183**(-@final3))))
#@d=@d+1


#for z in 0..6
#@final4 +=(@n3[z]*linesplit6[@d].to_f)
#@d=@d+1  
#end 


#@final4= @final4 + (@lastcomp[7])*linesplit6[@d].to_f

#@final4 =  (1/(1+(2.7183**(-@final4))))
#@d=@d+1


#for z in 0..6
#@final5 +=(@n3[z]*linesplit6[@d].to_f)
#@d=@d+1  
#end 

#@final5= @final5 + (@lastcomp[7])*linesplit6[@d].to_f

#@final5 =  (1/(1+(2.7183**(-@final5))))

filePersonal7 = File.join(Rho::RhoApplication::get_base_app_path(), '/public/network/FinalCompute22.txt')
          pfile7=File.new(filePersonal7,'w+')
pfile7.write(@final2)
#filePersonal71 = File.join(Rho::RhoApplication::get_base_app_path(), 'FinalCompute23.txt')
 #         pfile71=File.new(filePersonal71,'a+')
#pfile71.write(@final3)

#filePersonal72 = File.join(Rho::RhoApplication::get_base_app_path(), 'FinalCompute24.txt')
 #         pfile72=File.new(filePersonal72,'a+')
#pfile72.write(@final4)               

#filePersonal73 = File.join(Rho::RhoApplication::get_base_app_path(), 'FinalCompute25.txt')
 #         pfile73=File.new(filePersonal73,'a+')
#pfile73.write(@final5)               


    redirect :controller => :FinalDisplay, :action => :new

  end

  # POST /BodilyDefects/{1}/update
  def update
    @bodilydefects = BodilyDefects.find(@params['id'])
    @bodilydefects.update_attributes(@params['bodilydefects']) if @bodilydefects
    redirect :action => :index
  end

  # POST /BodilyDefects/{1}/delete
  def delete
    @bodilydefects = BodilyDefects.find(@params['id'])
    @bodilydefects.destroy if @bodilydefects
    redirect :action => :index  
  end
end
