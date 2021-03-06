# February 2015, Jie Yang
#
# Copyright (c) 2015-2016 Cisco and/or its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$LOAD_PATH.unshift(*Dir[File.expand_path('../../files/default/vendor/gems/**/lib', __FILE__)])

require 'cisco_node_utils'

class Chef
  class Provider
    # Chef Provider definition for CiscoSnmpGroup
    class CiscoSnmpGroup < Chef::Provider
      provides :cisco_snmp_group

      def initialize(new_resource, run_context)
        super(new_resource, run_context)
        @name = new_resource.name
        Chef::Log.debug "Cisco snmpgroup #{@name}"
      end

      def whyrun_supported?
        true
      end

      def load_current_resource
        @snmp_group = Cisco::SnmpGroup.groups[@name]
      end

      def action_create
        if @snmp_group.nil?
          fail 'Snmp group creation not supported. ' \
          "Group #{@new_resource.name} not created."
        else
          Chef::Log.info "SnmpGroup #{@new_resource.name} already exists"
        end
      end

      def action_destroy
        if @snmp_group.nil?
          Chef::Log.info "SnmpGroup #{@new_resource.name} already destroyed"
        else
          fail 'Snmp group deletion not supported.'
        end
      end
    end
  end
end
