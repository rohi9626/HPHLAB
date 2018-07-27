provider "vsphere" {
	user			            = "${var.username}"
	password	       	    = "${var.password}"
	vsphere_server		    = "${var.vcenter}"
	allow_unverified_ssl 	= true
}

data "vsphere_datacenter" "datacenter" {
  name = "KUMARDC01"
}

data "vsphere_distributed_virtual_switch" "dvs" {
  name          = "exNet"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

resource "vsphere_distributed_port_group" "pg" {
  name                            = "3130751-Server-VLAN10"
  distributed_virtual_switch_uuid = "${data.vsphere_distributed_virtual_switch.dvs.id}"

  vlan_id = 10
}

resource "vsphere_distributed_port_group" "pg1" {
  name                            = "3130751-DEV-VLAN160"
  distributed_virtual_switch_uuid = "${data.vsphere_distributed_virtual_switch.dvs.id}"

  vlan_id = 160
}

resource "vsphere_distributed_port_group" "pg2" {
  name                            = "3130751-STG-VLAN170"
  distributed_virtual_switch_uuid = "${data.vsphere_distributed_virtual_switch.dvs.id}"

  vlan_id = 170
}

resource "vsphere_distributed_port_group" "pg3" {
  name                            = "3130751-PROD-VLAN180"
  distributed_virtual_switch_uuid = "${data.vsphere_distributed_virtual_switch.dvs.id}"

  vlan_id = 180
}

resource "vsphere_distributed_port_group" "pg4" {
  name                            = "3130751-PCI1-VLAN190"
  distributed_virtual_switch_uuid = "${data.vsphere_distributed_virtual_switch.dvs.id}"

  vlan_id = 190
}

resource "vsphere_distributed_port_group" "pg5" {
  name                            = "3130751-PCI2-VLAN200"
  distributed_virtual_switch_uuid = "${data.vsphere_distributed_virtual_switch.dvs.id}"

  vlan_id = 200
}