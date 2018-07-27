provider "vsphere" {
	user			            = "${var.username}"
	password	       	    = "${var.password}"
	vsphere_server		    = "${var.vcenter}"
	allow_unverified_ssl 	= true
}

data "vsphere_datacenter" "datacenter" {
  name = "DC-A-1"
}

data "vsphere_distributed_virtual_switch" "dvs" {
  name          = "exNet"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

resource "vsphere_distributed_port_group" "pg" {
  name                            = "terraform-test-pg"
  distributed_virtual_switch_uuid = "${data.vsphere_distributed_virtual_switch.dvs.id}"

  vlan_id = 20
}