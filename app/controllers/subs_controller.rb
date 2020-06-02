class SubsController < ApplicationController
  #skinny controllers actions
  # fat models logic
#           http verbs 
# C create    POST
# R read      GET
# U update    PUT / Patch
# D destroy   DELETE

# by default the controller actions return HTML 
# can return XML and JSON
# the go to an action that does

# # index  - shows all records from the database
#   # READ / GET Requests (pay attention to pluarlity or singularity)
#   def index
#     @model_names = model_name.all #creating a variable of the plural of the model name.
#   end

# # show    - show a single record from the database, id
#   def show
#     @model_name = Model_name.find(params[:id]) #finds and returns a single record and sets it to a variable
#   end

# # new   - new form to create a new record, create record in memory (form to pass info to create)
#   def new
#     @model_name = Model_name.new #will create a record only in memory
#   end

# # edit  - edit form for a record, id, updating record and memory (after submission) (form to pass information to update)
#   def edit
#     @model_name = Model_name.find(params[:id])
#   end

# create  - creates record in database 
  #CREATE / POST
  # def create
  #   @model_name = Model_name.new(model_name_params)
  #   if @model_name.save 
  #     do something or go somewhere
  #   else
  #     render :new
  #   end
  # end

  # .
  # .
  # .
  # private (method cant be used in other files)
  #   def model_name_params
  #     params.require(:model_name).permit(:attr, :everythingtablehas) (i.e name age email etc.)
  #   end


# update - update the record in the database
  # UPDATE / PUT
  # def update
  #   @model_name = Model_name.find(params[:id])    
  #   if @model_name.update()
  #     do something or go somewhere
  #     else
  #       render :edit
  #     end
  # end

# destroy - delete the record from the database, id (no turning back from here!)
  # DESTROY CRUD ACTION
  # def destroy
  #   @model_name = Model_name.find(params[:id])
  #   @model_name.destroy
  #   send them somewhere 

  #   or

  #   @Model_name.find(params[:id]).destroy (destroying it right then and there)
  #   send somewhere
  # end

  # callback logic at a certain time
  # before_action
  # after_action
  # skip_before_action
  # before_action :method_name
  # before_action :method_name, [:show, :update, :edit, :destroy]
  # before_action :method_name, except: [:show, :update, :edit, :destroy]




  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    # @sub = Sub.find(params[:id])
    # @sub.destroy
    # redirect_to subs_path

    Sub.find(params[:id]).destroy
    redirect_to subs_path
  end

private
  def sub_params
    params.require(:sub).permit(:name)
  end

end
