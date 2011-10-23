module FormHelper
  def setup_company(company)
    company.users ||= User.new
    company.users.build
    company
  end
end