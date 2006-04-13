require 'net/https'
require 'rexml/document'

require 'user'

require 'rubygems'
require_gem 'actionpack'

# We must override redirect_to in ActionController::Base to allow this class to
# redirect the user to the CAS server for login.
class ActionController::Base; public :redirect_to; end

# Module containing the CASFilter and associated constants.  This particular
# version is designed to be used with Rails, but you can imagine expanding it
# to work in other settings as well.  If you would like to override the default
# values of CAS_SERVER_URL or PORT, you may do so as follows:
#
#  require 'cas'
#
#  module CAS; CAS_SERVER_URL = 'netid.tamu.edu'; PORT = 443; end
#
# Author:: Matt Walker
# Acknowledgements:: Matt Walker wrote the CAS client, on which this code is based.
module CAS
    # The URL of the CAS server to authenticate against.
    CAS_SERVER_URL = 'signin.mygcx.org'

    # The port the CAS server is running on.
    PORT = 443

    # The class for performing authentication filtering in Rails.  The most
    # important method is +filter+, which is static (thus requiring assisting
    # methods to be static as well).  This version is simplistic, but you can
    # imagine extending it to allow gatewaying or authentication by proxy.
    class CASFilter
        # Filtering method specific to Rails.  In particular, it is meant to be
        # used with Rails' +before_filter+ method to add CAS authentication to
        # one or more actions, as in the following example:
        #
        #  require 'cas'
        #
        #  class AdminController < ApplicationController
        #    before_filter CAS::CASFilter, :except => :logout
        #    # ...
        #  end
        #
        # When a user logs in, their cas receipt object is stashed in the session.
        # This indicates to all future requests that the user is authenticated.
        # If there is no cas receipt object in the session, the user must provide a
        # valid CAS ticket to login.  If they have no ticket, they are
        # redirected to the CAS server to get one.  If they do have a ticket,
        # it is validated with the server before creating their user object in
        # the session (and possibly database).
        #
        # Inputs:
        # [controller] The ActionController performing filtering.  If its session contains a user object, the user must have successfully authenticated against CAS.
        #
        # Returns a boolean: did user successfully authenticate?
        def self.filter(controller)
            # If we have a cas receipt, a successful login was made for this session
            return true unless controller.session[:cas_receipt].nil?

            # Otherwise, we require a ticket to authenticate the user
            service = controller.url_for()
            ticket = controller.params[:ticket]
            if ticket.nil? || ticket == ""
                controller.redirect_to "https://#{CAS_SERVER_URL}/cas/login?service=#{service}"
                return false
            end

            cas_receipt = validate_ticket(service, ticket)
            return false if cas_receipt.nil?
			# put the information cas gave back into the session
			controller.session[:cas_receipt] = cas_receipt
            return true
        end

        private

        # Validates a CAS ticket with the server.
        #
        # Inputs:
        # [service] The URL of the calling service.
        # [ticket] The CAS ticket returned by the server in the URL.
        #
        # Returns an array: [ NetID, UIN ]
        def self.validate_ticket(service, ticket)
            http = Net::HTTP.new(CAS_SERVER_URL, PORT)
            http.use_ssl = true
            breakpoint
            page = http.get("/cas/serviceValidate?service=#{service}&ticket=#{ticket}")

            # Parse XML document returned by CAS server
            doc = REXML::Document.new(page)
            return unless REXML::XPath.first(doc, 'cas:serviceResponse/cas:authenticationFailure',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').nil?
            return if REXML::XPath.first(doc, 'cas:serviceResponse/cas:authenticationSuccess',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').nil?

            # Parse text values for NetID and UIN
            cas_receipt = Hash.new
            cas_receipt[:user] = REXML::XPath.first(doc,
                'cas:serviceResponse/cas:authenticationSuccess/cas:user',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').get_text.value
            cas_receipt[:designation] = REXML::XPath.first(doc,
                'cas:serviceResponse/cas:authenticationSuccess/cas:attributes/designation',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').get_text.value
			cas_receipt[:peopleid] = REXML::XPath.first(doc,
                'cas:serviceResponse/cas:authenticationSuccess/cas:attributes/peopleid',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').get_text.value
			cas_receipt[:authnRealm] = REXML::XPath.first(doc,
                'cas:serviceResponse/cas:authenticationSuccess/cas:attributes/authnRealm',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').get_text.value
			cas_receipt[:emplid] = REXML::XPath.first(doc,
                'cas:serviceResponse/cas:authenticationSuccess/cas:attributes/emplid',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').get_text.value
			cas_receipt[:firstName] = REXML::XPath.first(doc,
                'cas:serviceResponse/cas:authenticationSuccess/cas:attributes/firstName',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').get_text.value
			cas_receipt[:lastName] = REXML::XPath.first(doc,
                'cas:serviceResponse/cas:authenticationSuccess/cas:attributes/lastName',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').get_text.value
			cas_receipt[:ssoGuid] = REXML::XPath.first(doc,
                'cas:serviceResponse/cas:authenticationSuccess/cas:attributes/',
                'cas:serviceResponse' => 'http://www.yale.edu/tp/cas').get_text.value
            return cas_receipt
        end
    end
end
