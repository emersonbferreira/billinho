class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]
  # GET /invoices
  def index
    @invoices = Invoice.all

    render json: @invoices
  end

  # GET /invoices/1
  def show
    render json: @invoice
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)
    if params[:status] == nil or params[:status] == 'nil' or params[:status] == ''
      @invoice.status = 'Aberta'
    end
    print(@invoice.status)
    if @invoice.save
      render json: @invoice, status: :created, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoices/1
  def update
    if @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:enrolment_id])
    end

    # Only allow a trusted parameter "white list" through.
    def invoice_params
      params.permit(:invoice_amount, :due_date, :enrollment_id, :status)
    end
end
