# frozen_string_literal: true

require_relative 'cipher'

cipher = Cipher.new(10)
puts cipher.encrypt('abz')
puts cipher.decrypt('klj')
