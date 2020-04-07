require('minitest/autorun')
require('minitest/reporters')
require_relative('program')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestProgram < Minitest::Test

end
