require 'caze'

module EnrollmentsAction
  class CreateEnrollment < Base
    include Caze

    attr_accessor :enrollment, :params
    export :create_enrollment, as: :create_enrollment

    def initialize(params)
      @params = params
      @enrollment = Enrollment.new(enrollment_params)
    end

    def create_enrollment
      if @enrollment.save
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
        @enrollment
      end
    end

    private
      #Calculate value of invoice
      def amount_calculate(total_value,number_invoices)
        invoice_amount = total_value.to_f / number_invoices.to_f
        invoice_amount = invoice_amount.round(2)
      end

      #Calculate value vestige in amount_calculate
      def remainder_calculate(invoice_amount, number_invoices, total_value)
        amount_remainder = ((invoice_amount * number_invoices) - total_value).round(2)
      end

      #Set today
      def today(date = 15)
        Date.new(2018, 8, date)
      end
  end
end
