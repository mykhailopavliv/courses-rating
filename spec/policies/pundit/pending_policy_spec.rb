require 'rails_helper'

describe PendingPolicy do
  subject { described_class.new(user, record) }

  include_context 'admin pending policy context', 'Course', true
  include_context 'admin pending policy context', 'Course', false

  include_context 'admin pending policy context', 'Review', true
  include_context 'admin pending policy context', 'Review', false
end
