When(/^I choose to apply the config$/) do |yml|
  @actual_dir_structure = mkdirs(yml)
end

Then(/^the following directory structure should be created$/) do |expected_structure|
  expect(@actual_dir_structure).to eq dir_structure(expected_structure)
end

