provider "vsphere" {
	user			        = "${var.username}"
	password	       	    = "${var.password}"
	vsphere_server		    = "${var.vcenter}"
	allow_unverified_ssl 	= true
}

variable "esxi_hosts" {
  default = [
    "esxi1",
    "esxi2",
  ]
}

variable "network_interfaces" {
  default = [
    "vmnic0",
    "vmnic1",
    "vmnic2",
    "vmnic3",
    "vmnic4"
    "vmnic5"
    "vmnic6"
    "vmnic7"
  ]
}

data "vsphere_datacenter" "datacenter" {
  name = "KUMARDC01"
}

resource "vsphere_distributed_virtual_switch" "dvs" {
  name          = "terraform-test-dvs"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"

  uplinks         = ["uplink1", "uplink2", "uplink3", "uplink4","uplink5","uplink6","uplink7","uplink8"]
  active_uplinks  = ["uplink1", "uplink2","uplink3","uplink4"]
  standby_uplinks = ["uplink5", "uplink6","uplink7","uplink8"]

  host {
    host_system_id = "${data.vsphere_host.host.0.id}"
    devices        = ["${var.network_interfaces}"]
  }

  host {
    host_system_id = "${data.vsphere_host.host.1.id}"
    devices        = ["${var.network_interfaces}"]
  }
}