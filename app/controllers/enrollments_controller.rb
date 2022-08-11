class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :update, :destroy]

  # GET /enrollments
  def index
    @enrollments = Enrollment.all

    render json: @enrollments
  end

  # GET /enrollments/1
  def show
    render json: @enrollment
  end

  # POST /enrollments
  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      render json: @enrollment, status: :created, location: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
    due_date = Date.new(2018, 8, @enrollment.invoice_due_date)
    invoice_amount = amount_calculate(@enrollment.total_value, @enrollment.number_invoices)
    amount_remainder = remainder_calculate(invoice_amount, @enrollment.number_invoices, @enrollment.total_value)
    (1..@enrollment.number_invoices).step(1) do |n|
      if n == @enrollment.number_invoices
        invoice_amount += amount_remainder
      end
      if due_date <= today
        @enrollment.invoice.create!(invoice_amount: invoice_amount, due_date: due_date + n.months, enrollment_id: @enrollment.id, status: 'Aberta')
      else
        @enrollment.invoice.create!(invoice_amount: invoice_amount, due_date: due_date + (n-1).months, enrollment_id: @enrollment.id, status: 'Aberta')
      end
    end
  end

  # PATCH/PUT /enrollments/1
  def update
    if @enrollment.update(enrollment_params)
      render json: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enrollments/1
  def destroy
    @enrollment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def enrollment_params
      params.permit(:total_value, :number_invoices, :invoice_due_date, :institution_id, :student_id)
    end
    
    #Calculate value of invoice
    def amount_calculate(total_value,number_invoices)
      invoice_amount = total_value.to_f / number_invoices.to_f
      invoice_amount = invoice_amount.round(2)
    end
    
    #Calculate value vestige in amount_calculate
    def remainder_calculate(invoice_amount, number_invoices, total_value)
      amount_remainder = ((invoice_amount * number_invoices) - total_value).round(2)
    end
    
    def today(date = 15)
      Date.new(2018, 8, date)
    end
end
