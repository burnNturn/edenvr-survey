require 'date'


class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @params = params
    @customers = if !params[:search].present? || (params[:start_date].empty? &&
                      params[:end_date].empty? && params[:age].empty? &&
                      params[:gender].empty? && params[:income].empty? &&
                      params[:race].empty? && params[:game].empty?)
                    Customer.all
                  else
                    Customer.search(params)
                  end
    if params[:format] == 'csv'
      send_data @customers.to_csv, filename: "users_#{DateTime.now.nsec}.csv"
    else
      respond_to do |format|
          format.js
          format.html
      end
    end
  end
  

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @games_avail = Game.where(:available => true)
  end

  # GET /customers/1/edit
  def edit
    @machine = @customer.machine
  end

  # POST /customers
  # POST /customers.json
  def create
    byebug
    @customer = Customer.new(customer_params)
    @machine = @customer.machine
    respond_to do |format|
      if @customer.save
        format.js
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:date, :machine, :game, :age, :gender, :race, :income, :group_type, :group_size, :format)
    end
end
