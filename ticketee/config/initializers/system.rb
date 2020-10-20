Dry::Rails.container do
  config.features = %i[application_contract]
  auto_register!('lib')
end
