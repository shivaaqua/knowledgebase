RSpec::Matchers.define :trim do |attr|

  match do |rec|
    rec.send("#{attr}=", ' 1 ')
    rec.valid?
    @valid = rec.send(attr).to_s == '1'
  end
  
  failure_message_for_should do |rec|
    "#{attr} should be trimmed but not trimmed" unless @valid
  end

  failure_message_for_should_not do |rec|
    "#{attr} should not be trimmed but trimmed" if @valid
  end
end

