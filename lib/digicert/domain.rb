require "digicert/base"
require "digicert/actions/create"

module Digicert
  class Domain < Digicert::Base
    include Digicert::Actions::Create

    private

    def resource_path
      "domain"
    end

    def validate_validations(attributes)
      attributes.each do |attribute|
        validate_validation(attribute)
      end
    end

    def validate_validation(type:, **attributes)
      { type: type }.merge(attributes)
    end

    def validate(name:, organization:, validations:, **attributes)
      required_attributes = {
        name: name,
        organization: organization,
        validations: validate_validations(validations)
      }

      required_attributes.merge(attributes)
    end
  end
end