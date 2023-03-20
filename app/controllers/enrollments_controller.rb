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
    @enrollment = EnrollmentsAction.create_enrollment(params)
    if @enrollment
      render json: @enrollment, status: :created, location: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_entity
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
