class PersonMailer < ApplicationMailer
  def balance_email(person)
    @person = person
    mail(to: "rachel@collingridge.net", subject: "#{person.full_name}" )
  end
end
