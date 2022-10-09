require 'caze'

module EnrollmentsAction
  include Caze

  has_use_case :create_enrollment, CreateEnrollment
end