module EnrollmentsAction
  class Base < ActionController::API
    # Only allow a trusted parameter "white list" through.
    def enrollment_params
      params.permit(:total_value, :number_invoices, :invoice_due_date, :institution_id, :student_id)
    end

    # Use callbacks to share common setup or constraints between actions
    def set_enrollment
        @enrollment = Enrollment.find(params[:id])
    end
  end
end