# 0.3.7 01.11.2016

## [dependencies]
 * Update to fog-1.36.0

## [openstack]
  * Use `openstack_project_name` instead of `openstack_tenant`.
  * Use `openstack_domain_id`; `default` is used if it isn't specified.
  * Remove `volume_provider` and use compute's volumes instead as it saves some
	API calls.

# 0.3.6 17.10.2016

## [dependencies]
 * Use fog_profitbricks version that is compatible with ruby 1.9.x

# 0.3.5 21.09.2016

## [plan]
 * Fix that not all infrastructure_properties are required by providers

# 0.3.4 01.09.2016

## [plan]
 * Better error messages for infrastructure_properties validation.
 * Implement support for security groups.

## [openstack]
 * Implement support for security groups.

# 0.3.3 24.08.2016

## [samples]
 * Include plan and disk DB for lab10ch.

## [ovirt]
 * Update rbovrit to fix cloudinit issues with multiple nameserver entries.

# 0.3.2 04.08.2016

## [general]
 * Better support for pry integration.
 * Support for ruby193 and ruby22x.

# 0.3.1 03.08.2016

## [ovirt]
 * Automatically choose the first network, rather than a hardcoded one.

# 0.3.0 20.06.2016

## [general]
 * Drop support for ruby 1.9.3 in favor of 2.2+

# 0.2.8 14.06.2016

## [plan]
 * Make sure that `use_config_drive` is set to `true` if not present in node's
   definition.

# 0.2.7 08.06.2016

## [plan]
 * Allow networks without a default gateway. Must set `ip_defgw` to `false` AND
   `set_defaultgw` to `false` on a host level.

# 0.2.6 06.05.2016

## [ovirt]
 * `stop_node_instance` - wait until the node is down

## [dependencies]
 * Updated to use rbovirt-0.1.1

## [plan]
 * Implement `use_config_drive` infrastructure property. By default it is set to
   `true`, i.e. to use config drive.

## [openstack]
 * Implement `config_drive?` method for switching the config drive on and off

# 0.2.5 11.01.2016

## plan
 * implement deprecation warning if no `ip` is defined for a network interface.
   Please note that valid IP definitions are:
   * valid IP string
   * dhcp string
   * none string

# 0.2.4 07.12.2015

## plan
 * make sure `{}` is accepted as a valid network entry
 * implement newer definition of credentials
 * support `nil` network definitions for backward compatibility

# 0.2.3 06.11.2015

## [ovirt]
 * implement default storage domain for root and data disks. This can be used to
   specify which storage domain should be used for disks defined by the template
   during provisioning of VM.
 * Bundle rbovrit with cloud-init fix for RHEV 3.5.5 and above.

# 0.2.2 20.10.2015
## [cli]
 * improve error handling

## [plan]
 *  make stricter validation of node's interfaces

## [ovirt]
 * implement management of additional NICs via cloud-init


# 0.2.1 18.08.2015
## [core]
 * Remove `lib/infrastructure/core.rb`. Move things into `lib/infrastructure.rb`

## [doc]
 * Update documentation

## [general]
 * Implement _undeploy_ action that removes a deployment according to a plan and
   optionally removes also data volumes on a target cloud provider as well as
   from persistent volumes database

## [persistent_disk]
 * Refactor of `PersistenDisk#update` and `PersistentDisk#delete` methods

## [infrastructure]
 * Refactor dynamic provider loader
 * Simplify provider supported types and provider to class name lookups
 * Fix broken memory definition of xlarge flavor

## [base]
 * `add_node_nic` returns freshly created nic object

## [ovirt]
 * `add_node_nic` returns freshly created nic object

## [openstack]
 * Wait until the node is down in `Infrastructure::OpenStack#stop_node_instance`
 * Implement `manage_etc_hosts` in `Infrastructure::OpenStack#cloud_config`

# 0.2.0 23.07.2015

## [core]
 * Implement GLI parser for dopv command line tool
   * Implement `exit_code` method to PlanError and ProviderError
   * Fix parsing of `caller` in `Dopv::log_init` method
 * Update to fog-1.31.0
 * Update rhosapi-lab15ch deployment plan


# 0.1.1 22.07.2015
## [openstack]
 * Floating IP implementation

# 0.1.0 14.07.2015

## [general]
New major release with rewritten infrastructure code base and bare metal and
openstack cloud providers

Following has been refactored:
 * Infrastructure refactoring
   * Unified method names and variables
   * Ready to use destroy_* methods hence implementation of destroying of
     deployment can be done easily
   * Fixes in data disks manipulation routines

 * Plan refactoring
   * More information has been added to error messages in infrastructure and
     network validation part

 * General refactoring
   * Error messages moved to appropriate modules

## [plan]
 * Simplify plan parser
   * remove superfluos conditional statements in assignments of node properties
   * do not evaluate networks definition for bare metal

## [base] 
 * Add `set_gateway?` method
 * Fix detachment of disks in destroy method

## [openstack]
 * Flavor method returns m1.medium as a flavor, hence the flavor keyword may be
   optional
 * change instance to node_instance in `wait_for_task_completion` method to keep
   parameters consistent accross codebase
 * Add openstack node customization
 * Fix appending nil class to string
 * Add support for customization
 * Implement networking support. No floating IPs yet
 * Fix syntax error in `add_network_port`
 * Add initial network handling
 * Initial implementation of openstack provider

## [vsphere]
 * Reword `apikey` keyword to `provider_pubkey_hash`
 * Add automatic public key hash retrieval so that `provider_pubkey_hash` is
   optional


# 0.0.20 29.06.2015

## [vsphere]
 * Fix NIC creation in VCenters with multiple DCs -> `:datacenter =>
   vm.datacenter` is passed during NIC creation
   [CLOUDDOPE-891](https://issue.swisscom.ch/browse/CLOUDDOPE-891)

# 0.0.20 23.06.2015

## [parser]
 * Improved network definition checks in infrastructures. They are checked as
   in case they are defined thus baremetal may have network definitions as well
   for future

# 0.0.19 23.06.2015

## [parser]
 * Make infrastructure credentials optional (defaults to `nil`)
 * Make infrastructure endpoint optional (defaults to `nil`)
 * Do not check for network definitions when the provider is *baremetal*

## [baremetal]
 * Fix wrong number of parameters error

# 0.0.18 18.06.2015

## [ovirt]
 * Support provisioning mechanism, i.e. tnin and/or thick provisioning of data
   disks [CLOUDDOPE-873](https://issue.swisscom.ch/browse/CLOUDDOPE-873)

# 0.0.17 17.06.2015

## [baremetal]
 * Fix missing provider file for  metal infrastructures
   [CLOUDDOPE-828](https://issue.swisscom.ch/browse/CLOUDDOPE-828)

# 0.0.16 05.06.2015

## [parser]
 * Make `interfaces` and `image` of a node configuration hash optional

## [baremetal]
 * New provider for bare metal infrastructures
   [CLOUDDOPE-828](https://issue.swisscom.ch/browse/CLOUDDOPE-828)

# 0.0.15 08.05.2015

## [vsphere]
 * Fix removal of empty interface list in add_interfaces
   [CLOUDDOPE-732](https://issue.swisscom.ch/browse/CLOUDDOPE-732)

# 0.0.14 05.05.2015

## [general]
 * Fixed `can't convert nil into String` when no disk db file is given
   [CLOUDDOPE-723](https://issue.swisscom.ch/browse/CLOUDDOPE-723)

# 0.0.13 01.05.2015

## [general]
 * Updated fog to 1.29.0
 * Updated rbovirt to upstream@f4ff2b8daf89
 * Removed obsolete deployment plans
 * Added new example deployment plans

## [parser]
 * Added support for `virtual_switch`
 * Updated error messages in `plan.rb`
 * Fixed handling of `ip` record of a node

## [vsphere]
 * Added support for DVS -> the DV switch is defined by `virtual_switch`
   property

# 0.0.12 28.04.2015

## [parser]
 * Added support for `dest_folder`

## [rbovirt]
 * None

## [vsphere]
 * Added support for `dest_folder`
 * Added support for `default_pool`
