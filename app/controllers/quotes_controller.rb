class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index

    if(params.empty?)
      @quotes = Quote.all
    else
    customers =Customer.where(["first_name LIKE ?","%#{params[:first_name_search]}%"]).where(["last_name LIKE ?","%#{params[:last_name_search]}%"])
    inventories = Inventory.where(["vin LIKE ?","%#{params[:vin_search]}%"])
    @quotes = Quote.where(customer_id: customers.pluck(:id))
    @quotes = @quotes.where(inventory_id: inventories.pluck(:id))
      end
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    @inv = params[:inv]
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    if(@quote.inventory_id.nil? || @quote.customer_id.nil?)
       redirect_to new_quote_path
      return
    end
    inv = Inventory.find(@quote.inventory_id)
    p = Quote.calc_price(inv.id)
    @quote.price = "%.2f" % (p)
    @quote.sold = false

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        inv = Inventory.find(@quote.inventory_id)
        p = inv.wholesale_price * 0.043 + inv.wholesale_price
        @quote.price = "%.2f" % (p)
        @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_finance
    @quote_id = params[:quote_id]
    @interest = params[:interest].to_f
    @years = params[:years].to_i
    respond_to do |format|
      format.js
    end
  end

  def mark_sold
    q = Quote.find(params[:id])
    inv = q.inventory
    if inv.sold
      flash[:notice] = 'This vehicle has already been sold.'
    else
      q.sold = true
      inv.sold = true
      q.save
      inv.save
    end
    redirect_to q
  end

  def undo_sale
    q = Quote.find(params[:id])
    inv = q.inventory
    q.sold = false
    inv.sold = false
    q.save
    inv.save
    redirect_to q
  end

  def sold_quotes
    if(params.empty?)
      @quotes = Quote.all
    else
      customers =Customer.where(["first_name LIKE ?","%#{params[:first_name_search]}%"]).where(["last_name LIKE ?","%#{params[:last_name_search]}%"])
      inventories = Inventory.where(["vin LIKE ?","%#{params[:vin_search]}%"])
      @quotes = Quote.where(customer_id: customers.pluck(:id))
      @quotes = @quotes.where(inventory_id: inventories.pluck(:id))
    end
  end

  def download
    html = render_to_string(:action => :resume, :layout => false)
    pdf = WickedPdf.new.pdf_from_string(html)
    send_data(pdf,
              :filename    => "quote.pdf",
              :disposition => 'attachment')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:customer_id, :inventory_id, :price, :sold)
    end
end
